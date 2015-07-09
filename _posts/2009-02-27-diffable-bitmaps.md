---
author: robmyers
comments: true
date: 2009-02-27 23:15:14+00:00
layout: post
slug: diffable-bitmaps
title: Diffable Bitmaps
wordpress_id: 1734
categories:
- Art Computing
- Free Culture
---

Is there a bitmap image format that can be diffed for meaningful version control? If not, could one be created?  
  
SVG is a diffable vector image format that can be used in version control systems without them having to know anything about its internals. Ideally a bitmap equivalent would just be diffable as a text file, but if this isn't practical and if special tools could achieve the same results that might be acceptable.  
  
Imagine an XML (sigh) or YAML-style image format for bitmaps. Uncompressed pixel data takes up a lot of room, but the format could be compressed on disk and the diffs compressed to send over the network. This would require support for the format from VCS tools, or some sort of shadow file for the bitmap created by programs that work with it.  
  
Or imagine an image diff utility that saves diff scripts for arbitrary images and provides this information to the VCS system.  
  
Either way, the result should be meaningful, mergeable diffs for a multi-layered multi-attribute arbitrary-depth modern bitmap format(s).

