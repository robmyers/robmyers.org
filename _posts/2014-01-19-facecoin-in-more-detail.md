---
author: robmyers
comments: true
date: 2014-01-19 23:47:26+00:00
layout: post
slug: facecoin-in-more-detail
title: Facecoin In More Detail
wordpress_id: 2502
categories:
- Art
- Art Computing
- Generative Art
- Projects
---

Facecoin is Bitcoin with a different Proof Of Work system. I'll try to
explain what this means here but I also recommend the following articles
about Bitcoin and its protocol:

[http://www.economist.com/blogs/economist-explains/2013/04/economist-explains-how-does-bitcoin-work](http://www.economist.com/blogs/economist-explains/2013/04/economist-explains-how-does-bitcoin-work)

[http://www.michaelnielsen.org/ddi/how-the-bitcoin-protocol-actually-works/](http://www.michaelnielsen.org/ddi/how-the-bitcoin-protocol-actually-works/)


## Proof of Work


Whenever a computer in the bitcoin network wants to record transactions,
it must perform a simple but unguessable and time-consuming calculation
then send the results to other machines on the network to verify. It is
therefore computationally (and monetarily) expensive to record a
transaction if you are not actually performing one. This discourages
abuse of the Bitcoin network.

This calculation and its output are the "proof of work", they prove that
the computer's user has been willing to do some work and expend some
resources in order to prove their good faith:

[http://en.wikipedia.org/wiki/Proof-of-work_system](http://en.wikipedia.org/wiki/Proof-of-work_system)

In Bitcoin, an algorithm called SHA-256 is applied to the transaction's
data. Give SHA-256 any data and it will output a string of characters
that cannot be used to recreate the original data but that will always
be the same for the same data. They are a kind of identity for data:

[http://en.wikipedia.org/wiki/Cryptographic_hash_function](http://en.wikipedia.org/wiki/Cryptographic_hash_function)

For example, on the UNIX command line:

$ echo annie | sha256sum
7eb9d8162722f815b8aeb728d4112d24c2a2ea821fc0af7286bddab0df79baa9 -

$ echo michael | sha256sum
bb472c3cc2b662a74956c8539fec9fe73f2b8a9f9124506aa0474698b3bac62d -

$ echo rob | sha256sum
30d71981944699f23038164f4eb8189950b4dcf9b39ea2c1ecbda13aea8b7d4a -

$ echo rob | sha256sum
30d71981944699f23038164f4eb8189950b4dcf9b39ea2c1ecbda13aea8b7d4a -

Bitcoin uses SHA-256 to repeatedly make such an identity string for the
transaction data and a number that it increases by one each try called
the "nonce". Eventually, and there's no way of predicting precisely when
but it should take about ten minutes, the output string will start with
several zeroes. When it does, Bitcoin uses that as the proof of work for
the transaction:

[https://en.bitcoin.it/wiki/Proof_of_work](https://en.bitcoin.it/wiki/Proof_of_work)


## Machine Pareidolia


Pareidolia is when we mistakenly see faces in clouds, or electrical
sockets, or in photographs from space probes:

[http://en.wikipedia.org/wiki/Pareidolia](http://en.wikipedia.org/wiki/Pareidolia)

Machine pareidolia is when a face detection algorithm gives a false
positive, locating a face in an image when there isn't one:

[http://urbanhonking.com/ideasfordozens/2012/01/14/machine-pareidolia-hello-little-fella-meets-facetracker/](http://urbanhonking.com/ideasfordozens/2012/01/14/machine-pareidolia-hello-little-fella-meets-facetracker/)

There's been some nice art made using this:

[http://www.di12.rca.ac.uk/projects/pareidolic-robot/](http://www.di12.rca.ac.uk/projects/pareidolic-robot/)

Not every image can be mistaken for a face by a face detection
algorithm, in particular finding a face in a series of randomly
generated pixel images takes some time.

The amount of work required to do so will be greater than nothing, and
cannot be guessed precisely. We can therefore use machine pareidolia
with random images as proof of work.


## Facecoin


Facecoin replaces Bitcoin's search for leading zeros with a machine
pareidolia search for faces.

SHA-256 output is used as an 8x8 256-level greyscale pixel map, and a
face recognition algorithm is used to try to find one or more faces in
it. If no faces are found, the nonce is increased and another attempt to
find a face is made. This can take from one to several hundred tries.

When a face is found, the nonce and the face bounding rectangle are
recorded so the proof of work can be validated.


## Why?


Bitcoin is a very interesting development in cyberculture. It's a
repository for the hopes and fears of various ideologies, and a frontier
or dark space for the imagination and social or economic activity in a
90s Internet way. Its protocol is a communication model of existence,
identity, community and proof, with a CCRU-ish market worship at its
base. Because of all of this I think it's worthy of and desperately
needs artistic investigation.

Artworks are proofs of aesthetic work, used as unique value identities
both in the market (art is used as an investment, signifier of status,
and symbolic resolution of lacks in free market ideology by oil
oligarchs and trust fund managers) and by organized crime (stolen art is
used as a medium of exchange by criminal gangs).

If Facecoin was widely adopted these two value identity systems would be
trivially but critically mapped onto each other by millions of machines
cranking out imaginary portraits across the network as part of a
financial network, and vice versa.
