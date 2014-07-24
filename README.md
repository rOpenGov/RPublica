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
library('RPublica')
```

```
## 
## Attaching package: 'RPublica'
## 
## The following objects are masked _by_ '.GlobalEnv':
## 
##     committee, filing, geos, market, np_org, np_search, ppQuery,
##     station, systems
```

```r
str(np_search('propublica'), max=2)
```

```
## List of 14
##  $ total_results : num 2
##  $ filings       :'data.frame':	2 obs. of  69 variables:
##   ..$ tax_prd              : num [1:2] 201212 201112
##   ..$ tax_prd_yr           : num [1:2] 2012 2011
##   ..$ formtype             : num [1:2] 0 0
##   ..$ pdf_url              : chr [1:2] "https://bulk.resource.org/irs.gov/eo/2013_09_EO/14-2007220_990_201212.pdf" "https://bulk.resource.org/irs.gov/eo/2012_08_EO/14-2007220_990_201112.pdf"
##   ..$ updated              : chr [1:2] "2014-04-30T16:31:12Z" "2013-04-11T16:18:36Z"
##   ..$ totrevenue           : num [1:2] 10955982 10142780
##   ..$ totfuncexpns         : num [1:2] 9884450 9651650
##   ..$ totassetsend         : num [1:2] 4529443 3591151
##   ..$ totliabend           : num [1:2] 119078 252318
##   ..$ pct_compnsatncurrofcr: num [1:2] 0 0.161
##   ..$ tax_pd               : logi [1:2] NA NA
##   ..$ subseccd             : num [1:2] 3 3
##   ..$ unrelbusinccd        : chr [1:2] "Y" "Y"
##   ..$ initiationfees       : num [1:2] 0 0
##   ..$ grsrcptspublicuse    : num [1:2] 0 0
##   ..$ grsincmembers        : num [1:2] 0 0
##   ..$ grsincother          : num [1:2] 0 0
##   ..$ totcntrbgfts         : num [1:2] 10920019 10115367
##   ..$ totprgmrevnue        : num [1:2] 0 0
##   ..$ invstmntinc          : num [1:2] 50 83
##   ..$ txexmptbndsproceeds  : num [1:2] 0 0
##   ..$ royaltsinc           : num [1:2] 17096 4547
##   ..$ grsrntsreal          : num [1:2] 0 0
##   ..$ grsrntsprsnl         : num [1:2] 0 0
##   ..$ rntlexpnsreal        : num [1:2] 0 0
##   ..$ rntlexpnsprsnl       : num [1:2] 0 0
##   ..$ rntlincreal          : num [1:2] 0 0
##   ..$ rntlincprsnl         : num [1:2] 0 0
##   ..$ netrntlinc           : num [1:2] 0 0
##   ..$ grsalesecur          : num [1:2] 0 0
##   ..$ grsalesothr          : num [1:2] 0 0
##   ..$ cstbasisecur         : num [1:2] 0 0
##   ..$ cstbasisothr         : num [1:2] 0 0
##   ..$ gnlsecur             : num [1:2] 0 0
##   ..$ gnlsothr             : num [1:2] 0 0
##   ..$ netgnls              : num [1:2] 0 0
##   ..$ grsincfndrsng        : num [1:2] 0 0
##   ..$ lessdirfndrsng       : num [1:2] 0 0
##   ..$ netincfndrsng        : num [1:2] 0 0
##   ..$ grsincgaming         : num [1:2] 0 0
##   ..$ lessdirgaming        : num [1:2] 0 0
##   ..$ netincgaming         : num [1:2] 0 0
##   ..$ grsalesinvent        : num [1:2] 0 0
##   ..$ lesscstofgoods       : num [1:2] 0 0
##   ..$ netincsales          : num [1:2] 0 0
##   ..$ miscrevtot11e        : num [1:2] 18817 22783
##   ..$ compnsatncurrofcr    : num [1:2] 0 1552988
##   ..$ othrsalwages         : num [1:2] 0 4522408
##   ..$ payrolltx            : num [1:2] 0 331237
##   ..$ profndraising        : num [1:2] 0 0
##   ..$ txexmptbndsend       : num [1:2] 0 0
##   ..$ secrdmrtgsend        : num [1:2] 0 0
##   ..$ unsecurednotesend    : num [1:2] 0 0
##   ..$ retainedearnend      : num [1:2] 0 0
##   ..$ totnetassetend       : num [1:2] 4410365 3338833
##   ..$ nonpfrea             : chr [1:2] "07" "07"
##   ..$ gftgrntsrcvd170      : num [1:2] 46144525 36669506
##   ..$ txrevnuelevied170    : num [1:2] 0 0
##   ..$ srvcsval170          : num [1:2] 0 0
##   ..$ grsinc170            : num [1:2] 70024 41334
##   ..$ grsrcptsrelated170   : num [1:2] 0 0
##   ..$ totgftgrntrcvd509    : num [1:2] 0 0
##   ..$ grsrcptsadmissn509   : num [1:2] 0 0
##   ..$ txrevnuelevied509    : num [1:2] 0 0
##   ..$ srvcsval509          : num [1:2] 0 0
##   ..$ subtotsuppinc509     : num [1:2] 0 0
##   ..$ totsupp509           : num [1:2] 0 0
##   ..$ ein                  : num [1:2] 1.42e+08 1.42e+08
##   ..$ organization         :'data.frame':	2 obs. of  33 variables:
##  $ num_pages     : num 1
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
str(np_org(142007220), max=1)
```

```
## List of 5
##  $ organization        :List of 31
##  $ filings_with_data   :'data.frame':	2 obs. of  68 variables:
##  $ filings_without_data:'data.frame':	4 obs. of  4 variables:
##  $ data_source         : chr "ProPublica Nonprofit Explorer API: http://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Business Master Fil"| __truncated__
##  $ api_version         : num 1
```

### Forensics API ###

The [Forensics API](http://projects.propublica.org/forensics/api) functionality includes two functions: `geos`, to return data for a specific state, and `systems`, to return detailed data and statistics about specified medical examiner (or coroner) system.


```r
library('RPublica')
g <- geos()
str(g)
```

```
## 'data.frame':	80 obs. of  15 variables:
##  $ geo.ar_association_key_name             : num  1 2 3 4 5 6 7 8 9 10 ...
##  $ geo.cached_slug                         : chr  "ak" "ar" "ct" "de" ...
##  $ geo.coroner_system                      : chr  "none" "county" "none" "none" ...
##  $ geo.created_at                          : chr  "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" "2011-05-04T12:22:11-04:00" ...
##  $ geo.district                            : logi  NA NA NA NA NA NA ...
##  $ geo.id                                  : num  2 5 9 10 11 21 23 24 25 30 ...
##  $ geo.kind                                : chr  "state" "state" "state" "state" ...
##  $ geo.medical_examiner_system             : chr  "state" "state" "state" "state" ...
##  $ geo.name                                : chr  "Alaska" "Arkansas" "Connecticut" "Delaware" ...
##  $ geo.note                                : logi  NA NA NA NA NA NA ...
##  $ geo.population                          : logi  NA NA NA NA NA NA ...
##  $ geo.postal_abbreviation                 : chr  "AK" "AR" "CT" "DE" ...
##  $ geo.updated_at                          : chr  "2011-05-04T12:25:09-04:00" "2011-05-04T12:25:09-04:00" "2011-05-04T12:25:09-04:00" "2011-05-04T12:25:09-04:00" ...
##  $ geo.system_types.medical_examiner_system: chr  "state" "state" "state" "state" ...
##  $ geo.system_types.coroner_system         : chr  "none" "county" "none" "none" ...
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
##   ..$ id                     : num 36
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
##  $ stats                      :'data.frame':	42 obs. of  3 variables:
##  $ geos                       :'data.frame':	5 obs. of  12 variables:
```


### Free the Files ###

The [Free the Files API](https://projects.propublica.org/free-the-files/api) functionality includes four functions: `market` (for retrieving available markets, or a specific market), `station` (for retrieving station-specific data`, `committee` (for retrieving sponsoring committees, or a specific such committee), and `filing` (for retrieving details of a specific filing). A codebook describing the values returned by each function is available at: https://projects.propublica.org/free-the-files/api.


```r
library('RPublica')
str(market())
```

```
## 'data.frame':	33 obs. of  5 variables:
##  $ market.name          : chr  "NEW YORK" "PHILADELPHIA" "BOSTON (MANCHESTER)" "WASHINGTON DC (HAGRSTWN)" ...
##  $ market.slug          : chr  "new-york" "philadelphia" "boston-manchester" "washington-dc-hagrstwn" ...
##  $ market.titleized_name: chr  "New York" "Philadelphia" "Boston and Manchester, N.H." "Washington, D.C. and Hagerstown, Md." ...
##  $ market.filings_ct    : num  475 780 1736 988 5 ...
##  $ market.freed_ct      : num  127 637 724 626 0 420 869 524 812 128 ...
```

```r
m <- market('new-york')
s <- station('WEWS-TV')
str(committee())
```

```
## 'data.frame':	1202 obs. of  4 variables:
##  $ committee.gross_amt: chr  NA "221686816.25" "91778107" "57208760" ...
##  $ committee.id       : num  4665 1221 1220 942 3959 ...
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
##  $ agency              :List of 1
##   ..$ name: chr "GREER MARGOLIS MITCHELL"
```
