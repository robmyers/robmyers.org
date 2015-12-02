---
layout: post
title: Ethereum Standardized Art Contract API

---
The [Ethereum project](https://ethereum.org/) allows you to create arbitrary [smart contracts](http://szabo.best.vwh.net/smart_contracts_idea.html) to run on its [blockchain](https://en.wikipedia.org/wiki/Block_chain_(database)). To ensure that those arbitrary contracts can communicate where they need to, they have published a list of standard contract interfaces:

[https://github.com/ethereum/wiki/wiki/Standardized_Contract_APIs](https://github.com/ethereum/wiki/wiki/Standardized_Contract_APIs)

These standards allow different coins, registries, data feeds and other common contracts to communicate with and use each other in a well understood way.

Let's extend this to art contracts, starting with a smart artwork. Next we'll cover exhibitions and reviews.

These interfaces are applicable to contracts other than for art. Feedback and suggestions on how to generalize them gratefully received.

## Purchaseable Artwork

A smart contract artwork either embodies an artwork in itself, represents or controls some aspect of an artwork, or contains or is a proxy for it in some way.

The contract's owner is expected to be the artist, and not to change. "Ownership" of the artwork is recorded *within* the contract.

### Methods

### offer
    offer(address _purchaser, uint _price, uint _until)
Only callable by the artwork owner. This is separate from the contract owner.

Offer the work for sale. The `_purchaser` address can be zero, in which case anyone can buy the artwork. The `_price` can be zero, in which case the `_purchaser` need not send any funds. And `_until` can be a UNIX timestamp in the past, in which case the artwork is not actually for sale. Zero works well for this.

### purchase
    purchase() returns (bool _success)
If the caller matches the `_purchaser` (or it is set to zero), sends enough ether to match `_price` (or price is zero), and the offer has not expired, the caller becomes the new owner of the artwork.

#### purchaseFee
    purchaseFee() return (uint8 _percentage)
The percentage of the purchase price that goes to the contract owner (the artist) rather than the purchaser. A functional equivalent to the 'Artist Resale Right'.

#### setPurchaseFee
    setPurchaseFee(uint8 _percentage)
Callable only by the contract owner.

This sets the percentage of the purchase price that will go to the contract owner rather than to the purchaser. It can be set to zero.

### Events

#### Offered
    Offered(address seller, address purchaser, uint price, uint duration)
The artwork was offered for sale by the current owner of the artwork, recorded as `seller`.

#### Sold
    Sold(address seller, address buyer, uint price)
The artwork was sold by `seller` to `buyer` for the `price` given in Ethers.

## Exhibitable Artwork

An exhibitable smart contract artwork separates out the capability to exhibit the artwork from simple ownership and places it under the contract's control.

### Methods

### exhibit
    exhibit(address _at, uint _duration) returns (bool _success)
Mark the work as exhibited at (address) for _duration seconds from success of the transaction, if the caller sends sufficient Ether to cover the exhibition fee.

The address the work is exhibited `_at` can be privileged by the specific implementation of the contract (for example, a web server can allow access only from an address that can sign requests with the `_at` address key).

### exhibitFee
    exhibitFee() returns (uint _fee)
The number of Ether per second payable as an exhibition fee. Zero means that exhibition is free.

#### setExhibitFee
    setExhibitFee(uint _fee)
Callable only by the contract owner.

This sets the number of Ether per second payable as an exhibition fee. It can be set to zero.

### Events

#### Exhibited
    Exhibited(address indexed at, uint duration)
The artwork was exhibited `at` the given address for `duration` seconds.

*(Sketch from September 2015, unpublished until now.)*
