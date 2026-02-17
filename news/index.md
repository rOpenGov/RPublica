# Changelog

## RPublica (development version)

- Update package with the new API.

- Adapt documentation to new versions of `roxygen2` and moved to
  markdown format.

- Refactor full test suite.

## RPublica 0.1.3

CRAN release: 2015-12-22

- Switched `RCurl::curlEscape()` to
  [`curl::curl_escape()`](https://jeroen.r-universe.dev/curl/reference/curl_escape.html).

## RPublica 0.1.2

CRAN release: 2014-12-20

- The package now uses
  [`httr::GET()`](https://httr.r-lib.org/reference/GET.html) for HTTP
  requests and jsonlite instead of RJSONIO for response conversion.
- Support for XML-formatted responses is removed, for simplicity.
- Responses should now return “flatter” data structures, often
  dataframes or lists containing dataframes in an effort to ease data
  transformation (h/t Jeroen Ooms)

## RPublica 0.1.1

CRAN release: 2014-05-10

- Initial package release
