$path = ".\content\posts"  # Adjust to your Hugo content path
$files = Get-ChildItem -Path $path -Filter "*.md"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # Extract front matter
    if ($content -match "(?s)^---(.*?)---") {
        $frontMatter = $matches[1].Trim()  # Remove leading/trailing spaces/newlines
    }
    else {
        Write-Host "Skipping $($file.Name): No front matter found."
        continue
    }

    # Ensure we only have ONE "tags:" section
    $frontMatter = $frontMatter -replace "(?ms)tags:\s*\[.*?\]", ""

    # Extract existing tags
    $tagsMatch = $frontMatter -match "tags:\s*\n((\s+-\s+[^\n]+\n)*)"
    $existingTags = if ($tagsMatch) { 
        [regex]::Matches($matches[1], "^\s*-\s*(.+)$", "Multiline") | ForEach-Object { $_.Groups[1].Value } 
    }
    else { @() }

    # Extract tags from {{< tag tag="..." >}} shortcodes
    $tagPattern = '{{<\s*tag\s+tag="([^"]+)"\s*>}}'
    $newTags = [regex]::Matches($content, $tagPattern) | ForEach-Object { $_.Groups[1].Value }

    # Merge & remove duplicates
    $allTags = ($existingTags + $newTags) | Sort-Object -Unique

    if ($allTags.Count -gt 0) {
        # Format tags properly in YAML format
        $tagsYaml = "tags:`n" + ($allTags -join "`n  - ")
        $tagsYaml = "tags:`n  - " + $tagsYaml.TrimStart("tags:`n")

        # Replace or add tags in front matter
        if ($tagsMatch) {
            $updatedFrontMatter = $frontMatter -replace "tags:\s*\n((\s+-\s+[^\n]+\n)*)", $($tagsYaml + "`n")
        }
        else {
            $updatedFrontMatter = "$frontMatter`n$tagsYaml"
        }

        # Replace front matter in the content (keeping correct format)
        $updatedContent = $content -replace "(?s)^---(.*?)---", "---`n$updatedFrontMatter`n---"

        # Save the file (ensure no extra newlines)
        $updatedContent.TrimEnd() | Set-Content $file.FullName
        Write-Host "Updated tags in $($file.Name): $($allTags -join ', ')"
    }
}
