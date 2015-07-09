---
author: robmyers
comments: true
date: 2008-03-08 04:34:47+00:00
layout: post
slug: on-purpose
title: On Purpose
wordpress_id: 1584
categories:
- Generative Art
- Projects
---

The finished implementation of the line drawing algorithm from Harold Cohen's essay "[On Purpose](http://crca.ucsd.edu/~hcohen/)" [can be found here](http://rob-art.cvs.sourceforge.net/rob-art/rob-art/ben/on-purpose-line.lisp?revision=1.1&view=markup). You'll need a Lisp system such as SBCL to run it, the output images can be viewed with Gimp.  
  
I am not happy with my implementation of the algorithm. I don't think the "homing" functionality is robust or elegant enough, and it interacts with the angular limit code in a way that sometimes requires turns greater than the pen should allow.  
  
But writing it has been a wonderful exercise in art computing historical investigation. I have learnt a lot, and gained a new appreciation for both the techniques and results of Cohen's earliest art computing work.  
  
If anyone can suggest a better homing algorithm and a better way of choosing each phases's parameters let me know.  


