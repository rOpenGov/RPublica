#' Retrieve market or markets
#'
#' Retrieve available markets, or a specific market
#' @rdname market
#'
#' @family freethefiles
#'
#' @param slug An optional character string containing a "slug" referring to
#' a media market.
#'
#' @inheritDotParams ppQuery -op -baseurl
#' @inheritDotParams httr::GET -url
#'
#' @author Thomas J. Leeper
#' @return The result of the query, typically a list object.
#' @export
#' @examples
#' \dontrun{
#'
#' market("new-york")
#' }
#'
market <- function(slug = NULL, ...) {
  if (is.null(slug)) {
    out <- ppQuery("markets", baseurl = "https://projects.propublica.org/free-the-files/", ...)
  } else {
    out <- ppQuery(paste("markets", slug, sep = "/"),
      baseurl = "https://projects.propublica.org/free-the-files/", ...
    )
  }
  return(out)
}

#' Retrieve station
#'
#' Retrieve station
#'
#' @rdname station
#' @family freethefiles
#'
#' @param callsign A character string containing a station callsign.
#'
#' @inheritDotParams ppQuery -op -baseurl
#' @inheritDotParams httr::GET -url
#'
#' @author Thomas J. Leeper
#' @return The result of the query, typically a list object.
#' @export
#' @examples
#' \dontrun{
#' station("WEWS-TV")
#' }
#'
station <- function(callsign, ...) {
  out <- ppQuery(paste("stations", callsign, sep = "/"),
    baseurl = "https://projects.propublica.org/free-the-files/",
    ...
  )
  return(out)
}


#' Retrieve committees or committee
#'
#' Retrieve available committees, or a specific committee
#'
#' @rdname committees
#' @family freethefiles
#'
#' @param slug An optional character string containing a "slug" referring to
#' a political committee.
#'
#' @inheritDotParams ppQuery -op -baseurl
#' @inheritDotParams httr::GET -url
#'
#' @author Thomas J. Leeper
#' @return The result of the query, typically a list object.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' committee("warren-for-senate-2012")
#' }
#'
committee <- function(slug = NULL, ...) {
  if (is.null(slug)) {
    out <- ppQuery("committees",
      baseurl = "https://projects.propublica.org/free-the-files/", ...
    )
  } else {
    out <- ppQuery(paste("committees", slug, sep = "/"),
      baseurl = "https://projects.propublica.org/free-the-files/", ...
    )
  }
  return(out)
}

#' Retrieve filing
#'
#' Retrieve a specific filing, by ID
#'
#' @rdname filing
#' @family freethefiles
#'
#' @param id A character string containing a filing identification number.
#'
#' @inheritDotParams ppQuery -op -baseurl
#' @inheritDotParams httr::GET -url
#'
#' @author Thomas J. Leeper
#' @return The result of the query, typically a list object.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' filing(51212)
#' }
#'
filing <- function(id, ...) {
  out <- ppQuery(paste("filings", id, sep = "/"),
    baseurl = "https://projects.propublica.org/free-the-files/", ...
  )
  return(out[[1]])
}
