---
author: robmyers
comments: false
date: 2004-05-22 09:00:00+00:00
layout: post
slug: minara-in-progress
title: Minara In Progress
wordpress_id: 155
categories:
- Projects
---

I've finished most of the object picking code I need so far, just line and curve intersection to do (these are well-known standard algorithms. The curve one I'll implement in C for speed). They'll be as sloooow as I expected: rendering the scene to find where the graphics are under the mouse then doing a text search of the image source to find this point in the program is insanely inefficient. And how we'll handle symbols and functions I don't know (keep hashtables of each and have some sort of lookup scheme, probably, with the user responsible for writing picking versions of functions as a worst case).  
  
I'm doing less well with colour. I've got LittleCMS, but the idea of having colour primaries as gamut-limit XYZA tuples means that gamut checking hopefully isn't a problem. What LCMS could be useful for is mapping the abstract percentage of the colour to the actual strength of colour on the screen or the press, which won't be linear. But I don't know if I want to do that just yet.   
  
How do we do colour picking? Make an image with percentages of each of the primaries in, display that, and update the mix when the user clicks, accepting when they double click. Who needs GUI widgets? :-)

  


