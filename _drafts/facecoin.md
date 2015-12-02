---
layout: post
title: Facecoin

---

Facecoin makes key aspects of the operation, ideology and critiques of Bitcoin contemplatable. It does this by replacing Bitcoin's simple mathematical "proof of work" system with a minimal digital art system.

Facecoin does not use people's faces as currency or proof of identity, nor is it searching for faces in Bitcoin's network. Rather it is a sketch in code of how an alternative to Bitcoin might operate.

Proof of Work
-------------

http://en.wikipedia.org/wiki/Proof-of-work_system

The Bitcoin network is secured by a "proof of work" algorithm that requires large amounts of computing power. That algorithm amounts to searching for successively longer strings of zeroes in long, effectively random, numbers. Finding a match allows you to claim a reward of newly created Bitcoins. The proof of work system therefore uses economic rationality and competition between different posessors of computing power to incentivise consensus.

Critics of Bitcoin regard the energy expended in the proof of work system as wasteful and bad for the environment. Alternative systems that perform useful work (such as medical research), or perform less work (allowing the people with the most Bitcoin already in the system to control it) have been proposed, but suffer from mis-alignment of economic incentives compared to proof of work.

Machine Pareidolia
------------------

Pareidolia is when we mistakenly see faces in clouds, or electrical sockets, or in photographs from space probes. Machine pareidolia is when a face detection algorithm gives a false positive, locating a face in an image when there isn’t one:

http://urbanhonking.com/ideasfordozens/2012/01/14/machine-pareidolia-hello-little-fella-meets-facetracker/

There’s been some nice art made using this:

http://www.di12.rca.ac.uk/projects/pareidolic-robot/

Not every image can be mistaken for a face by a face detection algorithm, in particular finding a face in a series of randomly generated pixel images takes some time.

The amount of work required to do so will be greater than nothing, and cannot be guessed precisely. We can therefore use machine pareidolia with random images as a minimally artistic proof of work system.

## Facecoin

Facecoin replaces Bitcoin’s search for leading zeros with a machine pareidolia search for faces.

SHA-256 output is used as an 8x8 256-level greyscale pixel map, and a face recognition algorithm is used to try to find one or more faces in it. If no faces are found, the nonce is increased and another attempt to find a face is made. This can take from one to several hundred tries.

When a face is found, the nonce and the face bounding rectangle are recorded so the proof of work can be validated.

Why?

Bitcoin is a very interesting development in cyberculture. It’s a repository for the hopes and fears of various ideologies, and a frontier or dark space for the imagination and social or economic activity in a 90s Internet way. Its protocol is a communication model of existence, identity, community and proof, with a CCRU-ish market worship at its base. Because of all of this I think it’s worthy of and desperately needs artistic investigation.

Artworks are proofs of aesthetic work, used as unique value identities both in the market (art is used as an investment, signifier of status, and symbolic resolution of lacks in free market ideology by oil oligarchs and trust fund managers) and by organized crime (stolen art is used as a medium of exchange by criminal gangs).

If Facecoin was widely adopted these two value identity systems would be trivially but critically mapped onto each other by millions of machines cranking out imaginary portraits across the network as part of a financial network, and vice versa.
