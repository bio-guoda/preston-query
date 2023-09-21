---
title: Packaging Knowledge Graphs for Reuse: A Use Case 
author: Jorrit H. Poelen
abstract: |
  Knowledge Graphs capture associations between entities (or nodes) through relationships (or edges). However, running queries against versioned/citable graphs to reproduce previous results remains troublesome due to variation in data due known phenomena (i.e. linkrot, content drift) associated with location based identifiers. In addition,  manual installation procedures. Here we show a method to run a query expressed in SPARQL against a package collection of digital resources. We demonstrate how existing graph resources can be repackaged and signed. This signed digital corpus is identified by a secure cryptographic hash. This hash is used to retrieve referenced graph resources, which are then loaded into a verified graph datastore. After loading, the provided query is executed and the results are turned.  
date: 2023-09-21
---

:warning: work in progress

# Introduction

A primary test case for reuse is to reproduce some or all of the results documented in [@Page_2023].

# Methods


# Results

We built a workflow to retrieve digital resources in a signed manifest, load them into a (temporary) graph database of known version, execute a provided query, and capture the results.

~~~
cat [some SPARQL query]\
 | ./query.sh [content anchor] 
~~~

produces results like [example/page2023/results.txt](./example/page2023/results.txt) which was used to produce the table below.

For more examples, please explore more [examples](./examples/).

| person | person_name |
| --- | --- |
| https://orcid.org/0000-0001-9745-3222 | Anna Trias-Blasi |
| https://orcid.org/0000-0003-0008-0664 | Christopher Walker |
| https://orcid.org/0000-0002-7619-824X | Colin Pendry |
| https://orcid.org/0000-0002-0855-4169 | Danilo Neves |
| https://orcid.org/0000-0002-6801-2484 | David Harris |
| https://orcid.org/0000-0003-0522-6802 | David Mann |
| https://orcid.org/0000-0002-4990-724X | De-Zhu Li |
| https://orcid.org/0000-0001-9144-2848 | Elspeth Haston |
| https://orcid.org/0000-0001-8778-6779 | Felicity Anderson |
| https://orcid.org/0000-0002-3523-1883 | Hannah Atkins |
| https://orcid.org/0000-0002-0235-9506 | Laura Forrest |
| https://orcid.org/0000-0002-2168-0514 | Mark Hughes |
| https://orcid.org/0000-0003-4851-015X | Mark Newman |
| https://orcid.org/0000-0002-4989-3976 | Mark Watson |
| https://orcid.org/0000-0002-8457-345X | Markus Ruhsam |
| https://orcid.org/0000-0003-4342-2089 | Peter Moonlight |
| https://orcid.org/0000-0002-3407-8397 | Peter Wilkie |
| https://orcid.org/0000-0003-1518-9451 | Rebecca Yahr |
| https://orcid.org/0000-0002-3410-7258 | Sabina Knees |
| https://orcid.org/0000-0002-8196-288X | Toby Pennington |
| https://orcid.org/0000-0003-2926-1645 | Zoë Goodwin |
| https://orcid.org/0000-0002-6143-3411 | Øystein Lofthus |
 

# Discussion


# References
 
