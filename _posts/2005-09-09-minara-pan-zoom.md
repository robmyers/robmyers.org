---
author: robmyers
comments: true
date: 2005-09-09 05:40:27+00:00
layout: post
slug: minara-pan-zoom
title: Minara Pan & Zoom
wordpress_id: 666
categories:
- Projects
---

Pan and zoom are working a little. The concept works, which is a relief. Once I've majorly tidied up the code and written an API for getting the cursor position on the page rather than in the window they'll be done.  
  
Then I can rewrite the toy pen tool to work with that API and you'll be able to see what you're drawing when you've zoomed in. :-)  
  
I also need to put another buffer under the translate buffer to handle the window resizing. OpenGL and Minara measure positions from the bottom left-hand corner, which chanegs when you resize the window. So when you resize the window the whole image moves, which isn't right.  


