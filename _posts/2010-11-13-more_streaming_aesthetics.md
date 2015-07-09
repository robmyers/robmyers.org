---
author: robmyers
comments: true
date: 2010-11-13 17:39:34+00:00
layout: post
slug: more_streaming_aesthetics
title: More Streaming Aesthetics
wordpress_id: 1869
categories:
- Aesthetics
- Art
- Art Computing
---

I'm following up [Streaming Aesthetics (Colour)](/weblog/2010/06/streaming-aesthetics-colour.html) with some exploratory programming in Python using tweetstream and the python curses terminal library.

print_stream_terms keeps track of basic shape, colour and texture terms and reports on their relative proportions.  


Here's what it looks like when running:




Louisiana Weekly headline: "Conservatives blame the poor for being poor."  In other news, sky blue again this week. #rubyconf




Terms: blue  

pattern  

stripe: 16/1333		dot: 33/1333		check: 1284/1333		  

colour  

red: 506/866		yellow: 92/866		blue: 268/866		  

shape  

circle: 59/164		triangle: 19/164		square: 86/164  


  
art_is scans mentions of the word 'art' to find which of them are statements of what art is, and builds up a definition over time as words are repeated in definintions. It needs focussing on to the statements themselves, like We Feel Fine, as at the moment it considers the whole tweet.

Here's what it looks like when running:  





RT @drmardy: Art is a marriage of the conscious and the unconscious

{'beautiful': 1, '217': 1, 'art': 14, 'dont': 1, 'garbage': 1, 'p': 1, 'back': 1, 'general': 1, 'andre': 1, 'xx': 1, 'good': 1, 'tessa': 1, 'spanish': 1, 'star': 1, 'palette': 1, '7971': 1, 'enjoyed': 1, 'shurrup': 1, 'album': 1, 'gross': 1, 'mr_oddly': 1, 'pt': 2, 'callback': 1, 'sake': 2, 'newmetaldiscs': 3, 'ping': 1, 'american': 1, 'write': 1, 'state': 1, 'jessicaaaaaarrr': 1, 'obj5p': 1, 'tweets': 1, 'marriage': 2, '2010': 2, 'knowing': 1, 'rt': 1, 'dialogue': 1, 'murder': 2, 'http': 3, 'photog': 1, 'unconscious': 2, 'deleted': 1, 'quote': 1, 'story': 1, 'answers': 1, 'collab': 1, 'ridiculous': 1, 'link': 2, 'carl': 1, 'wedding': 1, 'alterado': 2, 'muted': 1, 'adversary': 2, 'fm': 1, 'startupstrategy': 1, 'minimalist': 1, 'kind': 1, 'arglbargl': 1, 'd': 1, 'thy': 2, 'artist': 1, 'i': 3, 'colour': 1, 'conscious': 2, 'hussie': 1, 'thing': 1, 's': 3, 'nicest': 1, 't': 1, '474': 1, 'rock': 1, 'faking': 1, 'aye': 1}  
  


I think it will need to run for a while...



