# Nonprofit Explorer

Search for and retrieve nonprofit data

## Usage

``` r
np_search(
  q = NULL,
  order = NULL,
  sort = NULL,
  state = NULL,
  ntee = NULL,
  subsection = NULL,
  ...
)

np_org(ein, ...)
```

## Arguments

- q:

  A character string containing a search query.

- order:

  A character string containing a field by which to order the results.
  One of "name", "city", "state", "c_code", "fiscalyr", "revenue",
  "expenses", "assets", "liabilities", "pct_officer_compt". The
  ascending or descending sort by this parameter is controlled by
  `sort`.

- sort:

  One of "asc" or "desc", controlling the order of the results
  (according the the ordering given in `order`).

- state:

  A two-letter state postal abbreviation code for a U.S. state or
  territory. Use "ZZ" for foreign organizations.

- ntee:

  A numeric value (between 1 and 10) containing a [National Taxonomy of
  Exempt Entities (NTEE) Major
  Group](https://nccs.urban.org/search?keywords=NTEE) code.

- subsection:

  A numeric value (between 2 and 92) referring to a subsection of tax
  code section 501(c).

- ...:

  Arguments passed on to
  [`ppQuery`](https://ropengov.github.io/RPublica/reference/ppQuery.md),
  [`httr::GET`](https://httr.r-lib.org/reference/GET.html)

  `args`

  :   A character string containing additional URL-encoded parameters.

  `verbose`

  :   Whether to display informative messages on the query.

  `config`

  :   Additional configuration settings such as http authentication
      ([`authenticate()`](https://httr.r-lib.org/reference/authenticate.html)),
      additional headers
      ([`add_headers()`](https://httr.r-lib.org/reference/add_headers.html)),
      cookies
      ([`set_cookies()`](https://httr.r-lib.org/reference/set_cookies.html))
      etc. See
      [`config()`](https://httr.r-lib.org/reference/config.html) for
      full details and list of helpers.

  `handle`

  :   The handle to use with this request. If not supplied, will be
      retrieved and reused from the
      [`handle_pool()`](https://httr.r-lib.org/reference/handle_pool.html)
      based on the scheme, hostname and port of the url. By default httr
      requests to the same scheme/host/port combo. This substantially
      reduces connection time, and ensures that cookies are maintained
      over multiple requests to the same host. See
      [`handle_pool()`](https://httr.r-lib.org/reference/handle_pool.html)
      for more details.

- ein:

  An employer identification number (EIN).

## Value

The result of the query, typically a list object.

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{
np_search("propublica")
np_org(142007220)
} # }
```
