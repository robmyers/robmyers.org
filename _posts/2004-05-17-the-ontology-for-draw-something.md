---
author: robmyers
comments: false
date: 2004-05-17 00:42:00+00:00
layout: post
slug: the-ontology-for-draw-something
title: The Ontology For “Draw Something”
wordpress_id: 151
categories:
- Projects
---

I've started working on the ontology for my program "Draw Something". It's currently based on my unpublished "ae" toy aesthetic program, but I need something heavier duty for the full program.  
In computing an ontology is data that represents knowledge, particularly facts and rules. So for a medical program, the ontology would contain information about which drugs treat which conditions, and how those drugs interact. In philosophy, ontology is the metaphysics of being and categories of being. Both meanings are applicable to Draw Something's ontology; it's a computer representation of an investigation into what art is and how you produce art-objects.  
I have a certain way I want Draw Something's ontology to work - more as active "daemons" than as passive symbols. I've been looking at Paul Graham's writing on "closures" in his book "[On Lisp](http://www.paulgraham.com/onlisp.html)". Closures combine data and instructions in a more active way than other programming techniques do, but I'm not sure they're what I need (in particular I don't know how to copy closures in a program or get polymorphic behaviour from them). And very few people understand closures. And I'm not really one of them yet. :-)  
My favourite type of ontology is Douglas Hofstadter's slipnet, as seen in his & Melanie Mitchell's "[CopyCat](http://www.cse.ogi.edu/~mm/how-to-get-copycat.html)" program, explained in "[Fluid Concepts and Creative Analogies](http://www.cogsci.indiana.edu/fcca.html)". A slipnet allows more specific ideas ("the number 5") to be generalised to less specific ideas ("numbers") if the a particular problem cannot be solved with more specific ideas. Copycat also has a nice split between its built-in concepts and its current working memory. Hopefully this will be a useful model to use for Draw Something.



