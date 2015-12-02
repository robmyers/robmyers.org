---
layout: post
title: The Entropy Man

---

![A 16-Sided Die](/assets/2015/D16_HEX_dice.jpg)

*[D16 Hex Dice](https://commons.wikimedia.org/wiki/File:D16_HEX_dice.JPG) by [Saharasav](https://commons.wikimedia.org/w/index.php?title=User:Saharasav) licensed [Creative Commons Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/).*

"[The Dice Man](http://en.wikipedia.org/wiki/The_Dice_Man)" by Luke Rhinehart is a 1971 novel about the moral consequences of making life-altering decisions using the roll of a die. The use of chance operations in art was common in mid-20th-Century avant-gardes but, reacting against his background in psychiatry, Rhinehart applied them to more consequential decision making.

We can use cryptographic hashes rather than dice as the source of entropy for aleatory, chance operations in art and decision making. The last hexadecimal digit (or digits, for wider ranges of values) can be quantized to the range of values we need: e.g. for a coin flip 0-7 is tails and 8-F is heads.

Private hashes can be the [sha256](http://linux.die.net/man/1/sha256sum) of a question, statement, or range of options. Or of entropy pulled from [/dev/random](https://en.wikipedia.org/wiki//dev/random) or a hardware source. Combine these two approaches or use a [timestamp](https://en.wikipedia.org/wiki/Unix_time) to make answers specific to the occasion or time at which they are asked.

Public hashes can be Bitcoin's [block hashes](https://eprint.iacr.org/2015/1015.pdf), or the hash of a Bitcoin transaction. The transaction can be time locked or contain the question (etc.) encoded as a has to delay and/or allow proof or disclosure of its content.

Or we can use any of these methods as the decision making basis for computer based or handmade generative art, replacing software pseudo-random number generators with entropy deterministically derived from the existing content of the work or from external sources of "inspiration".

It's much more contemporary than a dice, although dice do make good sources of [artisanal entropy](http://www.swansontec.com/bitcoin-dice.html).
