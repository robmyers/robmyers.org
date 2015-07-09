---
author: robmyers
comments: true
date: 2014-02-08 22:32:08+00:00
layout: post
slug: exploring-tate-art-open-data-2
title: Exploring Tate Art Open Data 2
wordpress_id: 2511
categories:
- Art Computing
- Art History
- Art Open Data
- Projects
---

This is the second in a series of posts examining Tate's excellent collection dataset. You can read the first part [here](/2014/02/05/exploring-tate-art-open-data-1/).The R and R Markdown code for this series is available at [https://gitorious.org/robmyers/tate-data-r/](https://gitorious.org/robmyers/tate-data-r/) .

As before, let's get started by loading the data.

    
    <code class="r">source("../r/load_tate_data.r")
    </code>




## Movement Artwork Counts


Next let's load some code to visualize the number of artworks in the collection categorized as being produced by a particular movement each year.

    
    <code class="r">source("../r/movement_artwork_counts.r")
    </code>


You can see the code in the Git repository above. It loads the Tate collection data files and declares some functions that we can use to plot movement artwork counts.

We can plot the number of artworks from a given movement, for example the Young British Artists (YBAs):

    
    <code class="r">plotMovementFrequency("Young British Artists (YBA)")
    </code>


[![YBAs](/assets/2014/02/unnamed-chunk-3.png)](/assets/2014/02/unnamed-chunk-3.png)
Or we can plot the combined counts for multiple movements, for example those since 1800:

    
    <code class="r">plotArtworkCountsByYear()
    </code>


[![Movements Since 1800](/assets/2014/02/unnamed-chunk-4.png)](/assets/2014/02/unnamed-chunk-4.png)
These figures are available as PDFs in the Git repository.


## Movement Durations


When did a movement start and end, and how long did it last? We can plot this for movements as defined by the date of production of the artworks labelled as being part of that movement in the Tate collection.

    
    <code class="r">source("../r/movement_durations.r")
    </code>


First by movement name:

    
    <code class="r">plotMovementDurations(movement.durations.alpha, movement.order.alpha)
    </code>


[![Movements By Name](/assets/2014/02/unnamed-chunk-6.png)](/assets/2014/02/unnamed-chunk-6.png)

And then by movement start date:

    
    <code class="r">plotMovementDurations(movement.durations.from, movement.order.from)
    </code>


[![Movements By Start Date](/assets/2014/02/unnamed-chunk-7.png)](/assets/2014/02/unnamed-chunk-7.png)

These figures are also available as PDFs in the Git repository.


## Movement Influences


We can use artists who are in two or more movements as links between movements, constructing a network graph of social connections between movements.
Like the Wikipedia data-based update of Alfred Barr's handmade diagram for the MoMA Cubism & Abstract Art exhibition of 1936 [Collectivizing The Barr Model](http://ahcncompanion.info/abstract/collectivizing-the-barr-model/) we can extract a family tree (or Rhizome) of influence between art movements and otherwise use network analysis methods to study the social network of art movements:

    
    <code class="r">plotMovementArtistLinks()
    </code>


[![Movements Connected By Artists](/assets/2014/02/unnamed-chunk-9.png)](/assets/2014/02/unnamed-chunk-9.png)Again, this figure is also available as PDFs in the Git repository.


## Conclusions


As you can see some of these graphics work better as posters or large-scale PDFs than as bitmaps. There's much that could be done with curve fitting and comparison of movement artwork counts. And all the techniques of social network analysis can be applied to the graph of artists and movements.

Next we'll look at artwork genres, which are not explicitly labelled in the collection dataset.
