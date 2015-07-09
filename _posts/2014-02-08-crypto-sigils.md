---
author: robmyers
comments: true
date: 2014-02-08 07:33:57+00:00
layout: post
slug: crypto-sigils
title: Crypto Sigils
wordpress_id: 2503
categories:
- Generative Art
- Magick
- Projects
---

[![sigil](/assets/2014/02/sigil.png)](/assets/2014/02/sigil.png)

A [ cryptographic hash function](http://en.wikipedia.org/wiki/Cryptographic_hash_function) is a piece of computer code that take a piece of data and produce a (hopefully) unique short string representing it. This string will in no way resemble the input data, and you will not be able to guess the input data from it. The function always outputs the same string for the same data, and changing the data will change the output string.

For example I can use the SHA256 function on the UNIX command line to make a unique representation of my name:

    
    # echo rob | sha256sum 
    30d71981944699f23038164f4eb8189950b4dcf9b39ea2c1ecbda13aea8b7d4a  -


And if I do this again I get the same result:

    
    # echo rob | sha256sum 
    30d71981944699f23038164f4eb8189950b4dcf9b39ea2c1ecbda13aea8b7d4a  -


But if I add just one extra character I get different result:

    
    # echo robM | sha256sum 
    731a1886a0005b3504805845eeecfac3a0839a651d383f242242d0df2f568ec8  -


And importantly the amount of difference in the input has no effect on the amount of difference between the output strings:

    
    # echo robN | sha256sum 
    58bf3ee9cae6247705d1262c048cc71d28924f2cff04ada514f8240ce3555bec  -


So the outputs of cryptographic hash functions produce identities for data that can be used to uniquely refer to the data but do not disclose the content of the data.

Hash functions achieve this by feeding the data through a complex mathematical transformation. This is a mapping through mathematical space that maintains identity and difference while occulting content.

Much like a [sigil](http://en.wikipedia.org/wiki/Sigil_%28magic%29).

It's true that if one knows the word or words abstracted to make a sigil one can recognize their traces in the sigil. But these traces are a means to an end, they are a way of producing a striking and unique new identity to focus on and invest in.

More cryptographic hash strings are created every hour than sigils have been made in the entirity of human history. Billions of mappings through mathematical platonic space to establish, conceal and communicate identity. Their consensual reality and status as exports from the platonic realm of mathematical objects make them ideal magickal material.

A full 32-byte SHA256 hash is a lot to memorize, although doing so is a feat that could be ritually powerful. It may be enough to abstract it to its first few digits, as [Git commits](https://www.kernel.org/pub/software/scm/git/docs/user-manual.html#understanding-commits) do. We don't need to use the hexadecimal (base-16: 0123456789ABCDEF rather than base-10: 0123456789) digit strings that are the usual human readable output of hash functions. An HTML-style colour can be represented with three or six hexidecimal digits, for example blue is 0000FF or OOF. We can choose a unique colour using [the first six digits](https://web.archive.org/web/20130423132157/http://blog.dopplr.com/2007/10/23/in-rainbows/) of the hash.

For example:

    
    echo this is my intent | sha256sum 
    1b0fd74346abfe6858b12b8e3036649a63c09f2a049634dfe3c835f32422f58e  -


As an HTML colour this is #1b0fd7:

[![Hex Digest as Colour](/assets/2014/02/asfasfdasd.png)](/assets/2014/02/asfasfdasd.png)

We can also use pairs of digits as positions on a 16x16 grid, or more digits for a larger grid, or three groups of digits to produce a [three dimensional path](http://hyperritual.com/portfolio/3d-sigil-maker/) for [3D printing](/2013/02/23/3d-printing-sigils/) or importing into virtual reality.

Here's a simple Python example:

    
    import hashlib
    
    digest = hashlib.sha256()
    digest.update(" the spammish repetition")
    digest_string = digest.hexdigest()
    digest_numbers = [int(char, 16) for char in digest_string]
    coords = [digest_numbers[i:i+2]
               for i in range(0, len(digest_numbers), 2)]
    print "%!ps\nnewpath"
    print "%i %i moveto" % tuple(coords[0])
    for coord in coords[1:]:
        print "%s %s lineto" % tuple(coord)
    print "0.25 setlinewidth\nstroke"


You can see the output of this program rendered at the top of this article. We can combine this with colour (or render the colours of the hash as a grid of coloured squares).

Another way of generating visual forms from hashes is using shape grammars, as used by [libvisualid](http://www.hackerposse.com/~rozzin/VisualIDs/). Here's "this is my intent" rendered by libvisualid:

[![this is my intent](/assets/2014/02/this-is-my-intent.png)](/assets/2014/02/this-is-my-intent.png)

Hashes can be attached to emails or tweets to place and circulate them in the world. Or they can be placed into the Bitcoin blockchain using a system such as [https://github.com/vog/bitcoinproof](https://github.com/vog/bitcoinproof), to be rehashed constantly as the [Bitcoin blockchain](http://en.wikipedia.org/wiki/Bitcoin#Block_chain) is updated. Here's the hash for a spell in the blockchain:

[1Eui1Wje41JEJ4W1QYWbSAYG4h7JBaoPXQ](https://blockchain.info/address/1Eui1Wje41JEJ4W1QYWbSAYG4h7JBaoPXQ)

We can use a system similar to Bitcoin's proof-of-work system to find auspicious hashes for data, those that start with a run of leading zeroes or some other number (or target string or bitmap encoded as a number).

More Python:

    
    import hashlib
    import binascii
    
    target = "0000"
    complement = -1
    digest_numbers = ""
    
    while not digest_numbers.startswith(target):
        complement = complement + 1
        digest = hashlib.sha256()
        digest.update("this is my intent")
        digest.update(str(complement))
        digest_numbers = digest.hexdigest()
        print "%d %s" % (complement, digest_numbers)
    
    print binascii.b2a_uu(str(complement))
    print binascii.b2a_base64(str(complement))


And its output, which is the key to creating an auspicious hash of the input string:

    
    0 eae2ffcee00aa95306e706dd4bc67ab6b9fd2ffe61b32dfe4177b76c0afd682d
    1 84ba18490876919df8bbff194eeb861c6c44a27e9bfbd8db485ecf704e41fcbd
    2 f53226b118fa492dc21cd4336d67b4c8ce4148e49e8e4b094baf3e5ecff688ba
    [...]
    74962 38d5f823e881857f031def1822a28546d29b40903959b1c9bf1f5a1bebd42d9e
    74963 b906fd259413ac714de31b9acaf6f0e5268560221d07f557f0f491a081a2cd09
    74964 00006dd9f148ca454d331179bd7c87b42d7ab734df7738e1ae90e25013f02a1d
    %-S0Y-C0 
    
    NzQ5NjQ=


%-S0Y-C0 and NzQ5NjQ= are different representations of the number 74964. They can be used to create sigils, or the number could be represented verbally using a mnemonic generator.

There's more that can be done with cryptographic hashes and with cryptographic signing, which I haven't covered in this article. But hopefully these examples can inspire further experimentation.

(All code licensed CC0.)
