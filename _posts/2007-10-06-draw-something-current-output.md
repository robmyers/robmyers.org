---
author: robmyers
comments: true
date: 2007-10-06 06:38:21+00:00
layout: post
slug: draw-something-current-output
title: draw-something Current Output
wordpress_id: 1500
categories:
- Generative Art
- Projects
---

![drawing-20071005-202749.png](/wp-content/uploads/2007/10/drawing-20071005-202749.png)  
  
I'm very pleased with how draw-something is performing at the moment. The debugging that resulted from the improved logging and the pen parameters system means that it is now at least not working in the way it is meant to, rather than doing some things twice and others not at all.  
  
The current look is due to the colouring system based on AARON's new colouring system, the varied drawing styles enabled by pen-parameters, and the compositional tightness enabled by all forms being created from an initial, shared, set of points.  
  
The colouring system needs more debugging and the composition system needs tuning up. In particular; colour application, particularly to the background, needs fixing. I want to add stars, non-self-intersecting random walk lines and circles to the repertoire of shapes. I want to make some shapes specifically smaller and larger, either growing to include nearest points or using only the points in a small area. And I want to limit kinds of shapes to various areas of the composition.  
  
One of the things that is sorely lacking in draw-something is decision making. The actual drawing of outlines is a continuous process of deciding where the pen should go next, but the forms that the pen is drawing around are laid out randomly. In the long term I want draw-something to start with a few basic shapes and then build up from them, relating them and adorning them. But that is in the long term.  


