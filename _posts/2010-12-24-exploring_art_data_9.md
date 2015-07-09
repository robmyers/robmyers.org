---
author: robmyers
comments: true
date: 2010-12-24 18:17:23+00:00
layout: post
slug: exploring_art_data_9
title: Exploring Art Data 9
wordpress_id: 1896
categories:
- Art Computing
- Art History
- Art Open Data
---

Now let's see which artists are described most similarly by Vasari:  
  


    
    <tt>## Dissimilarity
    dis<-dissimilarity(dtm, method="cosine")
    ## The most similar artists for each artist, in order of similarity
    similarityMin<-0.2
    mostSimilarArtists<-apply(dis, 1,
    function(row){
    sorted<-sort(row)
    ordered<-order(row)
    ## 0.0 == same artist
    ordered[sorted > 0.0 & sorted < similarityMin]
    })
    for(doc in 1:length(mostSimilarArtists)){
    mostSimilar<-unlist(mostSimilarArtists[doc])
    if(length(mostSimilar) > 0){
    count<-min(length(mostSimilar), 5)
    similar<-paste(artists.names[mostSimilar[1:count]], collapse=", ")
    }else{
    similar<-"None"
    }
    cat(artists.names[[doc]], ": ", similar, "\n\n")
    }</tt>

Which gives us (truncated...):  
  


    
    Giovanni Cimabue :  Giotto, Masaccio, Agnolo Gaddi
    Arnolfo Di Lapo :  Niccola And Giovanni Of Pisa
    Niccola And Giovanni Of Pisa :  Arnolfo Di Lapo, Agostino And Agnolo Of Siena
    Andrea Tafi :  None
    Gaddo Gaddi :  None
    Margaritone :  None
    Giotto :  Buonamico Buffalmacco, Pietro Perugino, Giovanni Cimabue, Raffaello Da Urbino, Taddeo Gaddi
    ...

  
And let's cluster the artists together using k-means clustering:  
  


    
    <tt>## Clusters of similar artists
    clusterCount<-10
    clusters<-kmeans(dtm, clusterCount)
    clusters.artists<-lapply(1:clusterCount,
    function(cluster){
    artists.names[clusters$cluster == cluster]})
    for(cluster in 1:clusterCount){
    cat("Cluster", cluster, ":",
    paste(unlist(clusters.artists[cluster]), collapse=", "),
    "\n\n")
    }</tt>

Which gives us:  
  


    
    Cluster 1 : Filippo Brunelleschi, Torrigiano, Antonio Da San Gallo The Younger, Niccolò Called Tribolo, Simone Mosca, Fra Giovanni Agnolo Montorsoli
    Cluster 2 : Domenico Puligo, Francesco Mazzuoli, Niccolò Soggi, Giovanni Antonio Bazzi Called Il Sodoma
    Cluster 3 : Giotto, Lorenzo Di Bicci, Ercole Ferrarese, Baldassarre Peruzzi, Madonna Properzia De Rossi, Girolamo Da Treviso, Il Rosso, Franciabigio, Giulio Romano, Fra Sebastiano Viniziano Del Piombo, Domenico Beccafumi Of Siena, Cristofano Gherardi Called Doceno Of Borgo San Sepolcro, Michele San Michele, Giovanni Da Udine, Battista Franco, Daniello Ricciarelli
    Cluster 4 : Baccio Bandinelli
    Cluster 5 : Andrea Tafi, Gaddo Gaddi, Margaritone, Stefano Painter Of Florence And Of Ugolino Sanese, Pietro Laurati, Ambrogio Lorenzetti, Pietro Cavallini, Tommaso Called Giottino, Giovanni Dal Ponte, Agnolo Gaddi, Berna, Duccio, Antonio Viniziano, Jacopo Di Casentino, Gherardo Starnina, Lippo, Don Lorenzo Monaco, Taddeo Bartoli, Niccolò Aretino, Dello, Nanni Dantonio Di Banco, Masolino Da Panicale, Giuliano Da Maiano, Piero Della Francesca, Leon Batista Alberti, Lazzaro Vasari, Antonello Da Messina, Alesso Baldovinetti, Vellano Da Padova, Benozzo Gozzoli15, Galasso Ferrarese17, Desiderio Da Settignano, Mino Da Fiesole, Lorenzo Costa, Benedetto Da Maiano, Jacopo Called Lindaco, Giorgione Da Castelfranco, Antonio Da Correggio, Mariotto Albertinelli, Raffaellino Del Garbo, Simone Called Il Cronaca, Marco Calavrese, Francesco Granacci Il Granaccio, Giuliano Bugiardini
    Cluster 6 : Baccio D Agnolo, Perino Del Vaga, Bastiano Da San Gallo Called Aristotile, Francesco Salviati, Taddeo Zucchero
    Cluster 7 : Pietro Perugino, Raffaello Da Urbino, Andrea Del Sarto, Jacopo Da Pontormo
    Cluster 8 : Arnolfo Di Lapo, Niccola And Giovanni Of Pisa, Agostino And Agnolo Of Siena, Andrea Pisano, Jacopo Della Quercia, Luca Della Robbia, Lorenzo Ghiberti, Donato, Michelozzo Michelozzi, Andrea Verrocchio, Bramante Da Urbino, Andrea Dal Monte Sansovino, Benedetto Da Rovezzano, Pierino Piero Da Vinci, Giovan Francesco Rustici
    Cluster 9 : Michelagnolo Buonarroti
    Cluster 10 : Giovanni Cimabue, Buonamico Buffalmacco, Simone Sanese, Taddeo Gaddi, Andrea Di Cione Orcagna, Spinello Aretino, Paolo Uccello, Parri Spinelli, Masaccio, Fra Filippo Lippi, Cosimo Rosselli, Sandro Botticelli, Andrea Mantegna, Filippo Lippi Called Filippino, Bernardino Pinturicchio, Francesco Francia, Luca Signorelli Of Cortona, Leonardo Da Vinci10, Piero Di Cosimo, Fra Bartolommeo Di San Marco, Guglielmo Da Marcilla, Lorenzo Di Credi, Giovanni Antonio Sogliani, Giovanni Antonio Lappoli

  
Michaelangelo is clearly singular. ;-)  


