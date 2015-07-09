---
author: robmyers
comments: false
date: 2005-04-13 04:56:02+00:00
layout: post
slug: what-is-a-hole
title: What Is A Hole?
wordpress_id: 384
categories:
- Generative Art
---

What is a hole? More specifically, what should [draw-something](http://rob-art.sourceforge.net/) do to draw a hole in an existing shape?  
  
A quick look at [Canto](/art/canto) or [Blobs](/art/blobs) shows how I think of holes. They're, well, holes, usually related to the exterior form rather than an unrelated shape that just so happens to be inside the other shape.  
  
The current drawing algorithm generates an outline at a set distance from the closest line in a set of lines. This gives draw-something two possible forms to draw inside, the "skeleton" (the set of lines) and the drawn outline. If the lines were a convex hull (as they sometimes are), there are a set of points inside the shape that could be used to generate holes skeletons. But sometimes the lines are random, complete with concavities, so this might not always work. So generating a skeleton for a hole to be drawn relative to isn't simple.  
  
And then there's the question of how to draw holes relative to the skeleton. I'd imagine that the outline of a hole is drawn inside its skeleton. This would require a different drawing algorithm, one that can handle gaps being too small to draw through, and that is happy crossing skeleton lines. Drawing outside a hole skeleton has its own problems. It seems counter-intuitive, and might result in the hole being drawn outside the exterior outline.  
  
I don't think AARON is much help here. 1970s AARON draws holes the same way it draws forms, one section at a time without a skeleton. Later AARONs don't draw holes that I can see, interior forms such as eyes and mouths are positive features.  
  
So I'm drawing holes by hand, trying to understand this. 

  


