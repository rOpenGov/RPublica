#' Forensics API
#'
#' Retrieve details about a given state or system
#'
#' @name forensics
#' @rdname forensics
#'
#' @param state An optional character string containing a two-letter state
#'   postal code. If `NULL`, results for all available states are returned.
#' @param id The identification number for a particular medical examiner or
#' coroner system.
#'
#' @inheritDotParams ppQuery -op -baseurl
#' @inheritDotParams httr::GET -url
#'
#' @author Thomas J. Leeper
#'
#' @references
#' [API Documentation](https://projects.propublica.org/forensics/api.html)
#'
#' @return The result of the query, typically a list object.
#' @examples
#' \dontrun{
#'
#' geos("48029")
#'
#' systems(39)
#' }
#'
#' @export
geos <- function(state = NULL, ...) {
  if (is.null(state)) {
    out <- ppQuery("geos", baseurl = "http://projects.propublica.org/forensics/", ...)
  } else {
    out <- ppQuery(paste("geos", state, sep = "/"),
      baseurl = "http://projects.propublica.org/forensics/", ...
    )
  }
  return(out)
}

#' @rdname forensics
#' @export
systems <- function(id, ...) {
  if (missing(id)) {
    out <- ppQuery("systems", baseurl = "http://projects.propublica.org/forensics/", ...)
    return(out)
  } else {
    out <- ppQuery(paste("systems", id, sep = "/"),
      baseurl = "http://projects.propublica.org/forensics/", ...
    )

    return(out[[1]])
  }
}
