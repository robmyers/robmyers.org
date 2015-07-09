---
author: robmyers
comments: true
date: 2011-01-08 20:48:51+00:00
layout: post
slug: exploring_art_data_14
title: Exploring Art Data 14
wordpress_id: 1914
categories:
- Aesthetics
- Art History
- Art Open Data
---

If we save the data of Roger de Piles' scores for artists to a csv file we can load them into R:  
  


    
    <tt>## Load the tab separated values for the table of artist scores
    scores<-read.csv("./scores.csv",
    colClasses=c("character", "integer", "integer", "integer",
    "integer"))
    ## Replace NA values with zero
    nas<-which(is.na(scores), arr.ind=TRUE)
    scores[nas[1], nas[2]]<-0
    ## Create the total score
    scores<-cbind(scores, Total=apply(scores[2:5], 1, sum))</tt>


  
This allows us to find the lowest and highest scores:  
  


    
    <tt>## Min, max of each score
    scoreMinMax<-function(scores, column){
    lowest<-min(scores[column])
    cat(column, "\nMin (", lowest, "): ", sep="")
    cat(scores$Painter[scores[column] == lowest], sep=", ")
    highest<-max(scores[column])
    cat("\nMax (", highest, "): ", sep="")
    cat(scores$Painter[scores[column] == highest], sep=", ")
    cat("\n")
    }</tt>



    
    > scoreMinMax(scores, "Composition")
    Composition
    Min (0): Guido Reni, Gianfrancesco Penni
    Max (18): Guercino, Rubens
    >
    > scoreMinMax(scores, "Drawing")
    Drawing
    Min (6): Giovanni Bellini, Lucas van Leyden, Caravaggio, Palma il Vecchio, Rembrandt
    Max (18): Raphael
    >
    > scoreMinMax(scores, "Colour")
    Colour
    Min (0): Pietro Testa
    Max (18): Giorgione, Titian
    >
    > scoreMinMax(scores, "Expression")
    Expression
    Min (0): Jacopo Bassano, Giovanni Bellini, Caravaggio, Palma il Vecchio, Gianfrancesco Penni
    Max (18): Raphael
    >
    > scoreMinMax(scores, "Total")
    Total
    Min (23): Gianfrancesco Penni
    Max (65): Raphael, Rubens
    >


Cluster the artists:  


    
    <tt><br></br>## Clustering Utilities
    clustersNames<-function(clusters, names){
    clusterCount<-length(clusters$size)
    clusters.works<-lapply(1:clusterCount,
    function(cluster){
    names[clusters$cluster == cluster]})
    }
    printClustersNames<-function(clustersNames){
    clusterCount<-length(clustersNames)
    for(cluster in 1:clusterCount){
    cat("Cluster", cluster, ":",
    paste(unlist(clustersNames[cluster]), collapse=", "),
    "\n\n")
    }
    }
    ## Cluster based on the numeric scores. 8 = 2x2x2 (Low/High)
    clusters<-kmeans(scores[2:5], 8)
    names<-clustersNames(clusters, scores$Painter)
    printClustersNames(names)</tt>

  


    
    Cluster 1 : Correggio, Rembrandt, Van Dyck
    Cluster 2 : Andrea del Sarto, Federico Barocci, Daniele da Volterra, Guercino, Lucas Jordaens, Giovanni Lanfranco, Otho Venius, Perin del Vaga, Primaticcio, Francesco Salviati, Taddeo Zuccari
    Cluster 3 : Charles Le Brun, Il Domenichino, Giulio Romano, Leonardo da Vinci, Eustache Le Sueur
    Cluster 4 : I Carracci, Raphael, Rubens, Vanius
    Cluster 5 : Guido Reni, Gianfrancesco Penni
    Cluster 6 : Jacopo Bassano, Giovanni Bellini, Caravaggio, Murillo, Palma il Vecchio
    Cluster 7 : Sebastian Bourdon, Cavalier D'Arpino, Albrecht Dürer, Lucas van Leyden, Michelangelo, Il Parmigianino, Pietro Testa, Federico Zuccari
    Cluster 8 : Abraham van Diepenbeeck, Giorgione, Giovanni da Udine, Holbein, Jacob Jordaens, Palma il Giovane, Sebastiano del Piombo, Teniers, Tintoretto, Titian, Veronese

  
And graph the scores:  
  


    
    <tt>## Stacked bar chart
    ## Allow room for names at bottom and legend at right
    ## 7 is from trial and error
    par(xpd=T, mar=par()$mar+c(7,0,0,7))
    barplot(t(as.matrix(scores[2:5])), names.arg=scores$Painter,
    main="Roger de Piles' Ratings", col=rainbow(4), las=2, border=NA)
    ## Position legend in right margin
    ## 60 is from trial and error
    legend(60, 60, names(scores[2:5]), fill=rainbow(5), cex=0.75)</tt>


[![ratings.png](/assets/assets_c/2011/01/ratings-thumb-500x351-61.png)](/weblog/assets_c/2011/01/ratings-61.html)

  




