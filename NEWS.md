# RPublica (development version)


# RPublica 0.1.3

* Switched `RCurl::curlEscape()` to `curl::curl_escape()`.

# RPublica 0.1.2

* The package now uses `httr::GET()` for HTTP requests and jsonlite instead of RJSONIO for response conversion.
* Support for XML-formatted responses is removed, for simplicity.
* Responses should now return "flatter" data structures, often dataframes or lists containing dataframes in an effort to ease data transformation (h/t Jeroen Ooms)


# RPublica 0.1.1

* Initial package release
