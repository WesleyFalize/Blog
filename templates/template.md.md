---
author:
  - Wesley Falize
title: <% tp.file.title %>
date: <% tp.date.now('YYYY-MM-DD') %>
description: <%* const desc = await tp.system.prompt('Enter a description'); tR += desc; %>
summary: <%* const sum = await tp.system.prompt('Enter a summary'); tR += sum; %>
tags:
  - <%*
  - const
  - tag1
  - =
  - await
  - tp.system.prompt('Enter
  - a
  - tag');
  - tR
  - +=
  - tag1;
  - "%>"
  - <%*
  - const
  - tag2
  - =
  - await
  - tp.system.prompt('Enter
  - another
  - tag');
  - tR
  - +=
  - tag2;
  - "%>"
categories:
  - <%* const cat1 = await tp.system.prompt('Enter a category'); tR += cat1; %>
  - <%* const cat2 = await tp.system.prompt('Enter another category'); tR += cat2; %>
series:
  - <%* const series = await tp.system.prompt('Enter series name'); tR += series; %>
ShowToc: true
TocOpen: false
draft:
---

# <% tp.file.title %>

