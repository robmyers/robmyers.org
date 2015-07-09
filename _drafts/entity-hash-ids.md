---
layout: post
title: Entity Hash IDs

---

Some schemes for encoding information using Bitcoin (or other cryptocurrency systems) require identifiers to be encoded as addresses.

If we are willing to use unspendable addresses (any funds or tokens sent to the address can never be recovered from it), and to publish the source for the identifier we can do this in a standard way.

First, create a source identifier. For example we can represent Andy Warhol by Getty ULAN number:

**ulan:500006031**

Then we follow the standard scheme for creating a Bitcoin address, starting at step 2 here - [https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses](https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses)

This is so we have both a sha256 and RIPEMD-160 representation of the identifier that we can publish.

