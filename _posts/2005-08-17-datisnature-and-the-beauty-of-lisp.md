---
author: robmyers
comments: true
date: 2005-08-17 04:16:29+00:00
layout: post
slug: datisnature-and-the-beauty-of-lisp
title: DatIsNature And The Beauty of Lisp
wordpress_id: 646
categories:
- Generative Art
---

Was it Neal Stephenson who said that Lisp is the only beautiful programming language? The excellent [DataIsNature](http://www.dataisnature.com/) has a link to a  
[snippet of Lisp to draw the Mandelbrot set](http://dataisnature.com/?p=176), which is a case in point:  

    
    <br></br>(loop for y from -1 to 1.1 by 0.1 do<br></br>(loop for x from -2 to 1 by 0.04 do<br></br>(let* ((c 126)<br></br>(z (complex x y))<br></br>(a z))<br></br>(loop while (< (abs<br></br>(setq z (+ (* z z) a)))<br></br>2)<br></br>while (> (decf c) 32))<br></br>(princ (code-char c))))<br></br>(format t "~%"))<br></br>

  


