---
author: robmyers
comments: true
date: 2013-12-19 17:54:03+00:00
layout: post
slug: how-draw-something-works
title: How draw-something Works
wordpress_id: 2472
categories:
- Art Computing
- Generative Art
- Projects
---

The version of draw-something on tumblr is a simple model of creative drawing. It's meant to be a minimally defensible model of art, although probably a pre-postmodern art.

The program generates some random points (between 4 and 20, as these seemed like good numbers) and joins them in the order that they are generated as a polyline.

It finds the topmost point of the polyline and positions the pen a little way above it. Then it draws around the polyline, moving forward a little each time and being careful not to get too close to or too far away from it. As the program is simulating human drawing it drifts a little in direction each time. When the outline returns to be close enough to its original point, the drawing stops. The quality of the resulting line is a product of each of these factors.

This drawing model was informed by research into human hand movement but mostly it was derived from watching myself draw. This is a difficult thing to do, as drawing isn't a very conscious activity. Eventually I would start drawing a line, stop myself, and try to think about what I'd been doing. This 

The original inspiration for draw-something was Harold Cohen's AARON, but draw-something's output has never resembled AARON's as both the task that the programs attempt and the way they approach it are different.

[http://draw-something-rebooted.tumblr.com](http://draw-something-rebooted.tumblr.com)
