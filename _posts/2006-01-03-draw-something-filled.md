---
author: robmyers
comments: true
date: 2006-01-03 06:32:28+00:00
layout: post
slug: draw-something-filled
title: draw-something-filled
wordpress_id: 772
categories:
- Projects
---

  
The current version of draw-something uses PostScript's **fill** operator to fill the shape with flat colour. Problem solved.  


  
Or is it? Calling **fill** feels like cheating. draw-something should be colouring in, not flood filling. They are conceptually different. And they have different visual qualities. draw-something's drawing is based on my drawing, so draw-something's colouring in should be based on my colouring in.  


  
The existing fill algorithm that I like is called the boundary fill algorithm. It's a simple recursive fill. I think I could convert it from a bitmap-based system to a vector-based system using a turtle (like draw-something's pen).  


  
Something like (C pseudocode):  


  
int step = 10; // Brush width  
  
public void boundaryFill(Polyline outline, int fromX, int toX, int y, Polyline & fillOutline)  


  
{  
  
       if (! outline.intersects(fromX, y, toX, y) && // Keep inside shape  
  
           ! fillOutline.intersects(fromX, y, toX, y)) // Don't re-colour. Will get slower :-(  


  
{  


  
           fillOutline.addLine(fromX, y, toX, y);  
  
           boundaryFill(toX, y, toX + step, y); // Try next along  
  
           boundaryFill(fromX, toX - step, y); // Try previous  
  
           boundaryFill(fromX, y + yStep, toX, y + step); // Try next up  
  
           boundaryFill(fromX, y - yStep, toX, y - step); // Try next down  
  
       }  
  
   }  


  
But there are some things the system must do that a boundary fill won't:  


  
• If a section of the figure is very thin, follow it along its edge rather than scribbling left and right.  
  
• If a section of the figure is thicker than the scribble width, break it into a number of columns and rows. Fill these  diagonally top left to bottom right.  


  


Technorati Tags: [generative art](http://www.technorati.com/tag/generative art), [graphics](http://www.technorati.com/tag/graphics)

  


