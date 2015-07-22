---
layout: post
title: inter-word2vec

---

[Word2Vec](https://code.google.com/p/word2vec/) is a word vector system that has received attention for the way that mathematical operations on the vectors it generates give meaningful results.

To take an example from [an article on Word2Vec](http://rare-technologies.com/making-sense-of-word2vec/):

> vec(“king”) – vec(“man”) + vec(“woman”) =~ vec(“queen”)

Training Word2Vec works best with large quantities of text as a single corpus. I'm interested in mis-using it with smaller copora.

## Reasoning Over Philosophy

If we can add and subtract vectors generated from different corpora, we can generate vectors for different philosophers' ouvres (or phases) and compare them.

We can then add and subtract the same concepts from different philosophers corpora, standard corpora and poisoned/flavoured corpora to examine them and to extend/develop them.

We can use [Wordnet](https://wordnet.princeton.edu/) to abstract the texts if there's insufficient overlap. We can also project texts through Wordnet in various ways (e.g. find antonyms or tangentially related concepts) and use the results to create new vectors for comparison.

## Evolving Philosophy

We can use word2vec mathematical statements normatively as tests for generated corpora. For each statement, when the vectors resulting from processing a corpus satisfies that statement (i.e. X - Y = Z, within the specified tolerance) the corpus passes that test.

We can specify the properties of a desired philosophy as these tests.

To generate a text that passes the test, start with a source text (for example either the collected translated works of Gilles Deleuze or the collected lyrics of Taylor Swift). While it doesn't pass all of the specified tests, mutate the text and run them again. If the new version passes more tests, keep it. If not, discard it.

This will be very processor intensive, it's a task for a compute cluster. Random word substitution will take an impractical amount of time. A more genetic approach, walking through conceptual space and informed by the words used in the tests, will still take a long time but may be practical. Even if not the results should be interesting.

## Visual Applications

We can extend these uses to visual bag-of-words representations of images, reasoning over and generating artistic styles and genres. If visual representations are unusable for this we can use verbal descriptions of artworks from press releases, art journalism, or other references.

We can combine visual and verbal representations to try to capture semantic and aesthetic features together.
