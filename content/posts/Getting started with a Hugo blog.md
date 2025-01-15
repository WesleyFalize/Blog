---
author: ["Wesley Falize"]
title: "Getting started with a Hugo blog"
date: "2025-01-13"
description: ""
summary: ""
tags: ["Hugo", "Blog"]
categories: ["Blog", ""]
series: ["Getting started with a blog"]
ShowToc: true
TocOpen: false
---
# Getting started with a Hugo blog
Getting started with a Hugo blog was an endeavor I've started a couple of times. Since i started working within Microsoft 365 I've been interested in sharing my knowledge. Mainly due to some popular bloggers and the insane amount of knowledge they can share. In the past I've tried blogging with a few amazing technologies because they we're interesting to me. I've dabbled in NextJS, done some stuff with React and tried Gatsby for some static site rendering. This was all an amazing learning experience but i missed the underlying knowledge and always tried to over engineer this. Then i stepped upon Hugo, which was a few years ago. It seemed so simple and i was able to whip up a site within 10 minutes through templates and an instruction. This felt like magic. However i fell down in my own trap and tried to over engineer this site and get everything in there, a profile page, my resume, amazing search functionality. This caused me to not start actually blogging and it stayed in the development phase.
# What is different this time?
This time I'm doing a few things different, these are related to technical depth, writing workflow and the reason to write.
## Technical depth
I've chosen one of the most popular Hugo templates to start with. This caused there to be a lot of documentation out there to start with. The Hugo Papermod template is amazing from the start and very easily customizable
## Writing workflow
Initially writing in markdown caused a lot of issues, it felt clunky and difficult. for my Personal Knowledge Management I've been using Obsidian for some time now and it's amazing and i don't notice I'm working with markdown. This in combination with some templating allows me to easily create pages and publish them to the world!
## Reason to write
Initially my reason to write was to become part of the Microsoft 365 community and in essence profile myself to potential employers. Now my reasoning is a lot more intrinsic that i want to document my work and make it available to others to discuss about and learn from to community whilst giving.
# How is my current blog setup
The blog is currently setup very simple. It's making use of the following components, which i will go into depth a bit later.
- Hugo - Papermod Theme
- Github
- Obsidian
	- Templater plugin
- GitHub Pages
## Hugo
I've started with a simple Hugo project and followed the documentation from the Papermod Theme to get started. Which was as simple as following the installation guide: [Installation · adityatelange/hugo-PaperMod Wiki](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation) and within 5 minutes the Hugo site was running locally. What i needed to do to get it working was create two pages, called Archives and search with the information found and had to adjust my config.yaml to add some information regarding my specific use cases. This was as simple as it could be.
## GitHub
Getting started and pushing the repository to GitHub was simple. I've published the code directly from Visual Studio code and created a new respository.
## Obsidian
[Obsidian - Sharpen your thinking](https://obsidian.md/) Is an amazing tool. I've used it to visualize my personal knowledge management to a far greater extend then I ever imagined. But in the essence it's also a great markdown editor. Editing the metadata is very simple ![Obsidian metadata example](assets/ObsidianMetadataExample.png)
## Templater
Another great feature i've been using is a community plugin called Templater. This allows me to create the markdown files with the correct frontmatter (the metadata) every time. I've got the following MD setup to get it working but it can be simplified a great deal if required.
```yaml
---
author: ["Wesley Falize"]
title: "<% tp.file.title %>"
date: "<% tp.date.now('YYYY-MM-DD') %>"
description: "<%* const desc = await tp.system.prompt('Enter a description'); tR += desc; %>"
summary: "<%* const sum = await tp.system.prompt('Enter a summary'); tR += sum; %>"
tags: ["<%* const tag1 = await tp.system.prompt('Enter a tag'); tR += tag1; %>", "<%* const tag2 = await tp.system.prompt('Enter another tag'); tR += tag2; %>"]
categories: ["<%* const cat1 = await tp.system.prompt('Enter a category'); tR += cat1; %>", "<%* const cat2 = await tp.system.prompt('Enter another category'); tR += cat2; %>"]
series: ["<%* const series = await tp.system.prompt('Enter series name'); tR += series; %>"]
ShowToc: true
TocOpen: false
---

# <% tp.file.title %>


```

## GitHub pages
After struggling for quite some time with Azure Static sites I went to GitHub pages because it was more documented and helped me solve errors more easily. With my current theme i had a lot of difficulties with the Hugo version causing issues as my theme needs a newer version then the default GitHub Actions. My site is visible [WesleyFalize/Blog](https://github.com/WesleyFalize/Blog)/ and it's a very simple blog that's being pushed with a GitHub Action after enabling GitHub Pages on the site. I had to do some work with ChatGPT to get the YAML to work but in the end this is my yaml:
```yaml
# Sample workflow for building and deploying a Hugo site to GitHub Pages
name: Deploy Hugo site to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches:
      - main

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

# Default to bash
defaults:
  run:
    shell: bash

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.140.2
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb \
          && sudo dpkg -i ${{ runner.temp }}/hugo.deb          
      - name: Install Dart Sass
        run: sudo snap install dart-sass
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
      - name: Install Node.js dependencies
        run: "[[ -f package-lock.json || -f npm-shrinkwrap.json ]] && npm ci || true"
      - name: Build with Hugo
        env:
          HUGO_CACHEDIR: ${{ runner.temp }}/hugo_cache
          HUGO_ENVIRONMENT: production
          TZ: America/Los_Angeles
        run: |
          hugo \
            --gc \
            --minify \
            --baseURL "${{ steps.pages.outputs.base_url }}/"          
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  # Deployment job
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```
I might need to adjust some items regarding the TZ in the ENV variables but for now the site is working. The learning curve for the YAML files was pretty steep and it was also difficult to troubleshoot with AI. I've felt that I've spend more time on troubleshooting getting the site deployed then i had in setting up the whole infrastructure upfront.

# Final thoughts

Starting a blog with Hugo has been an enlightening journey filled with learning and exploration. My previous attempts at blogging often ended in over-engineering, but this time, I approached it with simplicity and clarity in mind. Here's a quick recap of my experience and setup:
## Journey to Simplicity
In the past, I've experimented with various web technologies like NextJS, React, and Gatsby. While these platforms offered powerful features, they also led me down the path of complexity. Hugo, on the other hand, provided a refreshing simplicity that allowed me to set up a site quickly without getting bogged down in technical intricacies.
## Lessons Learned
### Technical Depth
Choosing a popular Hugo template like Papermod was a game-changer. It came with extensive documentation and community support, making customization straightforward.
### Writing Workflow
Initially struggling with markdown editing, I found Obsidian to be an effective tool for managing my writing process. Its integration with markdown felt seamless and intuitive.
### Reason to Write
My motivations shifted from seeking external validation within the Microsoft 365 community to documenting my work for personal fulfillment and knowledge sharing.
## Current Blog Setup
- **Hugo - Papermod Theme**: Easy setup following comprehensive documentation.
- **GitHub**: Repository management through Visual Studio Code.
- **Obsidian**: For drafting and organizing content efficiently using plugins like Templater.
- **GitHub Pages**: Overcame initial deployment challenges by leveraging GitHub Actions for continuous deployment.

## Deployment Insights
The transition from Azure Static sites to GitHub Pages simplified troubleshooting thanks to better documentation. Despite some challenges in configuring YAML for deployment workflows, the overall process is now streamlined.

## Final Thoughts
This experience taught me the value of starting simple and focusing on content creation rather than getting lost in technical complexities. By leveraging tools that complement each other well—like Hugo's lightweight nature combined with Obsidian's robust editing capabilities—I am now able to focus more on writing quality content that can benefit others.

As I continue this blogging journey, my goal remains clear: To share insights, foster discussions within the tech community, and document my learning experiences along the way.