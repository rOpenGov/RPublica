# ProPublica API Client #

[![Build Status](https://travis-ci.org/leeper/RPublica.png?branch=master)](https://travis-ci.org/leeper/RPublica)

The package is released under GPL-2 as part of the [rOpenGov](http://ropengov.github.io/) project. Licenses for the data depend on the particular API, but access to that data (regardless of license) through the APIs is allowed under [ProPublica's Data Terms of Use](http://www.propublica.org/about/propublica-data-terms-of-use).

The package serves as a client library for the (currently) three [ProPublica](http://www.propublica.org/) data journalism APIs:

 - [Nonprofit Explorer](http://projects.propublica.org/nonprofits/api), which provides access to IRS Form 990 data on for every organization required to file a Form 990 (i.e., those claiming tax exempt status). These data are in the public domain.

 - [Forensics](http://projects.propublica.org/forensics/api), which provides state- and county-level data about coroner and medical examiner systems. These data are released under a modified Creative Commons license.

 - [Free the Files](https://projects.propublica.org/free-the-files/api), which provides access to political television spending data based on FCC filings in 33 swing markets. These data are released under a modified Creative Commons license.


## Using the package ##

COMING SOON

### Nonprofit Explorer ###

The [Nonprofit Explorer API](http://projects.propublica.org/nonprofits/api) functionality includes two functions: `npsearch`, to retrieve subsets of available organizations, and `np_org` to retrieve detailed information about a given organization including a direct link to the complete Form 990 for that organization (as a PDF).

```
np_search('propublica')
np_org(142007220)
```

### Forensics API ###

The [Forensics API](http://projects.propublica.org/forensics/api) functionality includes two functions: `geos`, to return data for a specific state, and `systems`, to return detailed data and statistics about specified medical examiner (or coroner) system.

```
geos()
geos('ny')
systems(36)
```


### Free the Files ###

The [Free the Files API](https://projects.propublica.org/free-the-files/api) functionality includes four functions: `market` (for retrieving available markets, or a specific market), `station` (for retrieving station-specific data`, `committee` (for retrieving sponsoring committees, or a specific such committee), and `filing` (for retrieving details of a specific filing). A codebook describing the values returned by each function is available at: https://projects.propublica.org/free-the-files/api.

```
market()
market('new-york')
station('WEWS-TV')
committee()
committee('obama-for-america')
filing(51212)
```
