---
author: robmyers
comments: false
date: 2004-04-04 01:05:37+00:00
layout: post
slug: dropping-a-constraint-on-rob-art-ouch
title: Dropping A Constraint on rob-art (ouch)
wordpress_id: 108
categories:
- Projects
---

The previous images from rob-art used "convex hulls" (shapes with no inward-heading lines) to draw around. Dropping the convexity (and also the non-intersection) constraint by using a random set of points (and taking out the skeleton for the last three) gives results like this:  
![](/assets/drawing0.jpg)![](/assets/drawing1.jpg)  
![](/assets/drawing2.jpg)![](/assets/drawing3.jpg)  
  
  
There's some cases where the drawing algorithm can't find its way around such a random set of lines. It's useful to see this for debugging. You can't see it on these small images, but the lines are still slightly random as a result of the pathfinding algorithm (which is the effect I want).   
I quite like these shapes, they're like some of my early [Blobs](/art/blobs/) prototypes. The rounded corners are an emergent property of the drawing algorithm, which is nice because I wanted this effect but I hadn't worked out how to get it yet. :-)



