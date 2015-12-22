\name{committee}
\alias{committee}
\title{Retrieve committees or committee}
\description{Retrieve available committees, or a specific committee}
\usage{
committee(slug = NULL, ...)
}
\arguments{
  \item{slug}{An optional character string containing a \dQuote{slug} referring to a political committee.}
  \item{\dots}{Arguments passed to \code{\link[httr]{GET}}.}
}
%\details{}
%\value{}
%\references{}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{committee('obama-for-america')}
}
