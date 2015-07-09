---
author: robmyers
comments: true
date: 2010-12-26 22:00:02+00:00
layout: post
slug: exploring_art_data_12
title: Exploring Art Data 12
wordpress_id: 1901
categories:
- Art History
- Art Open Data
---

Back to Vasari's Lives.  
  
We can compare Vasari's description of Giovanni Cimabue to Wikipedia's article on the artist.  
  
The results show a surprising degree of similarity:  


    
    <tt>
    ## install.packages("RCurl")
    library(RCurl)
    ## Strip wiki code
    deWikify<-function(text){
    ## Remove {{stuff}}
    text<-gsub("\\{\\{[^}]+\\}\\}", "", text)
    ## Remove [[stuff]]
    text<-gsub("\\[\\[[^]]+\\]\\]", "", text)
    ## Remove [stuff]
    text<-gsub("\\[[^]]+\\]", "", text)
    ## Remove <stuff>
    text<-gsub("<[^>]+>", "", text)
    ## Remove punctuation
    #text<-gsub("[[:punct:]]", "", text)
    ## Lowercase words
    text<-tolower(text)
    text
    }
    ## Get the text of a page from Wikipedia
    getWikipediaArticle<-function(subject){
    page<-getURL(paste("http://en.wikipedia.org/w/index.php?title=",
    curlEscape(subject), "&action=raw", sep=""),
    .opts=list(useragent="Mozilla/5.0 (X11; U; Linux i686; fr; rv:1.9.1.3) Gecko/20090913 Firefox/3.5.3"))
    deWikify(page)
    }
    cimabuePage<-getWikipediaArticle("Cimabue")
    cimabue.corpus<-Corpus(VectorSource(c(artists[1], cimabuePage)),
    readerControl=list(language="english",
    reader=readPlain))
    cimabueDtm<-DocumentTermMatrix(cimabue.corpus)
    dissimilarity(cimabueDtm, method="cosine")</stuff></tt>

  
They seem reassuringly similar (similarity is 1.0 - dissimilarity):

    
    <br></br>          1
    2 0.1079431



