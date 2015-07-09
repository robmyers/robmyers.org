---
author: robmyers
comments: true
date: 2008-03-04 07:15:55+00:00
layout: post
slug: on-purpose-line
title: On Purpose Line
wordpress_id: 1581
categories:
- Generative Art
---

What seemed to be a problematic edge case in my implementation of the line drawing algorithm from Harold Cohen's old essay "On Purpose" turned out to need a fundamental rewrite of much of the code (!) and I'm still not done. But I can now get results like this (with green lines for debugging):  
  
![cells.png](/wp-content/uploads/2008/03/cells.png)  
  
Here's the main loop, structured to look like the flowchart from the essay:  
  

    
    <br></br>(defun draw-line (from to)<br></br>(set-line-drawing-parameters from to)<br></br>(loop named stop<br></br>do  (loop<br></br>initially (set-swing-left-or-right)<br></br>initially (setf panic-count 0)<br></br>do (progn<br></br>(set-length-of-sub-phase)<br></br>(set-rate-of-swing)<br></br>(loop<br></br>do (progn<br></br>(calculate-new-direction-for-line)<br></br>(when (not (within-angular-limits))<br></br>(incf panic-count)<br></br>(when (> panic-count 20)<br></br>(break))<br></br>(setf sub-phase-count 0) ;; Start new phase<br></br>(loop-finish)) ;; This will still evaluate finally<br></br>(correction-for-homing)<br></br>(calculate-position-of-next-point)<br></br>(move-to-next-point)<br></br>(when (reached-destination)<br></br>(return-from stop)))<br></br>until (end-of-sub-phase)<br></br>finally (reverse-swing)))<br></br>until (end-of-phase))))<br></br>

  


