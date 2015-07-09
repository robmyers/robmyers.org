---
author: robmyers
comments: true
date: 2005-09-04 09:35:51+00:00
layout: post
slug: minara-undo
title: Minara Undo
wordpress_id: 664
categories:
- Projects
---

Undo works. But not redo. Pressing z makes drawn objects disappear. Pressing Z does nothing.  
  
I think the undo/redo architecture needs reworking. At the moment "marks" go before series of undo events. I think they need to go between, so one at the bottom and top of the stack, with marks on boundaries. Redoing has too much special logic at the moment. It should only have as much special logic as undoing, which will be the case with a mark at the end of the undo list as well as at the beginning.  
  
**Update:** undo/redo now works as described. OpenGL transformation matrices and the pan/zoom tools are next.  


