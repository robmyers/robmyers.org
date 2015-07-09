---
author: robmyers
comments: true
date: 2012-11-18 17:35:38+00:00
layout: post
slug: connecting-to-lambdamoo-persistently
title: Connecting To LambdaMOO Persistently
wordpress_id: 2064
categories:
- Howto
- LambdaMOO
---

It's easy to connect to LambdaMOO whenever you wish from mobile devices or desktop computers, but you can miss out on what's happening when you're not online. If you have a desktop computer that you keep permanently online you can keep a MOO client open on it, but then you cannot connect on the move.

If you have a shell account on a server (a server account that allows you to run programs on from the command line rather than just serve web pages) you can run a MOO client there and connect to it from your mobile devices or other computers. This combines the advantages of an always-on connection to the MOO with the advantages of being able to connect wherever you may be.

There are two ways of creating accessible persistent connections, each with its own advantages and disadvantages:



	
  1. You can run TinyFugue in a GNU Screen session, which allows you to connect securely using an SSH client. What you gain in security you may lose in spell checking on mobile devices.

	
  2. Alternatively you can run Mooproxy, which integrates better with dedicated MOO clients but still uses the insecure Telnet protocol to communicate with your server.





## TinyFugue In A GNU Screen Session


TinyFugue can be run in an ssh session on a server, but when you disconnect it will exit. To create a persistent TinyFugue session you can run it in GNU Screen. When you run Screen, it opens a new command line terminal that will continue running even when you disconnect from the server. And anything that you run within Screen will keep running as well. You can then reconnect to Screen the next time you connect to the server, and your TinyFugue session will still be running.

Setting up SSH connections to a server is outside the scope of this article. SSH clients are available for every desktop and mobile operating system. Install one, and find out how to set up public key authentication from it to your server.

To install TinyFugue and Screen on a GNU/Linux server you will need to be able to run commands as an administrator. You install them using the command-line package manager on the server by typing something like:

`sudo apt-get install tf5 screen`

or

`sudo yum install tf5 screen`

Next, set up the .tfrc file in your home directory:

`echo "/world lambdamoo lambda.moo.mud.org Guest" >> ~/.tfrc`

or, if you have a registered character:

`echo "/world lambdamoo lambda.moo.mud.org USERNAME PASSWORD" >> ~/.tfrc`

You only need to do that once.

Then you can start a Screen session with tinyfugue running in it by typing:

`screen tf5`

You don't need to quit the MOO or TinyFugue when you wish to leave, just close the SSH connection.

Then when you reconnect, type:

`screen -DRRU`

This will reconnect to your previous screen session. If for some reason the session has ended, for example if the server has been rebooted, you can restart TinyFugue once Screen starts by typing:

`tf5`

When you reconnect to Screen from a different device your new connection will inherit the TinyFugue session any other devices will lose access to it.



## Mooproxy


Mooproxy is a buffering network proxy for MOO connections. It runs on your server keeping a persistent connection open to the MOO, and then you connect your MOO client to it rather than to the MOO.

To install it type:

`sudo apt-get install mooproxy`

or:

`sudo yum install mooproxy`

To configure it, generate a hash of your connection command for LambdaMOO:

`mooproxy --md5crypt   

connect CHARACTER PASSWORD`

and make a note of the string that mooproxy prints in return.

Then create the file:

`~/.mooproxy/worlds/lambdamoo`

(you may need to create the `~/.mooproxy/worlds` directory using:
`mkdir -p ~/.mooproxy/worlds/` )

and enter the following into it:

`# The port to listen to on *your* server
listenport = 8899
# The hash of your connection command, for security
auth_md5hash = "THE HASH OF YOUR CONNECTION COMMAND FROM moocode --md5hash"
# The actual MOO server address
host = "lambda.moo.mud.org"
# Tha actual MOO server port
port = 8888
# Connect to the MOO automatically on start
autologin = true
# Reconnect to the MOO if the connection is lost
autoreconnect = true
# Lines starting with this character will be interpreted as command to mooproxy
commandstring = "/"
# Mooproxy should send this many lines of history to you when you connect
context_on_connect = 100`

To set it running in the background as a daemon, type:

`mooproxy -w lambdamoo`

This will start mooproxy using the settings from the world file `~/.mooproxy/worlds/lambdamoo` .

To connect to LambdaMOO, set your MOO client to connect to ,ooproxy on your server. Use your character name and password for LambdaMOO , but rather than using LambdaMOO's host name and port, use the host name and port of the server that you are running mooproxy on.

As with screen/TinyFugue, if you connect to mooproxy from a different device your new connection will inherit the mooproxy session any other devices will lose access to it.

To debug your mooproxy connection, you can check its logs at:

`~/.mooproxy/logs/lambdamoo/`

The most common errors are to not enter the correct connection string when running ` mooproxy --md5crypt`, or to not open the port that you have set mooproxy to use in the firewall.
