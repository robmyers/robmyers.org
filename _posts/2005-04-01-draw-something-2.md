---
author: robmyers
comments: false
date: 2005-04-01 07:26:15+00:00
layout: post
slug: draw-something-2
title: draw-something
wordpress_id: 369
categories:
- Projects
---

I refactored draw-something to be an ASDF package. Which means it's easier to load and debug in slime.  
  
If that last line meant nothing to you, nor will the next few. :-)  
  
I used OpenMCL's profiling to find the bottlenecks in the code that are slowing down execution when drawing around more than a few lines. No surprises: (nearest-point-on-line) and (distance) cons heavily. So I've changed polyline to use arrays rather than lists and moved any object creation and moved any accessor calls as far out as possible. Hopefully this will get things moving faster when I finish debugging it (Lisp's "do" loop is horrible).  
  
I can optimise the distance search by storing some working out each time, or I can move to a mixed vector/bitmap implementation. I wonder if AARON still uses bitmaps and cells? 

  


