
# RPublica <a href='https://ropengov.github.io/RPublica/'><img src="man/figures/logo.png" align="right" height="139"/></a>

<!-- badges: start -->

[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](http://ropengov.org/)
[![CRAN
Version](http://www.r-pkg.org/badges/version/RPublica)](https://CRAN.R-project.org/package=RPublica)
![Downloads](http://cranlogs.r-pkg.org/badges/RPublica) [![R build
status](https://github.com/rOpenGov/RPublica/workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/RPublica/actions)

<!-- badges: end -->

## ProPublica API Client

The package is released under GPL-2 as part of the
[rOpenGov](http://ropengov.github.io/) project. Licenses for the data
depend on the particular API, but access to that data (regardless of
license) through the APIs is allowed under [ProPublica’s Data Terms of
Use](https://www.propublica.org/datastore/terms/).

The package serves as a client library for the (currently) three
[ProPublica](https://www.propublica.org/) data journalism APIs:

-   [Nonprofit
    Explorer](https://projects.propublica.org/nonprofits/api), which
    provides access to IRS Form 990 data on for every organization
    required to file a Form 990 (i.e., those claiming tax exempt
    status). These data are in the public domain.

-   [Forensics](https://projects.propublica.org/forensics/api.html),
    which provides state- and county-level data about coroner and
    medical examiner systems. These data are released under a modified
    Creative Commons license.

-   [Free the
    Files](https://projects.propublica.org/free-the-files/api), which
    provides access to political television spending data based on FCC
    filings in 33 swing markets. These data are released under a
    modified Creative Commons license.

## Installation

**RPublica** is [available on
GitHub](https://github.com/rOpenGov/RPublica) and can (soon) be
installed from within R from your favorite CRAN mirror:

``` r
install.packages("RPublica")
```

And the latest development version, available here, can be installed
directly using [devtools](https://CRAN.R-project.org/package=devtools):

``` r
# install.packages("devtools")
library("devtools")
install_github("rOpenGov/RPublica")
```

## Using the package

### Nonprofit Explorer

The [Nonprofit Explorer
API](https://projects.propublica.org/nonprofits/api) functionality
includes two functions: `npsearch`, to retrieve subsets of available
organizations, and `np_org` to retrieve detailed information about a
given organization including a direct link to the complete Form 990 for
that organization (as a PDF).

``` r
library("RPublica")
str(np_search("propublica"), max = 1)
#> List of 12
#>  $ total_results : int 1
#>  $ organizations :'data.frame':  1 obs. of  14 variables:
#>  $ num_pages     : int 1
#>  $ cur_page      : int 0
#>  $ page_offset   : int 0
#>  $ per_page      : int 100
#>  $ search_query  : chr "propublica"
#>  $ selected_state: NULL
#>  $ selected_ntee : chr "NULL"
#>  $ selected_code : NULL
#>  $ data_source   : chr "ProPublica Nonprofit Explorer API: https://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Bu"| __truncated__
#>  $ api_version   : int 2
str(np_org(142007220), max = 1)
#> List of 5
#>  $ organization        :List of 34
#>  $ filings_with_data   :'data.frame':    9 obs. of  68 variables:
#>  $ filings_without_data:'data.frame':    7 obs. of  5 variables:
#>  $ data_source         : chr "ProPublica Nonprofit Explorer API: https://projects.propublica.org/nonprofits/api/\nIRS Exempt Organizations Bu"| __truncated__
#>  $ api_version         : int 2
```

### Forensics API

The [Forensics API](https://projects.propublica.org/forensics/api.html)
functionality includes two functions: `geos`, to return data for a
specific state, and `systems`, to return detailed data and statistics
about specified medical examiner (or coroner) system.

``` r
library("RPublica")
g <- geos()

tibble::as_tibble(g)
#> # A tibble: 80 x 15
#>    geo.ar_associat~ geo.cached_slug geo.coroner_sys~ geo.created_at geo.district
#>               <int> <chr>           <chr>            <chr>          <lgl>       
#>  1                1 ak              none             2011-05-04T12~ NA          
#>  2                2 ar              county           2011-05-04T12~ NA          
#>  3                3 ct              none             2011-05-04T12~ NA          
#>  4                4 de              none             2011-05-04T12~ NA          
#>  5                5 dc              none             2011-05-04T12~ NA          
#>  6                6 ky              county           2011-05-04T12~ NA          
#>  7                7 me              none             2011-05-04T12~ NA          
#>  8                8 md              none             2011-05-04T12~ NA          
#>  9                9 ma              none             2011-05-04T12~ NA          
#> 10               10 mt              county           2011-05-04T12~ NA          
#> # ... with 70 more rows, and 10 more variables: geo.id <int>, geo.kind <chr>,
#> #   geo.medical_examiner_system <chr>, geo.name <chr>, geo.note <lgl>,
#> #   geo.population <lgl>, geo.postal_abbreviation <chr>, geo.updated_at <chr>,
#> #   geo.system_types.medical_examiner_system <chr>,
#> #   geo.system_types.coroner_system <chr>
```

### Free the Files

The [Free the Files
API](https://projects.propublica.org/free-the-files/api) functionality
includes four functions: `market` (for retrieving available markets, or
a specific market), `station` (for retrieving station-specific
data`,`committee`(for retrieving sponsoring committees, or a specific such committee), and`filing\`
(for retrieving details of a specific filing). A codebook describing the
values returned by each function is available at:
<https://projects.propublica.org/free-the-files/api>.

``` r
library("RPublica")
tibble::as_tibble(market())
#> # A tibble: 33 x 5
#>    market.name   market.slug  market.titleized~ market.filings_~ market.freed_ct
#>    <chr>         <chr>        <chr>                        <int>           <int>
#>  1 NEW YORK      new-york     New York                       475             127
#>  2 PHILADELPHIA  philadelphia Philadelphia                   718             642
#>  3 BOSTON (MANC~ boston-manc~ Boston and Manch~             1736             726
#>  4 WASHINGTON D~ washington-~ Washington, D.C.~              988             626
#>  5 ATLANTA       atlanta      Atlanta                          4               0
#>  6 DETROIT       detroit      Detroit                        658             420
#>  7 PHOENIX (PRE~ phoenix-pre~ Phoenix and Pres~             1331             869
#>  8 TAMPA-ST. PE~ tampa-st-pe~ Tampa, St. Peter~             2687             527
#>  9 MINNEAPOLIS-~ minneapolis~ Minneapolis-St. ~             1429             815
#> 10 MIAMI-FT. LA~ miami-ft-la~ Miami and Ft. La~              564             129
#> # ... with 23 more rows

m <- market("new-york")
s <- station("WEWS-TV")
str(committee())
#> 'data.frame':    1203 obs. of  4 variables:
#>  $ committee.gross_amt: chr  NA "221983291.25" "91778107" "57249945" ...
#>  $ committee.id       : int  4665 1221 1220 942 3959 3820 883 1170 907 1172 ...
#>  $ committee.name     : chr  "PLANNED PARENTHOOD/ ISSUE" "OBAMA FOR AMERICA" "ROMNEY FOR PRESIDENT" "AMERICAN CROSSROADS" ...
#>  $ committee.slug     : chr  "planned-parenthood-issue" "obama-for-america" "romney-for-president" "american-crossroads--2" ...
```
