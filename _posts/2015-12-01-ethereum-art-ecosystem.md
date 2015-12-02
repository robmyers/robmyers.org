---
layout: post
title: Ethereum Art Ecosystem

---

The Blockchain is an obvious medium for storing titles to property beyond currency. This includes property titles for artworks, particularly digital artworks. But there is nothing smart about using smart contracts for that. Rather than seeking to bring the failings of DRM to the blockchain, we should seek to use smart contracts to formalize more interesting economies of relationships between art and its audiences.

# The Basics

## Items

Everything is an item.

## Owners

Every item has an owner. This is simply an Ethereum address from which instruction transactions will be obeyed. They can be implemented as basically as a GUI for a human operator or by complex blockchain or oracle systems.

## Containers

Many items can have a pseudo-spatial relationship to other items, containing them in the way that a gallery contains a show or a magazine contains a review for example. This is distinct from the control relationship of ownership.

An item's container is its location.

Purchasing an instance of an artwork makes the purchaser the container for that instance, not the owner of the artwork contract.

# Artworks

Smart artworks are the self-driving cars or High Frequency Trading Algorithms of the smart contract/smart property artworld. Their most important feature is that they manage their own exhibition and sale - they evaluate offers and make the decision whether to accept them or not automatically.

## Editions

An artwork can simulate scarcity or manage exposure by having a limited edition size. This is a count of the number of instances of the artwork that be included in containers at one time. An edition size of one is a unique artwork.

When an artwork is sold or exhibited this doesn't decrease the edition size but does reduce the amount of the edition available to be sold or exhibited simultaneously.

## Provenance

The provenance of an artwork is its sale, exhibition, and critical history. All of these are stored on the blockchain as a natural result of their operation (and as recorded Ethereum "events").

## Display

### Authentication

An artwork can be queried to find which Containers currently hold instances of it. This can be used to authenticate displayed artworks. Authentication information can be displayed in the interface or accompanying materials for an exhibition.

### Control

Artworks can (weakly) control exhibition by storing their assets on an IP-locked website and only allowing a whitelist of addresses to access it. Containers provide an IP address and proxy their exhibition of the artwork through that.

This is obviously subject to IP spoofing and cannot prevent downloading but provides an example of a system of this kind of thing for people who want it.

## Sale and Exhibition

Collections can make offers to artworks to permanently purchase or temporarily exhibit them.

It is up to the artwork to decide whether they accept the offer or not.

Purchased instances of an artwork may also allow their owners to veto or suggest their sale or exhibition.

### Simple Offers

A simple offer to purchase consists of a price.

A simple offer to exhibit consists of a time, a duration and a fee.

The artwork can accept or decline the offer based on availability, whether the price or fee is sufficient, and any external information about the address the offer was sent from (e.g. an external blacklist).

### Tagged Offers

Tagged offers are an example of a slightly more flexible system for artworks to decide whether to accept an offer or not.

The collection makes an offer formatted as a dictionary of key/value pairs. The artwork then evaluates this offer, most simply by comparing it against its own tag dictionary (and for price, etc as with a simple offer).

The disadvantage of this method is that the tag values must be trusted by the artwork. This can be addressed by a trusted third party signing the tags, or by a SchellingCoin-style evaluation of the tags.

### Exhibition Fees

Artworks receive fees for being exhibited (these can be set to zero if desired). They can pass these on to the owner of their contract (presumably the artist).

### Resale Refusal and Fees

Artworks can veto sales as well as exhibitions. They can also take a percentage of any sale price, simulating the Droit de Suite/Artist's Resale Right (this can be set to zero if desired).

# Collections

Collections are containers. They contain artworks. Shows, museums and galleries are all collections.

Temporary and permanent collections feature artworks loaned for exhibition or purchased to be held in museum or personal collections.

Collections have selection and acceptance policies.

Exhibitions, auctions, awards, competitions and commissions are containers.

## Exhibitions

An exhibition occurs at an institution. It contains a particular number of artworks for a particular duration (which may be perpetual).

The exhibition must offer artworks an exhibition fee and details of its duration. For more complex schemes it must provide the artwork with further information, for example the dictionary required by "Tagged Offers".

For the duration of the exhibition, the artwork will register it as the container for one of its instances.

## Auctions

Auctions are containers which can accept and enforce bids up until a time limit. The placing and any extra evaluation of bids is handled by other contracts.

## Awards

Awards are containers of works entered for the award, with the actual award allocated by oracle, Schelling Coin or other auditor contract.

## Competitions

Turner Prize-style competitions combine exhibitions with an award at the end, allocated by oracle, Schelling Coin or other auditor contract.

## Commissions

Commissions specify requirements as tags and offer a price for satisfying them as confirmed by a Schellin Coin or other auditor contract.

# Reviews

Reviewers produce 5-star reviews of artworks, with a brief title.

These are aggregated by Collections and may be referred to by the artwork.

They can be filtered by reviewer reputation.

# Conclusion

With just a few basic types of contract and with some compexity either deferred or excluded from the system it is possible to make smart artworks and art institutions in code online in the blockchain.

By moving the curatorial and developmental functions of the artworld into artworks and institutions themselves it is possible to remove the vagarities of human attention from the development of the art market while still representing human economic and aesthetic interests within it.

*(Sketch from June 2015, unpublished until now.)*
