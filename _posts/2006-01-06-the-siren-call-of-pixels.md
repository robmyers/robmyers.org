---
author: robmyers
comments: true
date: 2006-01-06 06:07:26+00:00
layout: post
slug: the-siren-call-of-pixels
title: The Siren Call Of Pixels
wordpress_id: 773
categories:
- Generative Art
- Projects
---

  
draw-something is vector graphics based. Everything is lines. I like vector graphics, I feel it's my medium. But this implementation has the problem that every line added to the drawing makes calculating distances between parts of the drawing more complex. It adds a lot of lines, one per pixel or so. Every time I think about this, I think that I should be using a pixel-based approach like AARON, where adding a new element to the drawing can never increase the complexity above the level of detail the pixels start at.  


  
AARON is pixel based. Early (and recent?) versions draw directly into a pixel map, I think that the versions that use recognisable objects project outlines onto the pixel map from a 3D vector graphics space. It's a multi-dimensional pixel map, each pixel stores information about which figure it belongs to and where the drawing through it is going.  


  
I could optimise draw-something using bounding boxes, "fat lines" along the lines of the polyline and other techniques. I could handle shape clipping by linking intersection points on outlines to the outlines they intersect. These are all game programming optimisations, and they should work well.  


  
So I'm torn. draw-something is inspired by AARON and having a pixel layer would solve a lot of problems. And any given vector image will be rendered on a picel-based device for viewing. But sticking with vectors feels purer for what I want to do and may have different possibilities.  


  
Any advice greatly appreciated. :-)  


  


Technorati Tags: [art](http://www.technorati.com/tag/art), [artificial intelligence](http://www.technorati.com/tag/artificial intelligence), [generative art](http://www.technorati.com/tag/generative art)

  


