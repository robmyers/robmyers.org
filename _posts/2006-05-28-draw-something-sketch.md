---
author: robmyers
comments: true
date: 2006-05-28 06:00:08+00:00
layout: post
slug: draw-something-sketch
title: draw-something sketch
wordpress_id: 947
categories:
- Generative Art
- Projects
---

  
A code sketch for draw-something. Yes this is really how I work. The comments will be turned into code, and may or may not be kept. Ideally they won't, the code should be self-explanatory (stop laughing at the back).  

    
    ;; Simple hierachical, loop-based figure drawing.<br></br><br></br>(defmethod draw-something ()<br></br>(let ((the-drawing (make-drawing)))<br></br>(until (drawing-finished? the-drawing)<br></br>(let ((drawing-bounds (find-space-for-figure drawing)))<br></br>(if drawing-bounds<br></br>(draw-figure the-drawing drawing-bounds))))))<br></br><br></br>(defmethod drawing-finished? ((the-drawing drawing))<br></br>;; Do we have some of everything?<br></br>;; Have we covered enough of the drawing?<br></br>;; Do we have to?: Has allocating space failed or too many attempts failed?<br></br>#f)<br></br><br></br>(defmethod enough-of-everything? ((the-drawing drawing))<br></br>;; Count the number of small, medium and large objects<br></br>;; Are they >= the required amount?<br></br>#f)<br></br><br></br>(defmethod drawing-coverage ((the-drawing drawing))<br></br>;; Iterate through all the figures<br></br>;; Add the area of their bounds<br></br>;; Divide 1.0 by the area of the drawing and multiply by the figure bounds sum<br></br>#f)<br></br><br></br>(defmethod draw-figure ((the-drawing drawing) (drawing-bounds rectangle))<br></br>#f)<br></br><br></br>(defmethod find-space-for-figure ((the-drawing drawing) (required-area real))<br></br>;; Step through x, y, step 10 units or whatever<br></br>;; If inside bounds of an existing figure continue<br></br>;; Grow the ltrb bounds of the box (start at 0 w/h) 1 step each direction,<br></br>;;  stopping when each line hits a figure bounds or the drawing edge<br></br>;; Is it big enough for the requested area?<br></br>;; No? Continue.<br></br>;; Yes? Return it<br></br>;; Finished without finding a big enough space? Let the caller know<br></br>#f)<br></br>

  


