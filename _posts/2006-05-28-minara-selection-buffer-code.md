---
author: robmyers
comments: true
date: 2006-05-28 06:06:32+00:00
layout: post
slug: minara-selection-buffer-code
title: minara - selection buffer code
wordpress_id: 948
categories:
- Generative Art
- Projects
---

  
The code that creates the selection buffer. This will act like a translucent drag or ghost drag rather than direct manipulation. Direct manipulation would be slow as we'd have to update the translation in the main buffer and render the whole thing each time. A minara written by a large team of programmers could split the buffer into layers of dragging and non dragging buffers then re-unite them after the drag (the main buffer must _always_ be coherent for other tools or for saving). But currently it's just me so we do it this way.  

    
    (define (highlight-selection win)<br></br>(let ((highlight-buffer (ensure-window-buffer win "_highlight")))<br></br>(set-buffer-variable! highlight-buffer "x" 0.0)<br></br>(set-buffer-variable! highlight-buffer "y" 0.0)<br></br>(insert-buffer-text-undoable<br></br>highlight-buffer<br></br>"(translate (buffer-variable (current-buffer) \"x\") (buffer-variable (current-buffer) \"x\")")<br></br>(insert-buffer-text-undoable<br></br>highlight-buffer<br></br>"(set-colour 1.0 0.0 0.0 0.0)\n(set! old-set-colour set-colour)\n(set! set-colour (lambda (a b c d) #f)\n")<br></br>(copy-selection-ranges-to-buffer (main-buffer win) highlight-buffer)<br></br>(insert-buffer-text-undoable<br></br>highlight-buffer<br></br>"(set! set-colour old-set-colour)\n")))<br></br>

  


Technorati Tags: [minara](http://www.technorati.com/tag/minara)

  


