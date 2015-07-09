---
author: robmyers
comments: true
date: 2010-12-15 20:14:45+00:00
layout: post
slug: exploring_art_data_6
title: Exploring Art Data 6
wordpress_id: 1892
categories:
- Aesthetics
- Art Computing
- Art History
- Art Open Data
---

Let's access an API and start analysing images.  
  
We'll use R to get information about a series of works (Monet's "Haystacks) and images of them from freebase.  
  
In order to do this we'll need to install some new libraries:  
  


    
    <tt>source("http://bioconductor.org/biocLite.R")
    biocLite("EBImage")
    install.packages("RJSONIO")
    </tt>


Then load the libraries:  
  


    
    <tt>library(EBImage)
    library(RJSONIO)</tt>


And patch one of them to work with freebase:  
  


    
    <tt>## Monkeypatch RJSONIO so list() -> []<br></br><br></br>oldlistmethod<-getMethod("toJSON", "list")
    setMethod("toJSON", "list",
    function(x, ...){
    if(length(x) == 0){
    return("[]")
    } else {
    return(oldListMethod(x, ...))
    }
    })</tt>


We can then write code to access the freebase web API:  
  


    
    <tt>## Query the freebase API, taking and returning R objects
    queryFreebase<-function(query){
    wrappedQuery<-list(query=query)
    queryJSON<-toJSON(wrappedQuery)
    response<-getURL(paste('http://api.freebase.com/api/service/mqlread?query=',
    curlEscape(queryJSON), sep=""))
    responseJSON<-fromJSON(response)
    stopifnot(responseJSON$status == "200 OK")
    responseJSON$result
    }
    ## Get the series description and list of works from freebase
    getSeries<-function(series_name){
    query<-list(name=series_name,
    type="/visual_art/art_series",
    artworks=list())
    queryFreebase(query)
    }
    ## Get the artwork description from freebase
    getArtwork<-function(artwork_name){
    query<-list(name=artwork_name,
    type="/visual_art/artwork",
    "*"=NULL)
    queryFreebase(query)
    }
    ## Get the image description from freebase
    getImage<-function(entity_id){
    query<-list(id=entity_id,
    "/common/topic/image"=list(id=NULL),
    "*"=NULL)
    queryFreebase(query)
    }
    ## The maximum height or width of a thumbnail
    thumbSize<-100
    ## Use the freebase thumbnail to try and get a thumbnail for the image
    ## Returns NULL if image couldn't be found
    getThumbnail<-function(image, thumbSize){
    # On fail, redirect to a url that's guaranteed not to be an image,
    # we use the api root here
    # Use http as EBImage's use of curl doesn't like https
    url<-paste('http://api.freebase.com/api/trans/image_thumb',
    image[[1]]$id, '?maxwidth=', thumbSize, '&maxheight=',
    thumbSize, '&mode=fit&onfail=/', sep="")
    readImage(url)
    }
    </tt>

We can fetch data about Monet's "Haystacks", and images where those are available:  
  


    
    <tt>## Fetch the series entry
    series<-getSeries("Haystacks")
    ## Fetch the entries for individual artworks in the series
    artworks<-lapply(series$artworks, getArtwork)
    ## Get the names of the retrieved artwork data in order
    artworksNames<-lapply(artworks, function(artwork){artwork[["name"]]})
    ## Get the image resource information for the artworks
    artworksImages<-lapply(artworks, function(artwork){getImage(artwork[["id"]])})
    ## Fetch a thumbnail bitmap where available, and clear out NULLs
    artworksThumbnails<-sapply(artworksImages,
    function(image){getThumbnail(image, thumbSize)})
    names(artworksThumbnails)<-artworksNames
    artworksThumbnails<-Filter(Negate(is.null), artworksThumbnails</tt>

  

Having fetched the images, we can convert them to greyscale and produce a box plot of their brightness:  
  


    
    <tt>## Draw a box plot of the brightness, allowing enough room for rotated labels
    par(mar=c(20,4,1,1))
    boxplot(grayscaleArtworksThumbnails, las=2)</tt>

Which looks like this:  
  
![haystacks_boxplots.gif](/weblog/2010/12/15/haystacks_boxplots.gif)  


It's interesting to compare the brightness ranges of the paintings, and to see the outliers.  




