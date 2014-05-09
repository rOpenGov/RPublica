\name{forensics}
\alias{geos}
\alias{systems}
\title{Forensics API}
\description{Retrieve details about a given state or system}
\usage{
geos(state=NULL, ...)

systems(id, ...)
}
\arguments{
  \item{state}{An optional character string containing a two-letter state postal code. If \code{NULL}, results for all available states are returned.}
  \item{id}{The identification number for a particular medical examiner or coroner system.}
  \item{\dots}{Arguments passed to \code{\link{getURL}}.}
}
%\details{}
%\value{}
\references{\href{http://projects.propublica.org/forensics/api}{API Documentation}}
\author{Thomas J. Leeper}
%\note{}
%\seealso{}
\examples{
\dontrun{geos('ny')}

\dontrun{systems(36)}
}
