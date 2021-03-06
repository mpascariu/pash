% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lifetable_transform.R
\name{RebaseLT}
\alias{RebaseLT}
\title{Rebase Life-table to Different Age}
\usage{
RebaseLT(pash, origin = 0)
}
\arguments{
\item{pash}{A pace-shape object.}

\item{origin}{The age the life table should be rebased to.}
}
\value{
A pace-shape object.
}
\description{
Start the life-table at a later age.
}
\details{
The life table is truncated to the new origin age and the lx at origin set to
1. ndx, nLx, Tx and ex columns are re-calculated.
}
\examples{
# generate pace-shape object
pash <- Inputlx(x = prestons_lx$x, lx = prestons_lx$lx)
# rebase life table to age 50
lt50 <- RebaseLT(pash, 50)
lt50

# the rebase operation is reversible
lt0 = RebaseLT(lt50, 0)
lt0

}
