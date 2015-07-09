---
author: robmyers
comments: true
date: 2012-11-26 18:36:07+00:00
layout: post
slug: gnulinux-kobo-build-environment-setup
title: GNU/Linux Kobo Build Environment Setup
wordpress_id: 2272
categories:
- Free Software
- Howto
---

I've bought a Kobo Touch ebook reader device to hack on.

This guide to setting up a build environment for the Kobo is good:

[http://www.mobileread.com/forums/showthread.php?p=2176378#post2176378](http://www.mobileread.com/forums/showthread.php?p=2176378#post2176378)

The only change I've found you have to make to build the examples is to add:

`LIBS += -lpng -lz`

to the Qt project (.pro) file in Sketch.

The build system defaults to 4.6.2. It's possible to change the build scripts to use Qt 4.8 (`grep -r 4.6 ~/kobo/KoboLabs/build/*` and change occurrences of 4.6.2 to 4.8, then update the ./configure line). Both are on the device so using 4.6.2 is fine.

I'd like to replace Sourcery G++ with something without a EULA.
