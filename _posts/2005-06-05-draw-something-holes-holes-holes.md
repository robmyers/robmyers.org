---
author: robmyers
comments: true
date: 2005-06-05 09:00:05+00:00
layout: post
slug: draw-something-holes-holes-holes
title: 'draw-something: holes, holes, holes'
wordpress_id: 463
categories:
- Projects
---

  
draw-something already draws holes.  


  
It draws holes in a rectangle, the rectangular ground of the format. We just see them as figures.  


  
Those figures can extend outside the ground, but that is a conceptual wart. They should be limited by the bounds of the format, which is easy enough to do.  


  
They are drawn outside their skeleton, which means that holes holes should be as well. I didn't like this idea, but it solves two problems. If the skeleton is a polyline, how do we  draw 'inside' the end lines if they don't join. And if the skeleton is a single point, how do we draw inside that? Always drawing outside solves both problems.  


  
If we always draw outside, either the skeleton's points must always be far enough from their enclosing form that they won't intersect it, or the drawing algorithm must be capable of handling cases where the line of the skeleton is coincident with the line of the enclosing form.  


  
So. The next point on a drawing must be:  


  
> minimum distance outside the 'hole' poly (the skeleton)  
  
> minimum distance inside the 'figure' poly (the ground or the parent figure)  


  
  


  
Which means the points of the hole poly must be > minimum distance *2 from the 'figure' poly, or we drop the minimum distance and either go for a max either side or a max only?  


  


