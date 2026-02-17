# API Query

Execute an API query

## Usage

``` r
ppQuery(op, baseurl, args = NULL, verbose = FALSE, ...)
```

## Arguments

- op:

  A character string containing an API operation, and associated
  arguments.

- baseurl:

  The base URL for conducting the API query.

- args:

  A character string containing additional URL-encoded parameters.

- verbose:

  Whether to display informative messages on the query.

- ...:

  Arguments passed on to
  [`httr::GET`](https://httr.r-lib.org/reference/GET.html)

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

## Value

The result of the query, typically a list object.

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{
geos <- ppQuery("geos",
  baseurl = "http://projects.propublica.org/forensics/"
)
} # }
```
