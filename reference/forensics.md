# Forensics API

Retrieve details about a given state or system

## Usage

``` r
geos(state = NULL, ...)

systems(id, ...)
```

## Arguments

- state:

  An optional character string containing a two-letter state postal
  code. If `NULL`, results for all available states are returned.

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

- id:

  The identification number for a particular medical examiner or coroner
  system.

## Value

The result of the query, typically a list object.

## References

[API Documentation](https://projects.propublica.org/forensics/api.html)

## Author

Thomas J. Leeper

## Examples

``` r
if (FALSE) { # \dontrun{

geos("48029")

systems(39)
} # }
```
