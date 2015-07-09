---
author: robmyers
comments: true
date: 2006-07-22 08:00:57+00:00
layout: post
slug: chordinator-sort-by-value
title: Chordinator - Sort By Value
wordpress_id: 1050
categories:
- Generative Art
- Projects
---

  
This version sorts by value (brightness - saturation), but still only alters brightness. The effects are good, although some colours are obviously too saturated for their position. Possibly saturation needs linearising as well. So the dark blue in the first palette below looks too dark for its position (it isn't, but it is too saturated), and the magenta in the palette below it looks too bright (again, it isn't, but the saturation is out of position).  


  
[![200607212144-1](/wp-content/uploads/2006/07/200607212144-1-tm.jpg)](/wp-content/uploads/2006/07/200607212144-1.jpg)  


  
[![200607212145](/wp-content/uploads/2006/07/200607212145-tm.jpg)](/wp-content/uploads/2006/07/200607212145.jpg)  


  
I tried linearising the saturation as well but that looked too bland. I'll try it again, but looking at the illustrations in "Colouring Without Seeing" I think the colours in figure 16 have the same quality of occasional intensity mismatches. Or possibly its just the greater difference in colour between those colours and their neighbours.  


  
Much better. I now need to add the conceptual colour stuff from **ae **and** cybernetic**, beef up the slipnet and assign colour values to the colour names. This will allow the colours to be chosen referentially and relationally rather than randomly.  


  
When I roll this code back into draw-something the colours from the palette will be applied to the shapes in a  drawing by varying them conceptually (tint/tone scales and shadow/midtone/highlight-type application). The palette will be organised something like plane/object/group/item, with each stage adding a function to be composed to get the final value (I'm using closures like a real Lisp programmer now! :-) ).  


  


