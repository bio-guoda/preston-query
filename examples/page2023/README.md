---
title: "Packaging Knowledge Graphs for Reuse: Taxonomic Literature Use Case"
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
cat query.sparql\
 | ./query.sh
~~~

produced [results.txt](./results.txt) after applying [query.sparql](./query.sparql) which was used to produce the table below.

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
 

## Use Case 1: Query for Biodiversity Dataset




## Use Case 2: Page 2023

The table below shows associations between a dataset name and their DOIs. In this case, the DOIs refer to _all_ versions of specific Zenodo dataset publications [@Page_2023_a;@Page_2023_b;@Page_2023_c;@Page_2023_d] that contain RDF triples derived from other datasets [@Page_2023_e;@Page_2023_f;@Page_2023_g;@Page_2023_h] mentioned in Table 2. of [@Page_2023].    

| Dataset name | DOI (all versions) |
| --- | --- |
| Linked data for taxonomic authors in ORCID |  https://doi.org/10.5281/zenodo.7181180 |
| Index Fungorum | https://doi.org/10.5281/zenodo.7977299 |
| IPNI | https://doi.org/10.5281/zenodo.7977435 |
| ION (BioNames) | https://doi.org/10.5281/zenodo.7977556 |
: Reprinted Content of Table 3. from [@Page_2023] "The N-Triples datasets for people and taxonomic names."

For a human reader, it may be obvious that Index Fungorum ntriples and tsv tables are related. However, for a naive machine actor, these relations are not clear, especially because the associated DOIs point to *all* version of some dataset and because there's no explicit relation between the reference DOI and the associated digital content. In other words, the provenance, or origin, of the knowledge graph needs further clarification, and the relation between a DOI and associated digital content needs to be made explicit. 

| Dataset name |  DOI (all versions) | ChecklistBank ID | Github Repository |
| --- | --- | --- | --- | 
| Index Fungorum | https://doi.org/10.5281/zenodo.7211134 | 129659 | https://github.com/rdmpage/index-fungorum-coldp |
| IPNI | https://doi.org/10.5281/zenodo.7208699 | 164203 | https://github.com/rdmpage/ipni-coldp |
| BioNames (ION) | https://doi.org/10.5281/zenodo.7977714 | 128415 | https://github.com/rdmpage/bionames-coldp |
: Reprinted Content of Table 2. from [@Page_2023] "Datasets of names mapped to persistent identifiers for the literature [...]"

## Formalizing Data Provenance


~~~

<https://doi.org/10.5281/zenodo.7211134> <http://www.w3.org/ns/prov#hadMember> <https://doi.org/10.5281/zenodo.7974503> .

<https://doi.org/10.5281/zenodo.7974503> <http://www.w3.org/ns/prov#hadMember> <https://zenodo.org/record/7974503/files/rdmpage/index-fungorum-coldp-2023-05-26.zip> .

<https://zenodo.org/record/7974503/files/rdmpage/index-fungorum-coldp-2023-05-26.zip> <http://purl.org/pav/hasVersion> <hash://md5/0b69f4c481b8cda6fbea987e61ddb680> .

<hash://md5/0b69f4c481b8cda6fbea987e61ddb680> <http://purl.org/pav/createdBy> <https://orcid.org/0000-0002-7101-9767> .

<https://doi.org/10.5281/zenodo.7181180> <http://purl.org/pav/hasVersion> <https://doi.org/10.5281/zenodo.7181181> .

<https://doi.org/10.5281/zenodo.7181181> <http://www.w3.org/ns/prov#hadMember> <https://zenodo.org/record/7181181/files/triples.nt.zip> .

<https://zenodo.org/record/7181181/files/triples.nt.zip> <http://purl.org/pav/hasVersion> <hash://md5/09f2c4f961f2aca469d5f3a36009938d> .

<zip:https://zenodo.org/record/7181181/files/triples.nt.zip!/triples.nt> <http://www.w3.org/ns/prov#type> "application/n-triples" .
<zip:hash://md5/09f2c4f961f2aca469d5f3a36009938d!/triples.nt> <http://www.w3.org/ns/prov#type> "application/n-triples" .

<zip:hash://md5/09f2c4f961f2aca469d5f3a36009938d!/triples.nt> <http://purl.org/pav/hasVersion> <hash://md5/99e0fff7811d049be63c1fb7c51f6041> .

<zip:hash://md5/09f2c4f961f2aca469d5f3a36009938d!/triples.nt> <http://www.w3.org/ns/prov#wasDerivedFrom> <hash://md5/0b69f4c481b8cda6fbea987e61ddb680> .

<https://zenodo.org/record/7977299> <http://purl.org/pav/hasVersion> <https://zenodo.org/record/7977300> .

<https://zenodo.org/record/7977300> <http://www.w3.org/ns/prov#hadMember> <https://zenodo.org/record/7977300/files/triples.nt> .

<hash://md5/9d2d8ccc65094d2748148b034b30dfef> <http://www.w3.org/ns/prov#type> "application/n-triples" .
<https://zenodo.org/record/7977300/files/triples.nt> <http://purl.org/pav/hasVersion> <hash://md5/9d2d8ccc65094d2748148b034b30dfef> .

<https://doi.org/10.5281/zenodo.7977435> <http://purl.org/pav/hasVersion> <https://doi.org/10.5281/zenodo.7977436> .

<https://doi.org/10.5281/zenodo.7977436> <http://www.w3.org/ns/prov#hadMember> <https://zenodo.org/record/7977436/files/triples.nt> .

<https://zenodo.org/record/7977436/files/triples.nt> <http://purl.org/pav/hasVersion> <hash://md5/c1e6c5410e49eea484a4a873589967d7> .

<https://doi.org/10.5281/zenodo.7977556> <http://purl.org/pav/hasVersion> <https://doi.org/10.5281/zenodo.7977557> .

<https://doi.org/10.5281/zenodo.7977557> <http://www.w3.org/ns/prov#hadMember> <https://zenodo.org/record/7977557/files/triples.nt> . 

<https://zenodo.org/record/7977557/files/triples.nt> <http://purl.org/pav/hasVersion> <hash://md5/8494138f1955050bb53360ef1634f746> .
~~~


## Reproducing Result 

To test whether the package data could be used to reproduce results in figure 14. we:


1. download the image https://arpha.pensoft.net//showfigure.php?filename=oo_862115.png
2. applied tesseract OCR to extract the text in the figure with version 

~~~
$ tesseract --version
tesseract 4.1.1
 leptonica-1.82.0
  libgif 5.1.9 : libjpeg 8d (libjpeg-turbo 2.1.1) : libpng 1.6.37 : libtiff 4.3.0 : zlib 1.2.11 : libwebp 1.2.2 : libopenjp2 2.4.0
 Found AVX2
 Found AVX
 Found FMA
 Found SSE
 Found libarchive 3.6.0 zlib/1.2.11 liblzma/5.2.5 bz2lib/1.0.8 liblz4/1.9.3 libzstd/1.4.8
~~~

3. captured transcribed text

~~~
 

 

isBasedOn

t

( CreativeWork

 

 

 

creator

 

affiliation

Organization

identifier

 

 

 

| PropertyValue |

y~

propertyID

 

+

| RINGGOLD | 41803

SPARQL query

PREFIX schema: <http://schema.org/>
‘SELECT DISTINCT ?person ?person_name
FROM <https://www.ipni.org>
FROM <https://orcid.org>
WHERE {
2id schema:propertylD "RINGGOLD" .
id schemazvalue "41803" .
org schematidentifier 2id .
‘person schemazaffiliation ?org .
2work schema:creator 2person .
?taxonName schematisBasedOn work .
?taxonName schema:name ?name .
{
person schema:givenName ?givenName .
person schema:familyName ?familyName .
BIND(CONCAT(?givenName, "", 2familyName) AS 2person_name).

}
}
ORDER BY ?person_name

SPARQL query result

https://orcid.org/0000-0001-9745-3222
https://orcid.org/0000-0002-7619-824X
https://orcid.org/0000-0002-0855-4169,
https://orcid.org/0000-0002-6801-2484
https://orcid.org/0000-0001-91 44-2848
https://orcid.org/0000-0001-8778-6779
https://orcid.org/0000-0002-3523-1883
https://orcid.org/0000-0002-0235-9506
https://orcid.org/0000-0002-2168-0514
https://orcid.org/0000-0003-4851-015X
https://orcid.org/0000-0002-4989-3976
https://orcid.org/0000-0002-8457-345X
https://orcid.org/0000-0003-4342-2089
https://orcid.org/0000-0002-3407-8397
https://orcid.org/0000-0002-34 10-7258
https://orcid.org/0000-0002-8196-288X
https://orcid.org/0000-0003-2926-1645,
https://orcid.org/0000-0002-6143-3411

Anna Trias-Blasi
Colin Pendry
Danilo Neves
David Harris
Elspeth Haston
Felicity Anderson
Hannah Atkins
Laura Forrest
Mark Hughes
Mark Newman
Mark Watson
Markus Ruhsam
Peter Moonlight
Peter Wilkie
Sabina Knees
Toby Pennington
Zoé Goodwin
ystein Lofthus
␌
~~~

4. manually curate results, fixing OCR transcription errors, to produce a well-formed sparql query


~~~
PREFIX schema: <http://schema.org/>
SELECT DISTINCT ?person ?person_name
FROM <https://www.ipni.org>
FROM <https://orcid.org>
WHERE {
?id schema:propertyID "RINGGOLD" .
?id schema:value "41803" .
?org schema:identifier ?id .
?person schema:affiliation ?org .
?work schema:creator ?person .
?taxonName schema:isBasedOn ?work .
?taxonName schema:name ?name .
{
?person schema:givenName ?givenName .
?person schema:familyName ?familyName .
BIND(CONCAT(?givenName, "", ?familyName) AS ?person_name).

}
}
ORDER BY ?person_name
~~~

5. execute query using [oxigraph](https://oxigraph.org) v0.3.18 via

~~~
$ cat query.sparql\
 | ./oxigraph query\
 --location /some/path\
 --results-format txt
~~~

produced an empty result including only a header:

~~~
ORDER BY ?person_name
~~~
 
6. Rerun query after removing the explicit `FROM` statements:

~~~
PREFIX schema: <http://schema.org/>
SELECT DISTINCT ?person ?person_name
# FROM <https://www.ipni.org>
# FROM <https://orcid.org>
WHERE {
?id schema:propertyID "RINGGOLD" .
?id schema:value "41803" .
?org schema:identifier ?id .
?person schema:affiliation ?org .
?work schema:creator ?person .
?taxonName schema:isBasedOn ?work .
?taxonName schema:name ?name .
{
?person schema:givenName ?givenName .
?person schema:familyName ?familyName .
BIND(CONCAT(?givenName, " ", ?familyName) AS ?person_name).

}
}
ORDER BY ?person_name
~~~
: Query with FROM statement removed

produced the expected results results:

~~~
person,person_name
https://orcid.org/0000-0001-9745-3222,Anna Trias-Blasi
https://orcid.org/0000-0003-0008-0664,Christopher Walker
https://orcid.org/0000-0002-7619-824X,Colin Pendry
https://orcid.org/0000-0002-0855-4169,Danilo Neves
https://orcid.org/0000-0002-6801-2484,David Harris
https://orcid.org/0000-0003-0522-6802,David Mann
https://orcid.org/0000-0002-4990-724X,De-Zhu Li
https://orcid.org/0000-0001-9144-2848,Elspeth Haston
https://orcid.org/0000-0001-8778-6779,Felicity Anderson
https://orcid.org/0000-0002-3523-1883,Hannah Atkins
https://orcid.org/0000-0002-0235-9506,Laura Forrest
https://orcid.org/0000-0002-2168-0514,Mark Hughes
https://orcid.org/0000-0003-4851-015X,Mark Newman
https://orcid.org/0000-0002-4989-3976,Mark Watson
https://orcid.org/0000-0002-8457-345X,Markus Ruhsam
https://orcid.org/0000-0003-4342-2089,Peter Moonlight
https://orcid.org/0000-0002-3407-8397,Peter Wilkie
https://orcid.org/0000-0003-1518-9451,Rebecca Yahr
https://orcid.org/0000-0002-3410-7258,Sabina Knees
https://orcid.org/0000-0002-8196-288X,Toby Pennington
https://orcid.org/0000-0003-2926-1645,Zoë Goodwin
https://orcid.org/0000-0002-6143-3411,Øystein Lofthus
~~~




# Discussion


 
