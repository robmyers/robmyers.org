---
author: robmyers
comments: false
date: 2005-05-01 05:59:14+00:00
layout: post
slug: how-picking-works-in-minara
title: How Picking Works In Minara
wordpress_id: 407
categories:
- Projects
---

An image is a series of drawing instructions, in other words it is a program. In Minara it is a program written in Scheme, the same Lisp dialect that Minara itself is (mostly) written in.  
  
Minara allows us to change the drawing protocol, that is it allows us to change the functions that the names of the drawing instructions actually refer to.   
  
Normally, these are functions that just draw the image to the screen.  
  
But when picking (selecting objects), the drawing protocol is swapped for the picking protocol. The picking "drawing" functions no longer draw to the screen, they calculate the position in the program that is executing when the drawing surrounds the picking point.   
  
This is incredibly inefficient. We can make it more efficient by cached the bounding boxes and other useful information for pickable shapes in a buffer variable on the document buffer. This can be given a timestamp and refreshed when the buffer changes and picking is initiated like the drawing cache for the buffer when drawing is initiated.  
  
It is also incomplete. Code that calls across the network or generates different drawing instructions each time it runs may be difficult or impossible to pick. Even code that defines functions or uses loops or iteration to draw will require redefining to pick properly. But this will just require defun and other macros to be wrapped when picking. Fortunately this is something we can do thanks to the way Minara extends Guile, the Scheme implementation that it uses.  
  
These considerations are secondary to what I believe is the elegance of the underlying picking model.

  


