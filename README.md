# ProPublica API Client #

[![Build Status](https://travis-ci.org/rOpenGov/RPublica.png?branch=master)](https://travis-ci.org/rOpenGov/RPublica)

The package is released under GPL-2 as part of the [rOpenGov](http://ropengov.github.io/) project. Licenses for the data depend on the particular API, but access to that data (regardless of license) through the APIs is allowed under [ProPublica's Data Terms of Use](http://www.propublica.org/about/propublica-data-terms-of-use).

The package serves as a client library for the (currently) three [ProPublica](http://www.propublica.org/) data journalism APIs:

 - [Nonprofit Explorer](http://projects.propublica.org/nonprofits/api), which provides access to IRS Form 990 data on for every organization required to file a Form 990 (i.e., those claiming tax exempt status). These data are in the public domain.

 - [Forensics](http://projects.propublica.org/forensics/api), which provides state- and county-level data about coroner and medical examiner systems. These data are released under a modified Creative Commons license.

 - [Free the Files](https://projects.propublica.org/free-the-files/api), which provides access to political television spending data based on FCC filings in 33 swing markets. These data are released under a modified Creative Commons license.


## Installation ##

**RPublica** is [available on GitHub](http://github.com/rOpenGov/RPublica) and can (soon) be installed from within R from your favorite CRAN mirror:

```
install.packages("RPublica")
```

And the latest development version, available here, can be installed directly using  [devtools](http://cran.r-project.org/web/packages/devtools/index.html):

```
# install.packages("devtools")
library("devtools")
install_github("rOpenGov/RPublica")
```

## Using the package ##

### Nonprofit Explorer ###

The [Nonprofit Explorer API](http://projects.propublica.org/nonprofits/api) functionality includes two functions: `npsearch`, to retrieve subsets of available organizations, and `np_org` to retrieve detailed information about a given organization including a direct link to the complete Form 990 for that organization (as a PDF).


```r
library("RPublica")
str(np_search("propublica"), max = 2)
```

```
## List of 13
##  $ total_results : num 1
##  $ filings       :List of 1
##   ..$ :List of 68
##  $ cur_page      : num 0
##  $ page_offset   : num 0
##  $ per_page      : num 25
##  $ order         : NULL
##  $ sort_order    : NULL
##  $ search_query  : chr "propublica"
##  $ selected_state: NULL
##  $ selected_ntee : num 0
##  $ selected_code : NULL
##  $ data_source   : chr "ProPublica Nonprofit Explorer API: http://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Business Master Fil"| __truncated__
##  $ api_version   : num 1
```

```r
str(np_org(142007220), max = 1)
```

```
## List of 5
##  $ organization        :List of 31
##  $ filings_with_data   :List of 2
##  $ filings_without_data:List of 4
##  $ data_source         : chr "ProPublica Nonprofit Explorer API: http://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Business Master Fil"| __truncated__
##  $ api_version         : num 1
```


### Forensics API ###

The [Forensics API](http://projects.propublica.org/forensics/api) functionality includes two functions: `geos`, to return data for a specific state, and `systems`, to return detailed data and statistics about specified medical examiner (or coroner) system.


```r
library("RPublica")
g <- geos()
str(g[[1]])
```

```
## List of 1
##  $ geo:List of 14
##   ..$ ar_association_key_name: num 1
##   ..$ cached_slug            : chr "ak"
##   ..$ coroner_system         : chr "none"
##   ..$ created_at             : chr "2011-05-04T12:22:11-04:00"
##   ..$ district               : NULL
##   ..$ id                     : num 2
##   ..$ kind                   : chr "state"
##   ..$ medical_examiner_system: chr "state"
##   ..$ name                   : chr "Alaska"
##   ..$ note                   : NULL
##   ..$ population             : NULL
##   ..$ postal_abbreviation    : chr "AK"
##   ..$ updated_at             : chr "2011-05-04T12:25:09-04:00"
##   ..$ system_types           : Named chr [1:2] "state" "none"
##   .. ..- attr(*, "names")= chr [1:2] "medical_examiner_system" "coroner_system"
```

```r
str(geos("ny"))
```

```
## List of 1
##  $ geo:List of 15
##   ..$ cached_slug            : chr "ny"
##   ..$ coroner_system         : chr "sometimes"
##   ..$ created_at             : chr "2011-05-04T12:22:12-04:00"
##   ..$ district               : NULL
##   ..$ id                     : num 36
##   ..$ kind                   : chr "state"
##   ..$ medical_examiner_system: chr "sometimes"
##   ..$ name                   : chr "New York"
##   ..$ note                   : NULL
##   ..$ population             : NULL
##   ..$ postal_abbreviation    : chr "NY"
##   ..$ updated_at             : chr "2011-05-04T12:25:11-04:00"
##   ..$ system_types           : Named chr [1:2] "sometimes" "sometimes"
##   .. ..- attr(*, "names")= chr [1:2] "medical_examiner_system" "coroner_system"
##   ..$ medical_examiners      : list()
##   .. ..- attr(*, "class")= chr "AsIs"
##   ..$ coroners               : list()
##   .. ..- attr(*, "class")= chr "AsIs"
```

```r
str(systems(36), max = 1)
```

```
## List of 18
##  $ accreditation              : chr ""
##  $ autopsies                  : NULL
##  $ bc_forensic_pathologists   : num 22
##  $ cached_slug                : NULL
##  $ created_at                 : chr "2011-05-04T12:23:55-04:00"
##  $ fellows                    : num 4
##  $ forensic_pathologists      : NULL
##  $ id                         : num 36
##  $ name                       : chr "New York City Office of Chief Medical Examiner"
##  $ note                       : chr "Not included in analysis of autopsy data. "
##  $ pending                    : NULL
##  $ pt_bc_forensic_pathologists: num 0
##  $ pt_uc_forensic_pathologists: num 0
##  $ uc_forensic_pathologists   : num 4
##  $ updated_at                 : chr "2011-05-04T12:23:55-04:00"
##  $ website                    : chr "http://www.nyc.gov/html/ocme/html/home/home.shtml"
##  $ stats                      :List of 42
##  $ geos                       :List of 5
```



### Free the Files ###

The [Free the Files API](https://projects.propublica.org/free-the-files/api) functionality includes four functions: `market` (for retrieving available markets, or a specific market), `station` (for retrieving station-specific data`, `committee` (for retrieving sponsoring committees, or a specific such committee), and `filing` (for retrieving details of a specific filing). A codebook describing the values returned by each function is available at: https://projects.propublica.org/free-the-files/api.


```r
library("RPublica")
str(market()[1:2])
```

```
## List of 2
##  $ :List of 1
##   ..$ market:List of 5
##   .. ..$ name          : chr "NEW YORK"
##   .. ..$ slug          : chr "new-york"
##   .. ..$ titleized_name: chr "New York"
##   .. ..$ filings_ct    : num 475
##   .. ..$ freed_ct      : num 127
##  $ :List of 1
##   ..$ market:List of 5
##   .. ..$ name          : chr "PHILADELPHIA"
##   .. ..$ slug          : chr "philadelphia"
##   .. ..$ titleized_name: chr "Philadelphia"
##   .. ..$ filings_ct    : num 780
##   .. ..$ freed_ct      : num 637
```

```r
m <- market("new-york")
s <- station("WEWS-TV")
str(committee()[1:2])
```

```
## List of 2
##  $ :List of 1
##   ..$ committee:List of 4
##   .. ..$ gross_amt: NULL
##   .. ..$ id       : num 4665
##   .. ..$ name     : chr "PLANNED PARENTHOOD/ ISSUE"
##   .. ..$ slug     : chr "planned-parenthood-issue"
##  $ :List of 1
##   ..$ committee:List of 4
##   .. ..$ gross_amt: chr "221686816.25"
##   .. ..$ id       : num 1221
##   .. ..$ name     : chr "OBAMA FOR AMERICA"
##   .. ..$ slug     : chr "obama-for-america"
```

```r
ofa <- committee("obama-for-america")
str(filing(51212))
```

```
## List of 13
##  $ callsign            : chr "WHP-TV"
##  $ contract_number     : chr "69338"
##  $ dc_slug             : chr "501618-69338-2-13519611148107-_-pdf"
##  $ filing_type         : chr "Federal"
##  $ gross_amount        : num 35940
##  $ id                  : num 51212
##  $ market_id           : num 41
##  $ thumbnail_url       : chr "https://s3.amazonaws.com/s3.documentcloud.org/documents/501618/pages/69338-2-13519611148107-_-pdf-p1-thumbnail.gif"
##  $ transcriptions_count: num 2
##  $ upload_date         : chr "2012-11-03T00:00:00Z"
##  $ url                 : chr "/collect/files/72313/Political File/2012/Federal/President/BARACK OBAMA/69338/69338-2 (13519611148107)_.pdf"
##  $ committee           :List of 3
##   ..$ id  : num 1221
##   ..$ name: chr "OBAMA FOR AMERICA"
##   ..$ slug: chr "obama-for-america"
##  $ agency              : Named chr "GREER MARGOLIS MITCHELL"
##   ..- attr(*, "names")= chr "name"
```

