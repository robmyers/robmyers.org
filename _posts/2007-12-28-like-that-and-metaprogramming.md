---
author: robmyers
comments: true
date: 2007-12-28 23:58:23+00:00
layout: post
slug: like-that-and-metaprogramming
title: Like That And Metaprogramming
wordpress_id: 1545
categories:
- Generative Art
- Projects
---

[Like That](/art/like-that/) is a series of moving images made using Processing. It's intended as a long series of works. So far I've been writing each one by hand, which has hampered my rate of progress.  
  
Inspired by Lisp metaprogramming techniques I've realized that the best way of making Like That will be to generate the code for each piece using another program. Rather than messing around with OOP where it isn't needed, each component of a piece (the shapes, colours and animation) will be defined as a procedure with set parameters that can be combined with a skeleton or scaffold programatically to make a .pde file to build using Processing.  
  
Each set of different versions of functions will be stored in a separate file then parsed and combined. Like That will be the cross product of the sets of versions of each function. This ties in nicely with the maths pieces I've been working on as well.  
  
I'll use Lisp for this. It would be nicely recursive if I used Processing instead, but Lisp is my language of choice for most things and this is well within its out-of-the-box capabilities.  


