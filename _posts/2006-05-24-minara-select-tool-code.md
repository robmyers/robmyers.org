---
author: robmyers
comments: true
date: 2006-05-24 06:49:59+00:00
layout: post
slug: minara-select-tool-code
title: minara - select tool code
wordpress_id: 939
categories:
- Projects
---

  
Selection is just about there:  

    
    (define (select-mouse-up win button x y)<br></br>(let ((selection (pick-path-window win x y)))<br></br>(when selection<br></br>(if (= button 1)<br></br>(set-selection-ranges-var (window-buffer-main win)<br></br>
    
          selection)<br></br>
    
             (append-selection-ranges-var (window-buffer-main win)<br></br>selection)))))<br></br>

  
The problem I have now is how to highlight the selection. Minara isn't meant to do outlining (there are very good reasons for this). I was going to just override the colour on the selection buffer to be translucent red (or something) but I'm worried that will be inefficient. Possibly I can cheat and have an outline-rendering-protocol that is private, but I'm worried if I put hooks in for that people will try to use it in the main buffer. So I think I'll have to take the inefficient but correct route, which seems to be the unofficial minara motto.  


  


Technorati Tags: [minara](http://www.technorati.com/tag/minara)

  


