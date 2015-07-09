---
author: robmyers
comments: true
date: 2013-12-19 06:28:42+00:00
layout: post
slug: draw-something-rebooted
title: draw-something Rebooted
wordpress_id: 2470
categories:
- Art Computing
- Free Software
- Generative Art
- Projects
---

![draw-something](/assets/2013/12/draw-something-1024x647.png)

A new old version of draw-something is now online.

You can see it (and follow it on tumblr!) here: [http://draw-something-rebooted.tumblr.com/](http://draw-something-rebooted.tumblr.com/)

draw-something started as a Prolog program called "Got To Start Somewhere", which described both its algorithm and how I was feeling about art at the time. I quickly switched to Common Lisp, but once one of the earliest versions was working I created an ActionScript port to run online. This was made using a Free Software ActionScript compiler rather than Flash.

I wanted to show draw-something running for a talk [Jim Andrews](http://paintr-rebooted.tumblr.com/) invited me to give, and I wanted an excercise in JavaScript, so I ported the ActionScript to node.js and to HTML5 canvas. Doing this and preparing for the talk inspired me to resurrect paintr as well.

It's such an old version of draw-something that it has a couple of bugs that were later fixed. I fixed the most egregious one but there's another that will crop up soon, finding it is left as an exercise for the audience. I also re-enabled the skeleton drawing code (the skeleton is the guide figure that draw-something draws around), using non-repro blue instead of the original bright red.

So welcome back draw-something online!
