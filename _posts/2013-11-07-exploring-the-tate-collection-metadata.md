---
author: robmyers
comments: true
date: 2013-11-07 00:51:56+00:00
layout: post
slug: exploring-the-tate-collection-metadata
title: Exploring the Tate Collection Metadata
wordpress_id: 2400
categories:
- Art History
- Art Open Data
---

The Tate have released their collection metadata in an exemplary way here:

[https://github.com/tategallery/collection](https://github.com/tategallery/collection)

Let's explore it using MongoDB, which you can find installation structions for [here](http://www.mongodb.org/downloads).

First fetch and upload the JSON data:

    
    git clone https://github.com/tategallery/collection.git
    cd collection
    find artists -name *.json -exec perl -p -e 's/\n/ /' '{}' \; -exec echo \; | mongoimport --db tate --collection artists
    find artworks -name *.json -exec perl -p -e 's/\n/ /' '{}' \; -exec echo \; | mongoimport --db tate --collection artworks


Then in the mongo shell we can explore the artists and artworks:

    
    ////////////////////////////////////////////////////////////////////////
    // Artists
    ////////////////////////////////////////////////////////////////////////
    
    // List artist movements
    
    db.artists.aggregate(
    {$unwind: "$movements"},
    {$project: {name: "$movements.name"}},
    {$group: {_id: "movements", items: {$addToSet: "$name"}}}
    )
    
    // List artist eras
    
    db.artists.aggregate(
    {$unwind: "$movements"},
    {$project: {name: "$movements.era.name"}},
    {$group: {_id: "movements", items: {$addToSet: "$name"}}}
    )
    
    // Find artists by movement
    
    db.artists.find({"movements.name":"Pop Art"})
    
    // Find artists by era
    
    db.artists.find({"movements.era.name":"20th century post-1945"})
    
    // Find artists by birth year
    
    db.artists.aggregate(
    {$group: {_id: "$birth.time.startYear", artists: {$addToSet: "$fc"}}}
    )
    
    // Find artists by death year
    
    db.artists.aggregate(
    {$group: {_id: "$death.time.startYear", artists: {$addToSet: "$fc"}}}
    )
    
    // count artists by gender
    
    db.artists.aggregate(
        {$group : {_id : "$gender" , number : {$sum : 1}}},
        {$sort : {number : -1}}
    )
    
    // Count artists by birthplace
    
    db.artists.aggregate(
        {$group : {_id : "$birth.place.name" , number : {$sum : 1}}},
        {$sort : {number : -1}}
    )
    
    ////////////////////////////////////////////////////////////////////////
    // Artworks
    ////////////////////////////////////////////////////////////////////////
    
    // List artwork subject categories
    
    db.artworks.aggregate(
    {$unwind: "$subjects.children"},
    {$unwind: "$subjects.children.children"},
    {$group: {_id: "categories",
               categories: {$addToSet: "$subjects.children.children.name"}}}
    )
    
    // List artwork subjects
    
    db.artworks.aggregate(
    {$unwind: "$subjects.children"},
    {$unwind: "$subjects.children.children"},
    {$unwind: "$subjects.children.children.children"},
    {$group: {_id: "subjects",
               subjects: {$addToSet: "$subjects.children.children.children.name"}}}
    )
    
    // List artwork categorys and subjects
    
    db.artworks.aggregate(
    {$unwind: "$subjects.children"},
    {$unwind: "$subjects.children.children"},
    {$unwind: "$subjects.children.children.children"},
    {$group: {_id: "category-subjects",
               subjects: {$addToSet: {category: "$subjects.children.children.name",
                           subject:"$subjects.children.children.children.name"}}}}
    )
    
    // List artwork movements
    
    db.artworks.aggregate(
    {$unwind: "$movements"},
    {$group: {_id: "artwork-movements",
               movements: {$addToSet: "$movements.name"}}}
    )
    
    // Find artwork by category/subject group
    
    db.artworks.find({"subjects.children.children.name":"UK counties"})
    
    // Find artwork by subcategory/subject
    
    db.artworks.find({"subjects.children.children.children.name":"beacon"})
    
    // Find artwork by artist name
    
    db.artworks.find({"contributors.fc":"Andy Warhol", "contributors.role":"artist"})
    
    // Find artwork by movement. Will exclude works with no movement.
    
    db.artworks.find({"movements.name":"Pre-Raphaelite"})
    
    // Find artworks without movements
    
    db.artworks.find({"movementCount":0})
    
    // Find artwork by date. Will exclude works with unknown date.
    
    db.artworks.find({"dateRange.startYear": {$gte: 1900, $lt: 1910}})
    
    // Find artworks without dates
    
    db.artworks.find({"dateRange":null})


Exploring the data it becomes clear that the structure of the metadata is wonderfully regular but some of the content is less so. For example entries in the "artists" data may be attributions to movements rather than individuals, and both movements and individuals may have null gender. Locations in birth and death data can be a town or country name in any language, or a town and country separated by a comma. Not every artwork has a creation date, movements, or subjects.

But this is standard for real-world data, and easy enough to regularise. The community can do this and submit a pull request. What's important is that this is a high-quality metadata dataset from a world-class art institution. People are already starting to explore and visualise it. See here for a great example:

[http://www.shardcore.org/shardpress/index.php/2013/11/06/tate-data-explorer/](http://www.shardcore.org/shardpress/index.php/2013/11/06/tate-data-explorer/)
