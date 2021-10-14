# RPublica <a href='https://ropengov.github.io/RPublica'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->
[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](http://ropengov.org/)
[![CRAN Version](http://www.r-pkg.org/badges/version/RPublica)](http://cran.r-project.org/package=RPublica)
![Downloads](http://cranlogs.r-pkg.org/badges/RPublica)
[![R build
status](https://github.com/rOpenGov/RPublica/workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/RPublica/actions)
<!-- badges: end -->


## ProPublica API Client 

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
library('RPublica')
str(np_search('propublica'), max=1)
```

```
## List of 14
##  $ total_results : int 2
##  $ filings       :'data.frame':	2 obs. of  101 variables:
##   .. [list output truncated]
##  $ num_pages     : int 1
##  $ cur_page      : int 0
##  $ page_offset   : int 0
##  $ per_page      : int 25
##  $ order         : NULL
##  $ sort_order    : NULL
##  $ search_query  : chr "propublica"
##  $ selected_state: NULL
##  $ selected_ntee : int 0
##  $ selected_code : NULL
##  $ data_source   : chr "ProPublica Nonprofit Explorer API: https://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Business Master Fi"| __truncated__
##  $ api_version   : int 1
```

```r
str(np_org(142007220), max=1)
```

```
## List of 5
##  $ organization        :List of 31
##  $ filings_with_data   :'data.frame':	2 obs. of  68 variables:
##  $ filings_without_data:'data.frame':	9 obs. of  5 variables:
##  $ data_source         : chr "ProPublica Nonprofit Explorer API: https://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Business Master Fi"| __truncated__
##  $ api_version         : int 1
```

### Forensics API ###

The [Forensics API](http://projects.propublica.org/forensics/api) functionality includes two functions: `geos`, to return data for a specific state, and `systems`, to return detailed data and statistics about specified medical examiner (or coroner) system.


```r
library('RPublica')
g <- geos()
str(g[1:5])
```

```
## 'data.frame':	80 obs. of  5 variables:
##  $ geo.ar_association_key_name: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ geo.cached_slug            : chr  "ak" "ar" "ct" "de" ...
##  $ geo.coroner_system         : chr  "none" "county" "none" "none" ...
##  $ geo.created_at             : chr  "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" ...
##  $ geo.district               : logi  NA NA NA NA NA NA ...
```

```r
str(geos('ny'))
```

```
## List of 1
##  $ geo:List of 15
##   ..$ cached_slug            : chr "ny"
##   ..$ coroner_system         : chr "sometimes"
##   ..$ created_at             : chr "2011-05-04T12:22:12-04:00"
##   ..$ district               : NULL
##   ..$ id                     : int 36
##   ..$ kind                   : chr "state"
##   ..$ medical_examiner_system: chr "sometimes"
##   ..$ name                   : chr "New York"
##   ..$ note                   : NULL
##   ..$ population             : NULL
##   ..$ postal_abbreviation    : chr "NY"
##   ..$ updated_at             : chr "2011-05-04T12:25:11-04:00"
##   ..$ system_types           :List of 2
##   .. ..$ medical_examiner_system: chr "sometimes"
##   .. ..$ coroner_system         : chr "sometimes"
##   ..$ medical_examiners      : list()
##   ..$ coroners               : list()
```

```r
str(systems(36), max=1)
```

```
## List of 18
##  $ accreditation              : chr ""
##  $ autopsies                  : NULL
##  $ bc_forensic_pathologists   : int 22
##  $ cached_slug                : NULL
##  $ created_at                 : chr "2011-05-04T12:23:55-04:00"
##  $ fellows                    : int 4
##  $ forensic_pathologists      : NULL
##  $ id                         : int 36
##  $ name                       : chr "New York City Office of Chief Medical Examiner"
##  $ note                       : chr "Not included in analysis of autopsy data. "
##  $ pending                    : NULL
##  $ pt_bc_forensic_pathologists: int 0
##  $ pt_uc_forensic_pathologists: int 0
##  $ uc_forensic_pathologists   : int 4
##  $ updated_at                 : chr "2011-05-04T12:23:55-04:00"
##  $ website                    : chr "http://www.nyc.gov/html/ocme/html/home/home.shtml"
##  $ stats                      :'data.frame':	42 obs. of  3 variables:
##  $ geos                       :'data.frame':	5 obs. of  12 variables:
```


### Free the Files ###

The [Free the Files API](https://projects.propublica.org/free-the-files/api) functionality includes four functions: `market` (for retrieving available markets, or a specific market), `station` (for retrieving station-specific data`, `committee` (for retrieving sponsoring committees, or a specific such committee), and `filing` (for retrieving details of a specific filing). A codebook describing the values returned by each function is available at: https://projects.propublica.org/free-the-files/api.


```r
library('RPublica')
str(market()[1:5])
```

```
## 'data.frame':	33 obs. of  5 variables:
##  $ market.name          : chr  "NEW YORK" "PHILADELPHIA" "BOSTON (MANCHESTER)" "WASHINGTON DC (HAGRSTWN)" ...
##  $ market.slug          : chr  "new-york" "philadelphia" "boston-manchester" "washington-dc-hagrstwn" ...
##  $ market.titleized_name: chr  "New York" "Philadelphia" "Boston and Manchester, N.H." "Washington, D.C. and Hagerstown, Md." ...
##  $ market.filings_ct    : int  475 718 1736 988 5 658 1331 2687 1429 565 ...
##  $ market.freed_ct      : int  127 642 726 626 0 420 869 527 813 128 ...
```

```r
m <- market('new-york')
s <- station('WEWS-TV')
str(committee())
```

```
## 'data.frame':	1203 obs. of  4 variables:
##  $ committee.gross_amt: chr  NA "221716606.25" "91778107" "57249945" ...
##  $ committee.id       : int  4665 1221 1220 942 3959 3820 883 1170 907 1172 ...
##  $ committee.name     : chr  "PLANNED PARENTHOOD/ ISSUE" "OBAMA FOR AMERICA" "ROMNEY FOR PRESIDENT" "AMERICAN CROSSROADS" ...
##  $ committee.slug     : chr  "planned-parenthood-issue" "obama-for-america" "romney-for-president" "american-crossroads--2" ...
```

```r
ofa <- committee('obama-for-america')
str(filing(51212))
```

```
## List of 13
##  $ callsign            : chr "WHP-TV"
##  $ contract_number     : chr "69338"
##  $ dc_slug             : chr "501618-69338-2-13519611148107-_-pdf"
##  $ filing_type         : chr "Federal"
##  $ gross_amount        : num 35940
##  $ id                  : int 51212
##  $ market_id           : int 41
##  $ thumbnail_url       : chr "https://s3.amazonaws.com/s3.documentcloud.org/documents/501618/pages/69338-2-13519611148107-_-pdf-p1-thumbnail.gif"
##  $ transcriptions_count: int 2
##  $ upload_date         : chr "2012-11-03T00:00:00Z"
##  $ url                 : chr "/collect/files/72313/Political File/2012/Federal/President/BARACK OBAMA/69338/69338-2 (13519611148107)_.pdf"
##  $ committee           :List of 3
##   ..$ id  : int 1221
##   ..$ name: chr "OBAMA FOR AMERICA"
##   ..$ slug: chr "obama-for-america"
##  $ agency              :List of 1
##   ..$ name: chr "GREER MARGOLIS MITCHELL"
```
