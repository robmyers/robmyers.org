---
author: robmyers
comments: true
date: 2006-06-21 08:33:24+00:00
layout: post
slug: minara-selection-nearly-there
title: minara selection - nearly there
wordpress_id: 997
categories:
- Generative Art
---

;; Too long! Decompose!<br></br><br></br>(define (update-selection-transform buffer sel x y)<br></br>(let-values (((prev-from prev-to)<br></br>(sexp-before buffer (picking-hit-from sel)))<br></br>((next-from next-to)<br></br>(sexp-after buffer (picking-hit-to sel))))<br></br>(let ((offset  0)<br></br>(start-index 0)<br></br>(prev-symbol (sexp-symbol-string buffer prev-from))<br></br>(next-symbol (sexp-symbol-string buffer next-from)))<br></br>;; What if it's a rotate but preceded by a translate? Later.<br></br>(if (not (and (string= prev-symbol "translate")<br></br>(string= next-symbol "pop-matrix")))<br></br>(let ((prefix<br></br>(format<br></br>#f<br></br>"(push-matrix)~%(translate~a ~a)~%" x y))<br></br>(suffix "(pop-matrix)\n"))<br></br>;; Wrap the selection in a new transform<br></br>(buffer-insert-undoable buffer<br></br>(picking-hit-to sel)<br></br>suffix)<br></br>(buffer-insert-undoable buffer<br></br>(picking-hit-from sel)<br></br>prefix)<br></br>(set! start-index<br></br>(+ (picking-hit-index sel)<br></br>1))<br></br>(set! offset (+ (string-length prefix)<br></br>(string-length suffix))))<br></br>;; else<br></br>(let* ((new-translate (format #f "(translate ~a ~a)"<br></br>(+ x old-x)<br></br>(+ y old-y))))<br></br>;; Update the existing transform very inefficiently<br></br>;; Delete the current transform<br></br>;; Insert new transform<br></br>(buffer-insert-undoable buffer<br></br>(- (picking-hit-from sel)<br></br>1)<br></br>new-translate)<br></br>(set! offset (- (string-length new-translate)<br></br>(- prev-from<br></br>prev-to))))<br></br>(set! start-index<br></br>(picking-hit-index sel)))<br></br><br></br>;; Roll the other selections down or up<br></br>(update-selection-ranges (selections-var buffer)<br></br>start-index<br></br>offset))))<br></br>

  


