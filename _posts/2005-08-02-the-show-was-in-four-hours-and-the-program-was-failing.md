---
author: robmyers
comments: true
date: 2005-08-02 07:43:19+00:00
layout: post
slug: the-show-was-in-four-hours-and-the-program-was-failing
title: The Show Was In Four Hours And The Program Was Failing
wordpress_id: 597
categories:
- Projects
---

  
I sat in the gallery, using its wireless network connection. As I formatted up images for my talk, something was nagging at my brain. I looked up at draw-something, projected on the wall to my left. A complete image, no problems. After a couple more minutes in GImp, I got that nagging feeling again. Looking up, I saw that draw-something was still showing the same image.  


  
I counted to twenty. Same image. Another twenty. Same image. They're only meant to display for twenty seconds once drawn.  


  
So I started hacking the copy of the code on my iBook. Maybe I could add a limit to the number of steps the code would take around its guide shape when drawing. I compiled it, it ran, I popped the new version onto the PowerBook driving the projector.  


  
Back to Gimp. But after a while draw-something jammed again. So I went through the code, eventually realising that I'd put a counter increment in the wrong place. I moved it into position, set the count to a ridiculously low value to watch it work, and then set it back to 5000 when it did.  I compiled it, it ran, I popped the new version onto the PowerBook driving the projector again.  


  
This version would occasionally fail to complete a drawing, but it now drew the failure, rather than just jamming. Hopefully this will help me work out why the drawing process sometimes fails. And hopefully it will interest viewers in the gallery.  


  


Technorati Tags: [generative art](http://technorati.com/tag/generative art)

  


