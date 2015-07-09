---
author: robmyers
comments: true
date: 2014-07-23 00:58:10+00:00
layout: post
slug: ethereum-this-contract-is-art
title: Ethereum - This Contract Is Art
wordpress_id: 2590
categories:
- Art
- Ethereum
- Projects
---

[Here is a contract](https://gitorious.org/robmyers/artworld-ethereum/) that can assert that it is art.

    
    init:
        contract.storage[1000] = "may be"
    
    code:
        if msg.data[0] == "toggle":
            if contract.storage[1000] == "is":
                contract.storage[1000] = "is not"
            else:
                contract.storage[1000] = "is"


It toggles its status as art when sent a message instructing it to do so.

Here's what the UI for the contract looks like:

[![is1](/assets/2014/07/is1.png)](/assets/2014/07/is1.png)

Here it is while the artistic state of the contract is being toggled:

[![is2](/assets/2014/07/is2.png)](/assets/2014/07/is2.png)

And here it is after being toggled:
[![is3](/assets/2014/07/is3.png)](/assets/2014/07/is3.png)
Anyone can change the contract from not being art to being art (and vice versa). We'll look at a more advanced contract that uses behavioural economics to address this next.
