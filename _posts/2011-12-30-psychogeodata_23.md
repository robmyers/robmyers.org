---
author: robmyers
comments: true
date: 2011-12-30 21:13:35+00:00
layout: post
slug: psychogeodata_23
title: Psychogeodata (2/3)
wordpress_id: 1973
categories:
- Aesthetics
- Art
- Art Computing
- Art Open Data
- Free Culture
- Free Software
- Generative Art
- Howto
- Projects
- Satire
---

![derive_sem](/assets/2011/12/30/derive_sem_example.png)

[Geodata](https://en.wikipedia.org/wiki/Geodata) represents maps as [graphs](https://en.wikipedia.org/wiki/Graph_%28mathematics%29) of nodes joined by edges (...as points joined by lines). This is a convenient representation for processing by computer software. Other data can be represented in this way, including words and their relationships.




We can map the names of streets into the semantic graph of [WordNet](http://wordnet.princeton.edu/) using [NLTK](http://www.nltk.org/). We can then establish how similar words are by searching the semantic graph to find how far apart they are. This semantic distance can be used instead of geographic distance when deciding which nodes to choose when [pathfinding](https://en.wikipedia.org/wiki/Pathfinding).




Mapping between these two spaces (or two graphs) is a conceptual mapping, and searching lexicographic space using [hypernyms](https://en.wikipedia.org/wiki/Hypernym) allows abstraction and conceptual slippage to be introduced into what would otherwise be simple pathfinding. This defamiliarizes and conceptually enriches the constructed landscape, two key elements of Psychogeography.  





The example above was created by the script derive_sem, which creates random walks between semantically related nodes. It's easy to see the relationship between the streets it has chosen. You can see the html version of the generated file [here](/psychogeodata/derive_sem_example.html), and the script is included with the Psychogeodata project at [https://gitorious.org/robmyers/psychogeodata](https://gitorious.org/robmyers/psychogeodata) .




(Part one of this series can be found [here](/weblog/2011/12/29/psychogeodata-13/), part three will cover potential future directions for Psychogeodata.)



