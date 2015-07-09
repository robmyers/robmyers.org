---
author: robmyers
comments: true
date: 2014-05-09 23:06:50+00:00
layout: post
slug: artworld-ethereum-identity-ownership-and-authenticity
title: Artworld Ethereum - Identity, Ownership and Authenticity
wordpress_id: 2569
categories:
- Art
- Art Computing
- Howto
- Projects
---

Ethereum is a distributed computing system for writing and executing smart contracts. Inspired by Bitcoin, it's currently in development with a planned late 2014 release date. The term "smart contracts" was coined around 1993 by computer scientist Nick Szabo to describe computer-readable code that replaces lawyer-readable code to describe agreements and obligations between people.

It's a very literal take on Lawrence Lessig's argument that "code is law", a libertarian attempt to reduce the costs and uncertainty of having to trust human beings and interpret ambiguous human language, or possibly a dystopian replacement of rights and safeguards with binary logic.

Smart contracts can be used to implement smart property, physical goods governed by computer code, and Distributed Autonomous Organizations, which replace written constitutions with code running on Ethereum's Blockchain.

This series of articles will look at applications of Ethereum to the production, exhibition, critique and institutions of art. Starting with digital art as smart property.

The sample code is written in Serpent, the high level Ethereum programming language, and is current as of Ethereum POC 5. It will be revised and tested for the release version of Ethereum.

You can learn more about Ethereum [here](https://www.ethereum.org/) and [here](https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-White-Paper). You can learn more about Serpent [here](http://blog.ethereum.org/2014/04/10/pyethereum-and-serpent-programming-guide-2/) and [here](https://github.com/ethereum/wiki/wiki/%5BEnglish%5D-Serpent-programming-language-operations).


## Storing and Identifying Digital Art In Ethereum


There are three cases of digital art as smart property. The first is the conceptual or code art case, where the code of the contract itself is or contains the artwork. The second is the Ethereum storage case, where a small digital artwork is stored in the Ethereum datastore. The third is the stored identifier case, where only an identifier or proxy for the artwork is stored with the contract.


### Conceptual and Code Art


Contracts that are themselves art are a simple case. They should store their owner's Ethereum address and ensure that transactions initiating actions that only the owner should be able to perform come from that address.


#### Conceptual Art


As art is defined by its inutility, a contract that does nothing must be art. ;-)

    
    <tt>stop
    </tt>




#### Hot/Cold


A contract that does something, but nothing useful.

    
    <tt>init:
        contract.storage[1000] = "hot"
        contract.storage[1001] = "cold"
    
    code:
        // Make sure we have enough gas to run the contact
        if tx.value < tx.basefee * 100:
            // If not, stop
            stop
    
        // Swap
        temp = contract.storage[1000]
        contract.storage[1000] = contract.storage[1001]
        contract.storage[1001] = temp
    </tt>




#### Numbered Works


A simple generative work that creates a new, original piece for each request.

    
    <tt>init:
        ARTWORK.NUMBER.INDEX = 1001 
        contract.storage[ARTWORK.NUMBER.INDEX] = 1
    
    code:
        ARTWORK = "Work #"
        ARTWORK.NUMBER.INDEX = 1001
        // Make sure we have enough gas to run the contact
        if tx.value < tx.basefee * 400:
            // If not, stop
            stop
    
        // Get the number of the work to produce
        number = contract.storage[ARTWORK.NUMBER.INDEX]
        // Store the number to use for the next work
        contract.storage[ARTWORK.NUMBER.INDEX] = contract.storage[ARTWORK.NUMBER.INDEX] + 1
        // Return the work
        return([ARTWORK, number], 2)
    </tt>




#### Data Visualization


A simple customised generative work / data visualization. The output looks something like:

when assembled.

    
    <tt>HEX = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    ARTWORK = ["<svg><rect x=\"23\" y=\"23\" ", "height=\"123\" width=\"123\" ", "style=\"fill:none;stroke:#", ";stroke-width:32\" /></svg>"]
    ARTWORK.LENGTH = 10
    ARTWORK.INSERT.END = 8
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 500:
        // If not, stop
        stop
    
    // If there are enough arguments
    // and the command to create the work is being given
    if msg.datasize == 1 and msg.data[0] == "create":
        artwork = array(ARTWORK.LENGTH)
        artwork[0] = ARTWORK[0]
        artwork[1] = ARTWORK[1]
        artwork[2] = ARTWORK[2]
        artwork[9] = ARTWORK[3]
        // Copy the most significant hex bytes of the key as an html colour
        index = 0
        hash.bytes = msg.sender
        while index < 3:
            current.byte = hash.bytes % 256
            hash.bytes = hash.bytes / 256
            hi = HEX[current.byte / 16]
            lo = HEX[current.byte % 16]
            artwork[ARTWORK.INSERT.END - (index * 2)] = lo
            artwork[ARTWORK.INSERT.END - (index * 2) + 1] = hi
            index = index + 1
        return(artwork, ARTWORK.LENGTH)
    // Otherwise
    else:
        // Logical false for failure
        return(0)
    </tt>




### Stored Art


Digital art can be stored in a contract's bytecodes or permanent storage rather than generated by the contract's code.


#### A Stored Image



    
    <tt>ARTWORK = ['P1\n32 32\n00000000000000010000000', '00000000000000000000000010000000', '000000000000000\n0000000001000000', '00000000000000000000000001000000', '0000000000000000000000\n001100000', '00000000000000000000001100001010', '00001100001000000000100000000\n00', '01011000010000000000100000000000', '01111000100000000001000000000001', '1111\n000100000000001000000000011', '11110110000000000010000000001111', '11100010000\n00000000000000011111', '11000000000000000010000001111111', '110000001000000000\n1000001111111', '11000000000000000000000000111111', '1110000001000000000000000\n000011', '11111000000000000000100000000001', '11111100000100000000000000000111', '\n1111110000000000000010000000011', '11111100000100000000010000001111', '1111000\n000010000000000000000111', '11110000000000000000000100001111', '10000000000100\n00000000000001111', '10000000000010000000000001111100', '000000000001000000000\n0000011100', '00000000000100000000000000101000', '0000000000000000000000000000\n010', '10000000010100000000000000000000', '01010010100000000000000000000000', '000\n0110000000000000000000000000', '00000100000000000000000000000000', '0000010000\n000000000000000000000', '00000010000000000000000']
    
    ARTWORK.LENGTH = 33
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 1000:
        // If not, stop
        stop
    
    // If there are enough arguments
    // and the command to show the work is being given
    if msg.datasize == 1 and msg.data[0] == "exhibit":
        // Just return the artwork
        return(ARTWORK, ARTWORK.LENGTH)
    // Otherwise
    else:
        // Logical false for failure
        return(0)
    </tt>




### Identifiers For Digital Art


Where a work of digital art will not fit in the blockchain a more compact identifier must be stored in the contract and used to refer to the work instead.

Ideally a method for identifying unique instances of a digital artwork will be:



	
  * Stable. The identifier should be usable for decades. Web URLs for example can change or become inaccessible as services change how they serve content or go out of business.

	
  * Verifiable. The identifier should be usable as a way of verifying that a resource is the one it refers to. Cryptographic hashes for example will not work with digital images that have been resized or GPS co-ordinates that differ even fractionally.

	
  * Amendable. Where stability fails or a change in ownership requires a change in identifier, it should be possible to update the identifier in a trusted and verifiable way.

	
  * Sufficient. The information required to identify the resource should be usable directly from the contract rather than requiring external information to complete it.

	
  * Private. An identifier should leak as little information about the owner of the resource as possible. For example GPS co-ordinates or street addresses, while stable, do locate the resource and possibly its owner. Storing only the cryptographic hash of an identifier can mitigate this.


Some of these criteria clash and therefore any given method of identification must trade them off against each other. For example being private and verifiable, or stable and amendable.

For artworks to interact with smart contracts we need a way of identifying them in those contracts.Where a digital artwork is too large or complex to keep in the contract's code or storage, a proxy or compact identifier that refers to the must be used.

The following identifiers have various strengths and weaknesses. We'll use some of them in the next section.


#### URL


A URL, such as a web site address, is a clear public identifier. It lacks privacy and is only as stable as the service hosting it, but has the advantage of being unique. To add a veneer of privacy, only the cryptographic hash of the URL can be stored by the contract and this can be checked against the hash of a URL by anyone who wishes to check whether it is the instance of the work referred to by the contract.

For example the url:

/assets/2012/10/applied_aesthetics-824x1024.png

has the SHA256 hash:

6a1811d79b46ab9e43f449beb9838e21dc5865d293e3dfb9b4ba508c7261b915

Never use a link shortening service or a consumer third party hosting service for work represented as URLs, such services are likely to go out of business or change their URL structure, rendering identifiers using them useless. When using your own site for hosting work make sure both to both keep your domain name registered and the server running and to make provisions for them to be maintained when you are no longer able or willing to do so.


#### File Hash


Producing a cryptographic hash of a work contained in or represented by a file is simple and uniquely identifies the data contained by the file (although any copies of the file will have the same hash). It is better to hash the contents of the file rather than the file itself: an image that has the same pixel values as a PNG or a GIF will have a very different structure on disk in each of those formats. Likewise the full-size or full-quality version of the contents of the file should be hashed rather than a thumbnail or a lossy version.


#### Git Repository Commit Hash


Modern decentralised version control systems use cryptographic hashes to identify commits. Hashes can identify version of works in a series within a version control repository, although they are best accompanied by a URL or other identifier for the repository.


#### Serial Number or UUID


A serial number or unique identifier embedded in the work's filename or metadata can be used to identify it. Visible watermarks are the mark of the amateur, and steganographic watermarks are easily defeated.


#### Cryptographic Signing


When producing editions of a digital work, each can be signed by the artist to identify it as authorised.


#### Name


When all else fails, a unique name and description for a work is a useful identifier.


## Art As Smart Propery




#### A Simple Owned Work



    
    <tt>OWNER = 0x7c8999dc9a822c1f0df42023113edb4fdd543266
    
    // Get the owner Ethereum address
    return(OWNER)
    </tt>




#### A Simple Owned Work That Confirms Ownership



    
    <tt>OWNER = 0x7c8999dc9a822c1f0df42023113edb4fdd543266
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 100:
        // If not, stop
        stop
    
    // If the Ethereum address sent matches the owner
    if msg.data[0] == OWNER:
        // Return true
        return(1)
    // Otherwise
    else:
        // Return false
        return(0)
    
    </tt>




#### A Simple Owned Stored Work



    
    <tt>OWNER = 0x8802b7f0bfa5e9f5825f2fc708e1ad00d2c2b5d6 // Artist initially
    WORK = "The art happens here."
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 200:
        // If not, stop
        stop
    
    // If there are enough arguments
    // and the command to return the owner address is given
    if msg.datasize == 1 and msg.data[0] == "owner":
        // Return the owning Ethereum address
        return(OWNER)
    // If there are enough arguments
    // and the command to return the artwork is given
    if msg.datasize == 1 and msg.data[0] == "work":
        // Return the work
        return(WORK)
    // Otherwise
    else:
        // Return logical failure
        return(0)
    </tt>




#### Simple Transferable Stored Work



    
    <tt>init:
        ARTIST = 0x8802b7f0bfa5e9f5825f2fc708e1ad00d2c2b5d6
        OWNER = 1001
        // Initialize the owner to be the artist
        contract.storage[OWNER] = ARTIST
    code:
        OWNER = 1001
        ARTWORK = "The art happens here."
        // Make sure we have enough gas to run the contact
        if tx.value < tx.basefee * 200:
            // If not, stop
            stop
    
        // If the message is from the current owner
        // and there are enough arguments
        // and the command to transfer is being given
        if msg.sender == contract.storage[OWNER] and msg.datasize == 2 and msg.data[0] == "transfer":
            // Transfer it to a new owner
            contract.storage[OWNER] = msg.data[1]
            return(1)
        // If there are enough arguments
        // and the command to show the work is being given
        else if (msg.datasize == 1):
            // Just return the artwork
            return(ARTWORK)
        // Otherwise
        else:
            // Logical false for failure
            return(0)
    </tt>




#### An Ownership Registry For Digital Art



    
    <tt>if tx.value < tx.basefee * 200:     // If not enough gas, stop     stop // If data was provided, it won't overwrite the code, and the artwork is unregistered if msg.datasize == 1 and msg.data[0] > 1000 and contract.storage[msg.data[0]] == 0:
        // Set the owner to be the sender
        contract.storage[msg.data[0]] = msg.sender
        return(1)
    else:
        // Do nothing
        return(0)
    </tt>




#### A Hash-based Ownership Registry For Specific Instances Digital Art


This is a registry for ownership of artworks at specific urls. Artworks are identified by the hash of their file contents and by the hash of their url. Owners are identified by Ethereum address.

    
    <tt>if tx.value < tx.basefee * 200:
        // If not, stop
        stop
    
    // If registration is being requested
    if msg.datasize == 3 and msg.data[0] == "register":
        // If the url/work combination has not been claimed
        if ! contract.storage[msg.data[1]]:
            // Set the owner to be the provided Ethereum address
            contract.storage[msg.data[1]] = msg.sender
            // Store the artwork hash next to the url ownership information
            contract.storage[msg.data[1] + 1] = msg.data[2]
            // return success
            return(1)
        // If the sender was trying to overwrite a work they do not own
        else:
            // They cannot set it, so return failure
            return(0)
    // If ownership confirmation is being requested
    // Confirm that the work and url hashes match
    else if msg.datasize == 4 and msg.data[0] == "confirm":
        // Check the provided hashes against the stored work and url hashes
        return((contract.storage[msg.data[2]] == msg.data[1]) and (contract.storage[msg.data[2] + 1] == msg.data[3]))
    // If no action was specified
    else:
        // Otherwise do nothing
        return(0)
    </tt>




## Authenticating Art In Ethereum


Authentication, like ownership, is related to identity and contract law.


#### A Simple Certificate Of Authenticity For Digital Art



    
    <tt>ARTIST = 0x8802b7f0bfa5e9f5825f2fc708e1ad00d2c2b5d6
    ARTWORK.HASH = 0x76bba376ea574e63ab357b2374d1cee5aa77d24db38115e3824c5cc4f443d5f7
    
    return((msg.data[0] == ARTIST) and (msg.data[1] == ARTWORK.HASH))
    </tt>



    
    <tt>ARTIST = 0x8802b7f0bfa5e9f5825f2fc708e1ad00d2c2b5d6
    WORK.HASH = 0x76bba376ea574e63ab357b2374d1cee5aa77d24db38115e3824c5cc4f443d5f7
    URL.HASH = 0xa005b1625af0b6ee080dafb904c4505ad285764071ee45a8786159bd1a282634
    
    // If there are enough arguments
    if msg.datasize == 2:
        // Check the provided hashes against the stored work and url hashes
        return((msg.data[0] == WORK.HASH) and (msg.data[1] == URL.HASH))
    // Otherwise
    else:
        // Do nothing
        stop
    </tt>




#### Catalogue Raisonné For Digital Artists



    
    <tt>ARTIST = 0x8802b7f0bfa5e9f5825f2fc708e1ad00d2c2b5d6
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 200:
        // If not, stop
        stop
        
    // If the message is from the artist
    if msg.datasize == 1 and msg.sender == ARTIST:
        // Add the work to the catalog
        contract.storage[msg.data[0]] = 1
        return(1)
    // check inclusion
    else if msg.datasize == 1:
        // Check whether the artwork is in the catalog
        return(contract.storage[msg.data[0]])
    // Otherwise
    else:
        return(0)
    </tt>
