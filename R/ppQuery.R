#' API Query
#'
#' Execute an API query
#'
#' @author Thomas J. Leeper
#'
#' @param op A character string containing an API operation, and
#'   associated arguments.
#' @param baseurl The base URL for conducting the API query.
#' @param args A character string containing additional URL-encoded parameters.
#' @param verbose Whether to display informative messages on the query.
#' @inheritDotParams httr::GET
#'
#' @return The result of the query, typically a list object.
#'
#' @examples
#' \dontrun{
#' geos <- ppQuery("geos",
#' baseurl = "http://projects.propublica.org/forensics/")
#' }
#'
#' @export

ppQuery <-
  function(op, baseurl, args = NULL, verbose = FALSE, ...) {
    url <- paste(baseurl, op, ".json", args, sep = "")

    if (verbose) message("Passing ", url)
    response <- httr::GET(url = url)
    httr::stop_for_status(response)
    res <- jsonlite::fromJSON(httr::content(response,
      as = "text", encoding = "UTF-8"
    ),
    flatten = TRUE
    )

    res
  }
