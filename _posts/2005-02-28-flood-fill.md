---
author: robmyers
comments: false
date: 2005-02-28 04:44:32+00:00
layout: post
slug: flood-fill
title: Flood Fill
wordpress_id: 334
categories:
- Generative Art
---

The algorithm that draw-something uses to outline object skeletons is basically a wall-following pathfinding algorithm such as a simple maze-running robot might use. I didn't just use an algorithm "off the shelf", I painstakingly developed one myself. For draw-something's painting algorithm I'm definitely getting something off the shelf. I'm looking at adapting a stack-based flood-filling algorithm to fill the outlining algorithm's lines with colour. Hopefully I can get something that looks similar to how I colour images without re-inventing the wheel.  
  
AARON's painting algorithm (from the screensaver) looks like a modified flood-fill, only with various constraints appropriate to physical paint. Maybe I will imitate this later, but for now I just want to get something colouring on-screen.

  


