---
author: robmyers
comments: true
date: 2010-12-25 15:42:56+00:00
layout: post
slug: exploring_art_data_10
title: Exploring Art Data 10
wordpress_id: 1899
categories:
- Art History
- Art Open Data
---

Let's make a word clouds for all the artists:  
  


    
    <tt>## install.packages('snippets',,'http://www.rforge.net/')
    library(snippets)
    ## Create a word cloud for all artists
    freqAll<-termFreq(PlainTextDocument(paste(artists, collapse=" "),
    language="en"),
    control=list(removePunctuation=TRUE, removeNumbers=TRUE,
    stopwords=TRUE, minDocFreq=100))
    cloud(freqAll, col = col.br(freqAll, fit=TRUE))</tt>

![vasari-wordcloud-all.png](/assets/2010/12/25/vasari-wordcloud-all.png)And here's a tag cloud for just one artist (Giovanni Cimabue) to compare it with:  
  


    
    <tt>## Create a word cloud for one artist
    freq<-termFreq(PlainTextDocument(artists[1], language="en"),
    control=list(removePunctuation=TRUE, removeNumbers=TRUE,
    stopwords=TRUE, minDocFreq=3))
    cloud(freq, col = col.br(freq, fit=TRUE))</tt>

![vasari-wordcloud-giovanni-cimabue.png](/assets/2010/12/25/vasari-wordcloud-giovanni-cimabue.png)

  




