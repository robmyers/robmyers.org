---
author: robmyers
comments: true
date: 2010-11-14 16:02:31+00:00
layout: post
slug: exploring_art_history_data
title: Exploring Art History Data 1
wordpress_id: 1870
categories:
- Art
- Art Computing
- Art History
- Art Open Data
- Free Software
- Howto
- Projects
---

Freebase have a section of visual art data: [here](http://www.freebase.com/view/visual_art).  
  
You can download an archive of the data: [here](http://download.freebase.com/datadumps/latest/browse/visual_art.tar.bz2).  
  
Expanding the archive gives you the data as tab-separated files:  




    
    $ ls visual_art<br></br>art_acquisition_method.tsv         artwork.tsv<br></br>art_owner.tsv                      color.tsv<br></br>art_period_movement.tsv            visual_art_form.tsv<br></br>art_series.tsv                     visual_art_genre.tsv<br></br>art_subject.tsv                    visual_artist.tsv<br></br>artwork_location_relationship.tsv  visual_art_medium.tsv<br></br>artwork_owner_relationship.tsv




Loading up R, we can parse the files  and check some of the features of the data:



    
    <tt>$ R --quiet<br></br>> <tt>artwork<-read.delim("./visual_art/artwork.tsv")</tt><br></br></tt><p>> artwork<-read.delim("./visual_art/artwork.tsv")
    > names(artwork)
    [1] "name"               "id"                 "artist"
    [4] "date_begun"         "date_completed"     "art_form"
    [7] "media"              "period_or_movement" "art_genre"
    [10] "dimensions_meters"  "art_subject"        "edition_of"
    [13] "editions"           "locations"          "owners"
    [16] "belongs_to_series"
    > artists<-artwork$artist[artwork$artist != ""]
    > summary(artists)[1:20]
    Henri Matisse          John Gutmann         Pablo Picasso
    72                    66                    66
    Ferdinando Ongania      Vincent van Gogh            Caravaggio
    57                    57                    49
    Raphael          Claude Monet Dr. William J. Pierce
    48                    44                    42
    Alexander Girard          Tina Modotti   Martin Kippenberger
    37                    37                    36
    Alvin Langdon Coburn          Thomas Annan          Robert Adams
    31                    31                    30
    Paul Cézanne         Edward Weston        Martin Venezky
    29                    28                    28
    Paul Klee            Willi Kunz
    28                    28
    > media<-artwork$media[artwork$media != ""]
    > summary(media)[1:20]
    Gelatin silver print               Oil paint        Canvas,Oil paint
    1110                     897                     429
    Oil paint,Canvas       offset lithograph           Albumen print
    429                     221                     185
    Bronze            Photogravure       chromogenic print
    138                     127                     104
    Acrylic paint Synthetic polymer paint                     Ink
    82                      69                      67
    Graphite         Screen-printing                    Wood
    61                      57                      55
    Daguerreotype             Mixed Media         Oil paint,Panel
    39                      39                      37
    Panel,Oil paint                  Marble
    35                      30
    > gelatin_silver_print_artworks<-artwork[artwork$media == "Gelatin silver print" & artwork$artist != "",]
    > summary(gelatin_silver_print_artworks$artist)[1:20]
    Dr. William J. Pierce          John Gutmann
    78                    41                    34
    Robert Adams             Ilse Bing         Edward Weston
    30                    27                    26
    Walker Evans          Tina Modotti        Dorothea Lange
    20                    19                    18
    Lee Friedlander            Lewis Hine       Garry Winogrand
    16                    16                    14
    Henry Wessel        Nicholas Nixon           Ansel Adams
    13                    13                    12
    Harry Callahan          Pirkle Jones         Arnold Genthe
    11                    11                    10
    Bill Brandt           Lewis Baltz
    10                    10
    </p>




A couple of quick checks of the data show that it has some biases relative to mainstream art history, with more photography and photographers than you might expect. And there are several different entries for oil painting, which have skewed the numbers. This is interesting data, but about the dataset rather than about art more generally at the moment. Perhaps art history data will be as useful for institutional critique as for historical research. 



