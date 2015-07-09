---
author: robmyers
comments: true
date: 2007-06-22 08:23:40+00:00
layout: post
slug: fixing-the-lewitt-4a4-set-comprehension
title: Fixing The LeWitt 4x4 Set Comprehension
wordpress_id: 1365
categories:
- Aesthetics
- Projects
---

I got the LeWitt set comprehensions wrong. I've fixed the others (I edited this blog without declaring it, I feel unclean...) but the 4 line, 4 colour one was a bit harder. Here's a sketch for the fixed version.
    C = {r,y,b,k}
    L = {|, \, /, -}
    V = C x L = {(r, |), ... (k, -)}
    W = PV = \{\{(r, |)}, .. {(r, |), ... (k, -)\}\}
    X = {x :âˆˆ W | #x > 0 ^ #x < 5} % All sets of 1..4
    Y = {x :âˆˆ X | #x = # U (U x) } % All sets with unique first pair items
    Z = {x :âˆˆ Y, y :âˆˆ x • U (U y)} % Each item of each member set combined
    Alternative Z:Z = {x :âˆˆ Y • U (U x)} % Each member set combined
