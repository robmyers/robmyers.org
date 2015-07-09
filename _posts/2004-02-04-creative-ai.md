---
author: robmyers
comments: false
date: 2004-02-04 02:53:18+00:00
layout: post
slug: creative-ai
title: Creative AI
wordpress_id: 89
categories:
- Generative Art
---

Margaret Boden described true, historically-unprecedented creativity ("H-Creativity") as adding an additional dimension to the search space (I think - I'm paraphrasing badly here). Everyone should read "The Creative Mind", especially me as I can't remember the section I want to quote from. :-)  
  
Edward DeBono describes creativity as "making novel associations" IIRC, and came up with a theory of how this works in the 1960s. I recommend "Serious Creativity" as a good introduction to his work. His techniques will be familiar to the artificial creativity researcher: random association, conceptual slippage, working backwards, etc., but he describes them for human beings to use rather than AIs.  
  
Douglas Hofstadter describes a system that build, rebuilds, analyses and operates on its own descriptions of its problem space in "Fluid Analogies".  
  
There is no reason why we cannot create an AI (or whatever) that combines these approaches. If we take a set of weighted low-level concepts (like role-playing game skills: strong 75, blue 11, breakable 4, bendy 120), assemble sets of them to describe concepts, map these onto points in the search space and then allow the search space and the concepts to be modified we're away. The Tony Buzan book with the 40,000 concept personal memory system indexed on what look like AOL passwords might be a good model for a re-mappable memory space that allows novel associations.  
  
So how do you modify the search space? How do you add an extra dimension? Well, it depends what you regard as a dimension. And there's the problem that creating new state spaces to search becomes a state space search for state spaces, at which point I have to confess that there's no escape. :-) Two schemes for adding dimensions spring to mind. The first is just to encode the entire state space in a one-dimensional array. Extra dimensions become extra slices of the array, which is grown to accomodate them. The other is to take the "a bicycle is seven dimensional object" view and declare the search space's dimensions to be the combinations of atomic concepts that values can be assigned to. It's easy to see how to change the dimensions in this scheme, even if to a non-mathematician like me it feels like cheating. :-)

  


