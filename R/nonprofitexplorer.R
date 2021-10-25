#' Nonprofit Explorer
#'
#' Search for and retrieve nonprofit data
#'
#' @rdname nonprofitexplorer
#'
#' @param q A character string containing a search query.
#'
#' @param order A character string containing a field by which to order the
#'   results. One of "name", "city", "state", "c_code", "fiscalyr", "revenue",
#'   "expenses", "assets", "liabilities", "pct_officer_compt". The ascending or
#'   descending sort by this parameter is controlled by `sort`.
#'
#' @param sort One of "asc" or "desc", controlling the order of the results
#'   (according the the ordering given in `order`).
#' @param state A two-letter state postal abbreviation code for a U.S. state or
#'   territory. Use "ZZ" for foreign organizations.
#' @param ntee A numeric value (between 1 and 10) containing a
#'   [National Taxonomy of Exempt Entities (NTEE) Major Group](https://nccs.urban.org/search?keywords=NTEE) code.
#' @param subsection A numeric value (between 2 and 92) referring to a
#'   subsection of tax code section 501(c).
#' @param ein An employer identification number (EIN).
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
#' np_search("propublica")
#' np_org(142007220)
#' }
#'
np_search <- function(q = NULL, order = NULL, sort = NULL, state = NULL, ntee = NULL, subsection = NULL, ...) {
  args <- formals()
  if (!is.null(q)) {
    args[names(args) == "q"] <- curl_escape(q)
  }
  if (!is.null(order)) {
    args[names(args) == "q"] <- curl_escape(order)
  }
  names(args)[names(args) == "sort"] <- curl_escape("sort_order")
  names(args)[names(args) == "state"] <- curl_escape("state[id]")
  names(args)[names(args) == "ntee"] <- curl_escape("ntee[id]")
  names(args)[names(args) == "subsection"] <- curl_escape("c_code[id]")
  args <- paste("?", paste(names(args), args, sep = "=", collapse = "&"), sep = "")
  out <- ppQuery("search",
    "https://projects.propublica.org/nonprofits/api/v2/",
    args = args, ...
  )
  return(out)
}

#' @rdname nonprofitexplorer
#' @export
np_org <- function(ein, ...) {
  out <- ppQuery(
    paste("organizations", ein, sep = "/"),
    "https://projects.propublica.org/nonprofits/api/v2/", ...
  )
  return(out)
}
