---
author: robmyers
comments: true
date: 2013-09-03 05:01:19+00:00
layout: post
slug: what-is-an-artist-on-wikipedia
title: What Is An Artist (On Wikipedia)?
wordpress_id: 2394
categories:
- Aesthetics
- Art
- Art History
- Art Open Data
---

[Wikipedia](https://www.wikipedia.org/) is the free online encyclopedia. It features articles on many thousands of artists. In the paper "Art History on Wikipedia, a Macroscopic Observation", Doron Goldfarb et al use the Getty Union List Of Artist Names, via the Virtual Internet Authority File, as a name authority to find artists on Wikipedia. This approach has the advantage of authority, ULAN is used as the name authority by many projects including the Europeana open metadata project. But it has the disadvantage of imposing an external concept of who an artist is onto Wikipedia. If a way could be found of identifying artists using the information contained in Wikipedia's articles, this would mean that we can use Wikipedia's own concept of what an artist is to identify artists on Wikipedia rather than using an external authority.

What, then, is an artist on Wikipedia?

It is not an article tagged with a category containing the word "Artist", as that also includes [singers](https://en.wikipedia.org/wiki/Frank_sinatra) and other recording or performing artist(e)s.

It is not an article with an "Artist" [InfoBox](https://en.wikipedia.org/wiki/Barbara_Kruger), as although that is specific to artists not every artist or [artist group](https://en.wikipedia.org/wiki/Art_and_Language) has one.

If we use the concept "Visual Artist" rather than "Artist", this excludes [performance artists](https://en.wikipedia.org/wiki/Marina_Abramovic).

The Wikipedia-derived "semantic web" database Freebase provides [a performative definition](http://wiki.freebase.com/wiki/Commons/visual_art/visual_artist) of a "Visual Artist" on its wiki: anyone (or anything) who has made a work of visual art. But this definition isn't used by the actual database, which classifies performance artists as artists.

An article's membership of the Category "[Artists](https://en.wikipedia.org/wiki/Category:Artists)" (or a sub-category of it) cannot be used to identify artists. This Category includes articles about works about artists, Artisans, and Nineteenth Century Composers.

The best approach I have found for identifying what I regard as artists is to use DBPedia, another Wikipedia-derived semantic web database, to find articles that are tagged with sub-categories of the Category "Artists" and to filter out categories that I don't think belong. But this is not using Wikipedia's concept of what an artist is.

So I have edited Wikipedia in order to exclude those sub-categories of "Artists" that I don't think belong, given Wikipedia's own definitions of the terms used to describe each sub-category. If these edits are not removed, then articles tagged with sub-categories of "Artists" will be a good definition of what an artist is given my interpretation of Wikipedia's terms.

This isn't a disinterested discovery of knowledge on my part though. In trying to identify knowledge I have had to intervene to create it in a system of knowledge where it is difficult for words to mean more than one thing or have more than one context. The former is postmodern, the latter modern. Wikipedia is a site of tension between these approaches, and this is reflected in its ontology, in both the computer science and the philosophical sense.
