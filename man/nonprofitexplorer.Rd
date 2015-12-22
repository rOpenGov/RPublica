\name{nonprofitexplorer}
\alias{np_search}
\alias{np_org}
\title{Nonprofit Explorer}
\description{Search for and retrieve nonprofit data}
\usage{
np_search(q=NULL, order=NULL, sort=NULL, state=NULL, ntee=NULL, subsection=NULL, ...)

np_org(ein, ...)
}
\arguments{
  \item{q}{A character string containing a search query.}
  \item{order}{A character string containing a field by which to order the results. One of \dQuote{name}, \dQuote{city}, \dQuote{state}, \dQuote{c_code}, \dQuote{fiscalyr}, \dQuote{revenue}, \dQuote{expenses}, \dQuote{assets}, \dQuote{liabilities}, \dQuote{pct_officer_compt}. The ascending or descending sort by this parameter is controlled by \code{sort}.}
  \item{sort}{One of \dQuote{asc} or \dQuote{desc}, controlling the order of the results (according the the ordering given in \code{order}).}
  \item{state}{A two-letter state postal abbreviation code for a U.S. state or territory. Use \dQuote{ZZ} for foreign organizations.}
  \item{ntee}{A numeric value (between 1 and 10) containing a \href{http://nccs.urban.org/classification/NTEE.cfm}{National Taxonomy of Exempt Entities (NTEE) Major Group} code.}
  \item{subsection}{A numeric value (between 2 and 92) referring to a subsection of tax code section 501(c).}
  \item{ein}{An employer identification number (EIN).}
  \item{\dots}{Arguments passed to \code{\link[httr]{GET}}.}
}
%\details{}
\value{A list containing the API response.}
\references{\href{http://projects.propublica.org/nonprofits/api}{API Documentation}}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{np_search('propublica')}
\dontrun{np_org(142007220)}
}
