---
author: robmyers
comments: true
date: 2010-12-23 19:26:56+00:00
layout: post
slug: exploring_art_data_8
title: Exploring Art Data 8
wordpress_id: 1895
categories:
- Art Computing
- Art History
- Art Open Data
---

Let's explore the text of Vasari's [Lives of The Artists](http://en.wikipedia.org/wiki/Lives_of_the_Most_Excellent_Painters,_Sculptors,_and_Architects).  
  
The full text of an English translation can be found on [Project Gutenberg](http://www.gutenberg.org/browse/authors/v#a9769).  
  
We can use a shell script to download the files to a local folder:  
  


    
    <tt>#!/bin/bash
    DESTDIR="vasari"
    BOOKS="25326 25759 26860 28420 28421 28422 31845 31938 32362 33203"
    mkdir -p "${DESTDIR}"
    pushd "${DESTDIR}"
    for ebook in ${BOOKS}
    do
    wget "http://www.gutenberg.org/ebooks/${ebook}.txt"
    done
    popd</tt>


  
And then we can use R's "tm" library to load the files:  


    
    <tt>
    ## For "dissimilar" in tm
    ## install.packages("proxy")
    ## For "plot" on dtm in tm
    ## source("http://bioconductor.org/biocLite.R")
    ## biocLite("Rgraphviz")
    ## install.packages("tm")
    library(tm)
    dir<-"vasari"
    prefix<-"pg"
    extention<-".txt"
    ## These are the Project Gutenberg book numbers for Lives Of The Artists
    ## Skip volume 10, this doesn't follow the same format: , 33203
    books<-c(25326, 25759, 26860, 28420, 28421, 28422, 31845, 31938, 32362)
    ## Make a file path for a book
    bookPath<-function(id){
    paste(dir, "/", prefix, id, extention, sep="")
    }
    ## Load the file
    loadFile<-function(filename){
    readChar(filename, file.info(filename)$size)
    }
    ## Load the files
    loadFiles<-function(filenames){
    sapply(filenames, loadFile, USE.NAMES=FALSE)
    }
    ## Load the texts
    texts<-loadFiles(sapply(books, bookPath))</tt>

  
We can then extract the entry for each artist, clean up the data, create a corpus, and then clean up the corpus:  
  


    
    <tt>## Extract entries on each artist
    extractArtists<-function(text){
    ## Split each file into blocks between "LIFE OF .*\n"
    artists<-unlist(strsplit(text, "\nLIFE OF"))
    ## Discard first block, that is introduction
    ## Last block will be discarded by the article cleaning function
    artists[2:length(artists)]
    }
    ## Clean footnotes, etc. from article text
    cleanArticle<-function(text){
    ## Truncate at \nFOOTNOTES:
    text<-unlist(strsplit (text, split="\nFOOTNOTES:"))[1]
    ## Remove [Text in square brackets]
    text<-gsub("\\[[^]]+\\]", "", text)
    ## Remove punctuation
    text<-gsub("[[:punct:]]", "", text)
    ## Lowercase words
    text<-tolower(text)
    text
    }
    ## Get the first line of a string
    firstLine<-function(text){
    con<-textConnection(text)
    line<-readLines(con, 1)
    close(con)
    line
    }
    ## Get the artists name from the start of the entry
    artistName<-function(text){
    name<-firstLine(text)
    ## Remove punctuation
    name<-gsub("[[:punct:]]", "", name)
    ## Lowercase words
    name<-tolower(name)
    ## Strip leading and trailing whitespace
    name<-gsub("(^ +)|( +$)", "", name)
    ## Uppercase initial characters
    gsub("\\b([a-z])", "\\U\\1", name, perl=TRUE)
    }
    ## Extract the artists
    artists<-unlist(lapply(texts, extractArtists))
    ## Get the artists names while there are still newlines in the artist texts
    artists.names<-lapply(artists, artistName)
    # Clean up the artist texts
    artists<-lapply(artists, cleanArticle)
    ## Make a corpus of the artists texts
    artists.corpus<-Corpus(VectorSource(artists),
    readerControl=list(language="english",
    reader=readPlain))
    ## Remove whitespace within terms
    artists.clean<-tm_map(artists.corpus, stripWhitespace)
    ## Remove stopwords
    artists.clean<-tm_map(artists.clean, removeWords, stopwords("english"))
    ## Stem words
    artists.clean<-tm_map(artists.clean, stemDocument)</tt>

  

We can then create a term/document matrix (and remove infrequently used terms) to explore the corpus:  
  


    
    <tt>## Term/document matrix
    dtm<-DocumentTermMatrix(artists.clean)
    ## Remove infrequent terms to save memory
    dtm<-removeSparseTerms(dtm, 0.4)</tt>

  
We can find frequently used terms:  
  


    
    <tt>## Frequent terms in the matrix
    findFreqTerms(dtm, 60)</tt>

  


    
     [1] "lorenzo"    "painted"    "pietro"     "life"       "andrea"
    [6] "francesco"  "giovanni"   "beautiful"  "executed"   "antonio"
    [11] "domenico"   "duke"       "marble"     "jacopo"     "church"
    [16] "hand"       "little"     "able"       "afterwards" "age"
    [21] "art"        "beauty"     "caused"     "chapel"     "christ"
    [26] "city"       "day"        "death"      "del"        "design"
    [31] "excellent"  "figure"     "figures"    "finished"   "florence"
    [36] "friend"     "head"       "held"       "house"      "judgment"
    [41] "left"       "likewise"   "manner"     "master"     "messer"
    [46] "painter"    "painting"   "palace"     "pictures"   "placed"
    [51] "pope"       "reason"     "rome"       "seen"       "sent"
    [56] "set"        "time"       "various"    "whereupon" 

  

We can see which words are strongly associated:  
  


    
    <tt>findAssocs(dtm, "painting", 0.8)</tt>

  


    
    <tt>  painting    painter   painters       hand     little    painted   pictures
    1.00       0.90       0.90       0.89       0.89       0.89       0.89
    beautiful    figures      grace       lady       save     beauty   executed
    0.87       0.87       0.86       0.86       0.86       0.85       0.85
    manner   portrait       time     worthy  excellent      hands   likewise
    0.85       0.85       0.85       0.85       0.84       0.84       0.84
    particular       seen       sent      truth       able        art  craftsmen
    0.84       0.84       0.84       0.84       0.83       0.83       0.83
    friend      house       left      lived     living     return        age
    0.83       0.83       0.83       0.83       0.83       0.83       0.82
    besides     christ        day    finally    mention   received      study
    0.82       0.82       0.82       0.82       0.82       0.82       0.82
    chapel       city  diligence excellence       head     honour     master
    0.81       0.81       0.81       0.81       0.81       0.81       0.81
    nature       rome       true       held  wherefore
    0.81       0.81       0.81       0.80       0.80 </tt>


  
And we can plot those associations:  
  


    
    <tt>## Plot associations between terms
    plot(dtm, findFreqTerms(dtm, 120), attrs=list(graph=list(),
    node=list(shape="rectangle",fontsize="72", fixedsize="false")))</tt>

  

Which looks like this:  

![termgraph.png](/assets/2010/12/23/termgraph.png)

  




