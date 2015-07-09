---
author: robmyers
comments: true
date: 2014-01-18 21:21:08+00:00
layout: page
slug: facecoin
title: Facecoin
permalink: /facecoin/
wordpress_id: 2488
---

![facecoin](/assets/2014/01/facecoin-1024x671.png)
**Facecoin, 2014, HTML5 and JavaScript.**

[Click here](/assets/2014/01/facecoin.html) to run a visualization in your web browser.

Part of the Coins project.

Cryptocurrencies such as Bitcoin use a "proof of work" system to prevent abuse.

Artworks are proofs of aesthetic work.

Facecoin uses machine pareidolia as its proof of work. This is implemented by applying CCV's JavaScript face detection algorithm to SHA-256 digests represented as greyscale pixel maps. An industrial-strength version would use OpenCV. Due to the limitations of face detection as implemented by these libraries, the digest pixel map is upscaled and blurred to produce images of the size and kind that they can find faces in.

The difficulty can be varied by altering the size and blur of the pixmap. Or by only allowing particular detected face bounds rectangles to be used a set number of times.

You can download the source here: [https://gitorious.org/robmyers/coins/](https://gitorious.org/robmyers/coins/).


