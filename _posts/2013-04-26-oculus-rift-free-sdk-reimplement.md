---
author: robmyers
comments: true
date: 2013-04-26 12:49:17+00:00
layout: post
slug: oculus-rift-free-sdk-reimplement
title: Oculus Rift SDK Free Software Re-Implementation
wordpress_id: 2303
categories:
- Free Software
---

The proprietary Oculus Rift SDK doesn't yet support GNU/Linux. When it does so, it will still not be possible to use it as part of a free software system. A replacement free software SDK will need to be created. This requires two bits of information. Firstly, the projections required to map rendered imagery for use in the eyepiece displays. And secondly, the format that the position sensor data is encoded in when sent over USB.

The projections have been incorporated into the Javascript 3d.js library, but the proprietary Oculus SDK was referenced for this, so I'm not sure how clean room it is or whether that's an issue. *If* it's OK to refer to, it's here:

[https://github.com/mrdoob/three.js/blob/master/examples/js/effects/OculusRiftEffect.js](https://github.com/mrdoob/three.js/blob/master/examples/js/effects/OculusRiftEffect.js)

If it's not OK to refer to, presumably the projections can be worked out by analysing the physical properties of the developer kit.

The head position sensor data is something I can sniff from my dev kit. I'll do that soon.
