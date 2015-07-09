---
author: robmyers
comments: true
date: 2014-06-03 05:10:17+00:00
layout: post
slug: ethereum-hot-cold-ui
title: Ethereum - Hot Cold UI
wordpress_id: 2582
categories:
- Art
- Art Computing
- Ethereum
- Projects
---

One of the example contracts from "[Identity, Ownership and Authenticity](/2014/05/09/artworld-ethereum-identity-ownership-and-authenticity/)" was a conceptual art homage called hot_cold.se . Here's an updated version:

    
    init:
        contract.storage[1000] = "hot"
        contract.storage[1001] = "cold"
    
    code:
        // Swap
        temp = contract.storage[1000]
        contract.storage[1000] = contract.storage[1001]
        contract.storage[1001] = temp


When it receives a message, it swaps the strings "hot" and "cold" in its memory.

We can access the contract's memory in [AlethZero](https://github.com/ethereum/cpp-ethereum) using JavaScript and build an HTML UI for the contract. Here's part of the code:

    
    // The hot_cold contract
    var contract = "0x84ea345a8c5ca28abee46681ff3a7cee526bb4e4";
    
    // Update the spans with the data from the contact
    var fetch = function() {
      document.getElementById("_1000").innerText = eth.storageAt(contract, 1000).bin();
      document.getElementById("_1001").innerText = eth.storageAt(contract, 1001).bin();
    };


It fetches the values from the contract's memory and assigns them to HTML elements. Like so:

[![hot-cold](/assets/2014/06/hot-cold.png)](/assets/2014/06/hot-cold.png)

Further JavaScript allows you to update the contract's state (first warning you that doing so costs Ether in the form of Gas for the transaction):

[![gas](/assets/2014/06/gas.png)](/assets/2014/06/gas.png)

Once the transaction goes through, the JavaScript code is notified of a change to the contract's state and updates the UI:

[![cold-hot](/assets/2014/06/cold-hot.png)](/assets/2014/06/cold-hot.png)

There's only one version of the properties, so if someone else updates the contract you'll see the results in your UI. And vice versa.

You can find the code in the repository for this series:

[https://gitorious.org/robmyers/artworld-ethereum/](https://gitorious.org/robmyers/artworld-ethereum/)

hot_cold.se is in the contracts directory, and hot_cold.html in the ui directory.
