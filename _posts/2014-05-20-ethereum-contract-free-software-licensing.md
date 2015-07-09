---
author: robmyers
comments: true
date: 2014-05-20 06:18:11+00:00
layout: post
slug: ethereum-contract-free-software-licensing
title: Ethereum Contract Free Software Licensing
wordpress_id: 2573
categories:
- Free Software
---

Here's a simple example of a contract that is licensed under the GNU Affero General Public License:

    
    LICENSE = ["Copyright 2014 Rob Myers", "Licensed GNU AGPL V3+"]
    SOURCE = ["https:\/\/gitorious.org\/robmyers\/", "artworld-ethereum/"]
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 100:
        // If not, stop
        stop
    
    if msg.data[0] == "license":
       return(LICENSE, 2)
    else if msg.data[0] == "source":
       return(SOURCE, 2)
    else:
        // Return false
        return(0)
    


Assuming that being part of the blockchain doesn't clash with the AGPL. Anyone? :-)
