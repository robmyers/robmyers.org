---
layout: post
title: Entity Hash IDs

---

Some schemes for encoding non-monetary information using Bitcoin (or other cryptocurrency systems) require identifiers to be encoded as addresses.

By encoding ontologies and vocabularies en masse in this way and publishing the source for each stage of the encoding we can produce a public registry and dictionary to be used in encoding messages.

(This also works for OP_RETURN in Bitcoin and for contract data in Ethereum, but we start with the lowest common denominator that also entails the widest range of representations.)

First, create a source identifier. For example we can represent Andy Warhol by Getty ULAN number:

**`ulan:500006031`**

Or the act of painting using a WordNet synset:

**`wordnet:painting%1:04:00::`**

Or the relationship of being the maker of something expressed as an RDF url:

**`http://xmlns.com/foaf/spec/#term_maker`**

Then we follow the standard scheme for creating a Bitcoin address, starting at step 2 here:

[https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses](https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses)

This is so we have both a sha256 and RIPEMD-160 representation of the identifier that we can publish along with a Bitcoin public address version, making the source identifier quicker and easier to locate.

Once we've published these representations, we can use them to refer to entities using cryptocurrency transactions (for example sending sequential transactions from a vanity address) and anyone can recover the subject. They become public, common identifiers that can be used on the blockchain.

If instead we wish the representations to be secret or we wish to establish a namespace, we can salt the encodings by prepending a Bitcoin address or public key (that can sign transactions), a cryptographically sound piece of entropy (that we need not disclose), or a hostname.style.identifier . Hierarchical deterministic wallet key addresses can be used either for additional security or as a clock to establish message order.

As with Git hashes, we can use just the last few characters of the hash to refer to it. This allows a single hash worth of storage space to refer to (for example) four different other hashes, either by concatenating the hashes directly (with or without a checksum or the last few characters of a signature attached) or by hashing them to produce a value that is recoverable but secret to the extent that it is salted (with entropy or an HD wallet key as above).

Any of these representations can be used in Bitcoin addresses or as OP_RETURN values, as the equivalent in other cryptocurrencies, or in Ethereum storage cells. They provide a flexible means of naming and refering to entities in a variety of cryptographic systems.
