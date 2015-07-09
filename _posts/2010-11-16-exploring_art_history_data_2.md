---
author: robmyers
comments: false
date: 2010-11-16 18:36:07+00:00
layout: post
slug: exploring_art_history_data_2
title: Exploring Art History Data 2
wordpress_id: 1874
categories:
- Aesthetics
- Art Computing
- Art History
- Art Open Data
- Free Software
- Howto
---

Let's see how art form and genre relate in the Freebase "Visual Art" dataset of artworks.  
  


    
    <tt># read the artwork data
    artwork<-read.delim("visual_art/artwork.tsv")
    # Get rows with both genre and form
    # This loses most of the data :-/
    art<-artwork[artwork$art_genre != "" & artwork$art_form != "", c("art_genre", "art_form")]
    # Drop unused factors
    art$art_genre<-as.factor(as.character(art$art_genre))
    art$art_form<-as.factor(as.character(art$art_form))
    # Get table
    art.table<-table(art) ##as.table(ftable(art))
    # Strip rows and columns where max < tolerance
    tolerance<-3
    art.table.cropped<-art.table[rowSums(art.table) >= tolerance,colSums(art.table) >=tolerance]
    # Print wide table (make sure you resize your terminal window)
    options(width=240)
    print.table(art.table.cropped)</tt>


  





    
                                      art_form
    art_genre                          Drawing Fresco Installation art Metalworking Painting Photography Relief Sculpture Tapestry
    Abstract art                           2      0                6            0       36           0      0         5        0
    Allegory                               0      0                0            0        7           0      0         0        0
    Animal Painting                        0      0                0            0       14           0      0         0        0
    Christian art                          0      0                0            0        1           0      0         1        0
    Christian art,History painting         0      0                0            0        2           0      0         0        0
    Decorative art                         0      0                0            6        0           0      3         0        4
    Fantastic art                          0      0                0            0        4           0      0         0        0
    Genre painting                         0      0                0            0      120           0      0         0        0
    Genre painting,Landscape art           0      0                0            0        4           0      0         0        0
    History painting                       0     10                0            0      207           0      0         0        0
    History painting,Landscape art         0      0                0            0        3           0      0         0        0
    History painting,Religious image       0      0                0            0        3           0      0         0        0
    Landscape art                          0      0                0            0      169           1      0         0        0
    Landscape art,Genre painting           0      0                0            0        7           0      0         0        0
    Landscape art,Marine art               0      0                0            0        3           0      0         0        0
    Marine art                             0      0                0            0       34           1      0         0        0
    Marine art,History painting            0      0                0            0        4           0      0         0        0
    Marine art,Landscape art               0      0                0            0        3           0      0         0        0
    Monument                               0      0                0            0        0           0      0         8        0
    Portrait                               2      1                0            0      230           5      0         0        0
    Religious image                        0      0                0            0        4           0      0         0        0
    Religious image,History painting       0      0                0            0        4           0      0         0        0
    Still life                             0      0                0            0       35           0      0         0        0
    





  
This time painting rather than photography has suspiciously more entries than any other medium, as more paintings than any other medium have genre information in the dataset.

