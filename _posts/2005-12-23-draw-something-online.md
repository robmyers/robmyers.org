---
author: robmyers
comments: true
date: 2005-12-23 07:06:14+00:00
layout: post
slug: draw-something-online
title: Draw Something Online
wordpress_id: 765
categories:
- Projects
---

  
I've been trying to hack up a version of draw-something to run in a web page. ABCL is a Java Lisp interpreter that will load and run draw-something more or less unmodified, but it's either too slow or the mathematics handling is too different and I can't debug that.  


  
So I'm going to take a leaf out of Kurzweil's book and do a Java renderer for draw-something's output. I'll generate a number of draw-something drawings and let the renderer draw them. It will look like the screen-based version of draw-something. The only difference will be the de-coupling of the generation and drawing code. It still feels like a big difference, though.  


  


Technorati Tags: [generative art](http://www.technorati.com/tag/generative art)

  


