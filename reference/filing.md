# Retrieve filing

Retrieve a specific filing, by ID

## Usage

``` r
filing(id, ...)
```

## Arguments

- id:

  A character string containing a filing identification number.

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

## Value

The result of the query, typically a list object.

## See also

Other freethefiles:
[`committee()`](https://ropengov.github.io/RPublica/reference/committees.md),
[`market()`](https://ropengov.github.io/RPublica/reference/market.md),
[`station()`](https://ropengov.github.io/RPublica/reference/station.md)

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{

filing(51212)
} # }
```
