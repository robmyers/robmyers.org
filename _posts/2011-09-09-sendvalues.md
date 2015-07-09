---
author: robmyers
comments: true
date: 2011-09-09 19:37:49+00:00
layout: post
slug: sendvalues
title: SendValues
wordpress_id: 1944
categories:
- Aesthetics
- Art
- Art Computing
- Free Software
- Politics
- Projects
- Satire
---

SendValues is a network testing tool that sends mathematical, aesthetic and textual values using the properties of rather than the contents of network messages.  
  
You can get the source code here: [https://gitorious.org/robmyers/values-sender](https://gitorious.org/robmyers/values-sender)  
  
Both a stand-alone command-line version and an IRC-client version are included.  
  
SendValues uses a naive pulse-width-modulation scheme for encoding values. Any improvements to the code gratefully received.  
  
Here is the README:  
  
SendValues is a system for transmitting aesthetic expression and political speech using properties of network protocols.  
  
There are two versions, a command-line client and an IRC client. They use the same code and concepts apart from their different interfaces.  
  
  
* Concepts  
  
** Senders  
  
A sender is a way of sending information over the network using an IP-based protocol. SendValues has the following senders:  
  
TCP - Sends messages as TCP/IP connections.  
UDP - Sends messages as UDP packets.  
SYN - Sends messages as SYN requests.  
HTTP - Sends messages as HTTP requests.  
PING - Sends messages as ICMP echo requests.  
  
Senders may be specified to the command line or IRC clients by these names.  
  
** Values  
  
A value is a message to be sent to a host using a sender. Values are quantized by the sender and transmitted over the network as naive pulse width modulation values.  
  
SINE - A sine wave (argument is number of steps).  
SQUARE - A square wave (argument is number of steps).  
SAWTOOTH - A sawtooth wave (argument is number of steps).  
TRIANGLE - A triangle wave (argument is number of steps).  
TEXT - A block of text (argument is text to send).  
IMAGE - An image, to be sent as 1-bit pbm data (argument is image URL).  
  
  
* The Command Line Client  
  
The command line client takes all of its arguments from the command line.  
  
-h, --help - Print the help and exit.  
-o, --host  - The host address to send to.  
-s, --sender - The sender to use (from the list above).  
-m, --method - The values generation method to use (from the list above).  
-a, --argument - The argument to the values generation method.  
-c, --cell - How long each value takes to send (in milliseconds).  
-d, --duration - How long to send values to the host.  
  
These all have default values, including host which defaults to localhost.  
  
  
* The IRC Client  
  
The IRC client takes its initial configuration from the command line. Once it has connected to an IRC channel it takes commands from messages on that channel.  
  
Command line arguments:  
  
-h, --help - Print the help and exit.  
-s, --server - The IRC server to connect to.  
-p, --port - The port on the IRC server to use (defaults to 6667).  
-c, --channel - The channel on the server to take commands from (omit #).  
-u, --user - The user on the channel to take commands from.  
  
Channel and user default to "artcommands".  
  
Commands to the IRC channel have the following formats:  
  
START [sender:]host[:port] kind[:argument]  
  
Start sending values of the given kind to host using sender.  
Where only sender or port are specified, the clients will guess which.  
Argument can be a number of steps for wave senders, a url for the image sender, or arbitrary text for the text sender.  
  
STOP host  
  
Stop sending to the host. The host must be specified exactly as it was in the START command  
  
STOP  
  
Stop sending to all hosts.  
  


