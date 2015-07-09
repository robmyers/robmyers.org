---
author: robmyers
comments: true
date: 2008-01-22 08:38:41+00:00
layout: post
slug: draw-something-debugging
title: draw-something Debugging
wordpress_id: 1566
categories:
- Generative Art
- Projects
---

After debugging draw-something quite majorly last year and adding the framework for its future development I thought I had captured all the embarrassing bugs (like drawing things twice...). But I'd missed a bug in my random-point-on-line code that generated points off the end of the line. So draw-something was lovingly generating most of the drawing off the edge of the canvas.  
  
Working around this has improved the drawings that draw-something creates, here are two I have selected:  
  
![drawing-20080121-233101.png](/wp-content/uploads/2008/01/drawing-20080121-233101.png)  
  
![drawing-20080121-233324.png](/wp-content/uploads/2008/01/drawing-20080121-233324.png)  
  
Now I can start giving draw-something heuristics for deciding what kind of elements should go where, and when.  


