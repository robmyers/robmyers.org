---
author: robmyers
comments: true
date: 2013-12-19 18:01:53+00:00
layout: post
slug: how-paintr-works
title: How paintr Works
wordpress_id: 2473
categories:
- Art Computing
- Generative Art
- Projects
---

paintr came to me very quickly just before my show in Belgrade in 2005. Originally intended as an artistic web service, it ended up as "art for the age of web services". The original went offline when I switched web hosts a few years ago. Updating it from its php-and-blog 2005 version to a 2010s cloud-based node.js and tumblr version made sense conceptually.

paintr is a simple implementation of a naive model of how art is made. An artist is motivated by aesthetic concerns to find imagery to hang those concerns off of and thereby presents a work in a signature style. paintr finds a recent palette on colr.org, searches for the words that palette is tagged with on flickr, autotraces the image to simplify and abstract it, and then applies the palette to the results randomly.

This abstracts and unifies the image, obviously aestheticising and transforming it. The result is a kind of Stella-ish artistic ironisation of a verbal description of art. It's also often fun to look at.

[http://paintr-rebooted.tumblr.com/](http://paintr-rebooted.tumblr.com/)
