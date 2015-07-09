---
author: robmyers
comments: true
date: 2010-12-26 13:12:41+00:00
layout: post
slug: exploring_art_data_11
title: Exploring Art Data 11
wordpress_id: 1900
categories:
- Art Computing
- Art History
- Art Open Data
---

Let's look at a more contemporary source than Vasari, [Cultural Bloggers Interviewed](http://www.labforculture.org/en/resources-for-research/contents/research-in-focus/cultural-blogging-in-europe).  
  
We can download the PDF with a shell script:  


    
    <tt>#!/bin/bash
    wget "http://live.labforculture.org/2010/09/cbi/files/cultural_blogger.pdf"</tt>

  

And then load in the data and process it in R using tm again (with a slight modification to the function that cleans up the text):  


    
    <tt><br></br>library(tm)
    blogfile<-"./cultural_blogger.pdf"
    bloggers.names<-c("Claire Welsby", "Michelle Kasprzak",
    "Alek Tarkowski", "Marco Mancuso", "Anne Helmond",
    "Robert Misik", "Marta Peirano & José Luis de Vicente",
    "Alessandro Ludovico", "Régine Debatty")
    bloggers<-data.frame(name=bloggers.names,
    from=c(6, 11, 15, 19, 23,  27, 31, 35, 41),
    to=c(10, 14, 18, 22, 26, 30, 34, 40, 44))
    ## Clean footnotes, etc. from article text
    cleanArticle<-function(text){
    ## Remove urls. Would miss final url in a document ;-)
    text<-lapply(text, function(line){gsub("http://.+\\s", "", line, perl=TRUE)})
    ## Remove punctuation
    text<-lapply(text, function(line){gsub("[[:punct:]]", "", line)})
    ## Lowercase words
    text<-lapply(text, tolower)
    text
    }
    ## Load the blogger texts
    bloggers.texts<-apply(bloggers, 1,
    function(blogger){
    reader<-readPDF(PdftotextOptions=paste("-layout",
    "-f", blogger[2],
    "-l", blogger[3]))
    reader(elem=list(uri=blogfile),
    language="en", id=blogger[1])})
    ## Clean up the blogger texts
    bloggers.texts<-lapply(bloggers.texts, cleanArticle)
    ## Make a corpus of the bloggers texts
    bloggers.corpus<-Corpus(VectorSource(bloggers.texts),
    readerControl=list(language="english",
    reader=readPlain))
    ## Remove whitespace within terms
    bloggers.clean<-tm_map(bloggers.corpus, stripWhitespace)
    ## Remove stopwords
    bloggers.clean<-tm_map(bloggers.clean, removeWords, stopwords("english"))
    ## Stem words
    ## No, this looks weird in the results
    ##bloggers.clean<-tm_map(bloggers.clean, stemDocument)
    ## Term/document matrix
    dtm<-DocumentTermMatrix(bloggers.clean)
    ## Remove infrequent terms to save memory
    dtm<-removeSparseTerms(dtm, 0.4)</tt>

  

Then we can find the most common terms:  


    
    <tt><br></br>## Frequent terms in the matrix
    findFreqTerms(dtm, 4)</tt>

  


    
     [1] "art"          "artists"      "arts"         "audience"     "based"
    [6] "bit"          "blog"         "blogging"     "blogs"        "community"
    [11] "contemporary" "content"      "difficult"    "example"      "experience"
    [16] "feel"         "include"      "involved"     "issues"       "mainly"
    [21] "media"        "people"       "platform"     "post"         "probably"
    [26] "project"      "public"       "regarding"    "scene"        "technology"
    [31] "thats"        "time"         "via"          "website"      "world"
    [36] "course"       "definitely"   "describe"     "dont"         "facebook"
    [41] "focus"        "interview"    "job"          "money"        "personal"
    [46] "research"     "started"      "cultural"     "culture"      "digital"
    [51] "music"        "write"        "writing"      "active"       "consider"
    [56] "critical"     "english"      "following"    "hand"         "information"
    [61] "network"      "popular"      "tools"        "actually"     "especially"
    [66] "etc"          "hard"         "led"          "live"         "lot"
    [71] "question"     "ive"          "online"       "read"         "video"
    [76] "book"         "changed"      "european"     "model"        "moment"
    [81] "specific"     "start"        "times"        "economic"     "readers"    

  

Look at associations:  


    
    <tt><br></br>## Frequently associated terms
    findAssocs(dtm, "blogging", 0.2)</tt>

  


    
     blogging      dont      read   usually      chat     video      blog    follow
    1.00      0.74      0.61      0.57      0.56      0.55      0.49      0.45
    research     blogs      hard       via      life       etc      live      role
    0.42      0.38      0.38      0.38      0.37      0.35      0.35      0.33
    scene  cultural       job  question      able interview     money       ive
    0.31      0.30      0.30      0.30      0.27      0.27      0.24      0.23
    led    course
    0.21      0.20 

  

Find similar bloggers:  


    
    <tt><br></br>## Dissimilarity
    dis<-dissimilarity(dtm, method="cosine")
    ## The most similar bloggers for each blogger, in order of similarity
    similarityMin<-0.25
    mostSimilarBloggers<-apply(dis, 1,
    function(row){
    sorted<-sort(row)
    ordered<-order(row)
    ## 0.0 == same blogger
    ordered[sorted > 0.0 & sorted < similarityMin]
    })
    for(doc in 1:length(mostSimilarBloggers)){
    mostSimilar<-unlist(mostSimilarBloggers[doc])
    if(length(mostSimilar) > 0){
    count<-min(length(mostSimilar), 5)
    similar<-paste(bloggers.names[mostSimilar[1:count]], collapse=", ")
    }else{
    similar<-"None"
    }
    cat(bloggers.names[[doc]], ": ", similar, "\n\n")
    }</tt>

  


    
    Claire Welsby :  None
    Michelle Kasprzak :  Régine Debatty, Anne Helmond
    Alek Tarkowski :  Anne Helmond, Régine Debatty
    Marco Mancuso :  None
    Anne Helmond :  Alek Tarkowski, Michelle Kasprzak, Régine Debatty
    Robert Misik :  None
    Marta Peirano & José Luis de Vicente :  None
    Alessandro Ludovico :  None
    Régine Debatty :  Michelle Kasprzak, Alek Tarkowski, Anne Helmond 

  

Cluster bloggers:  


    
    <tt><br></br>## Clusters of similar bloggers
    clusterCount<-3
    clusters<-kmeans(dtm, clusterCount)
    clusters.bloggers<-lapply(1:clusterCount,
    function(cluster){
    bloggers.names[clusters$cluster == cluster]})
    for(cluster in 1:clusterCount){
    cat("Cluster", cluster, ":",
    paste(unlist(clusters.bloggers[cluster]), collapse=", "),
    "\n\n")
    }</tt>

  


    
    Cluster 1 : Michelle Kasprzak, Alek Tarkowski, Anne Helmond, Régine Debatty
    Cluster 2 : Claire Welsby, Marco Mancuso
    Cluster 3 : Robert Misik, Marta Peirano & José Luis de Vicente, Alessandro Ludovico 

  

And plot associations between terms used in the text:  


    
    <tt><br></br>## Plot associations between terms
    plot(dtm, findFreqTerms(dtm, 6),
    attrs=list(graph=list(),
    node=list(shape="rectangle", fontsize="120", fixedsize="false")))</tt>

![bloggers-associations.png](/assets/2010/12/26/bloggers-associations.png)


  


  




