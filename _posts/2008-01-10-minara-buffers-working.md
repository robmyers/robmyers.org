---
author: robmyers
comments: true
date: 2008-01-10 07:24:37+00:00
layout: post
slug: minara-buffers-working
title: Minara Buffers Working
wordpress_id: 1557
categories:
- Generative Art
- Projects
---

    MINARA> (setq buf (make-buffer-from-file "./minara.minara"))
    
    ; in: LAMBDA NIL
    ;     SETQ
    ;
    ; caught WARNING:
    ;   undefined variable: BUF
    
    ;
    ; caught WARNING:
    ;   This variable is undefined:
    ;     BUF
    ;
    ; compilation unit finished
    ;   caught 2 WARNING conditions
    #
    MINARA> (buffer-to-string buf)
    ";; The minara logotype as a minara file
    ;; Copyright (c) 2004 Rob Myers
    ;; Generated from an Illustrator EPS file using search & replace...
    
    (set-colour 0.8 0.8 0.8 0.0)
    
    (path-begin)
    (move-to 5.0 5.0)
    (line-to 5.0 395)
    (line-to 6.0 395)
    (line-to 6.0 5.0)
    (path-end)
    
    (path-begin)
    (move-to 5.0 395)
    (line-to 5.0 396)
    (line-to 596.0 396)
    (line-to 596.0 395)
    (path-end)
    
    etc...
