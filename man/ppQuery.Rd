% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppQuery.R
\name{ppQuery}
\alias{ppQuery}
\title{API Query}
\usage{
ppQuery(op, baseurl, args = NULL, verbose = FALSE, ...)
}
\arguments{
\item{op}{A character string containing an API operation, and
associated arguments.}

\item{baseurl}{The base URL for conducting the API query.}

\item{args}{A character string containing additional URL-encoded parameters.}

\item{verbose}{Whether to display informative messages on the query.}

\item{...}{
  Arguments passed on to \code{\link[httr:GET]{httr::GET}}
  \describe{
    \item{\code{config}}{Additional configuration settings such as http
authentication (\code{\link[httr:authenticate]{authenticate()}}), additional headers
(\code{\link[httr:add_headers]{add_headers()}}), cookies (\code{\link[httr:set_cookies]{set_cookies()}}) etc.
See \code{\link[httr:config]{config()}} for full details and list of helpers.}
    \item{\code{handle}}{The handle to use with this request. If not
supplied, will be retrieved and reused from the \code{\link[httr:handle_pool]{handle_pool()}}
based on the scheme, hostname and port of the url. By default \pkg{httr}
requests to the same scheme/host/port combo. This substantially reduces
connection time, and ensures that cookies are maintained over multiple
requests to the same host. See \code{\link[httr:handle_pool]{handle_pool()}} for more
details.}
  }}
}
\value{
The result of the query, typically a list object.
}
\description{
Execute an API query
}
\examples{
\dontrun{
geos <- ppQuery("geos",
  baseurl = "http://projects.propublica.org/forensics/"
)
}

}
\author{
Thomas J. Leeper
}