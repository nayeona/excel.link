% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xl.current.region.R
\name{xl.current.region}
\alias{[[.cr}
\alias{[[<-.cr}
\alias{cr}
\alias{crc}
\alias{crr}
\alias{crrc}
\alias{xl.current.region}
\title{Read/write from/to Excel current region.}
\usage{
xl.current.region(str.rng, drop = TRUE, na = "", row.names = FALSE,
  col.names = FALSE)

\method{[[}{cr}(x, str.rng, drop = !(has.rownames(x) | has.colnames(x)),
  na = "")

\method{[[}{cr}(x, str.rng, na = "") <- value
}
\arguments{
\item{str.rng}{character Excel range. For single bracket operations it can be
without quotes in almost all cases.}

\item{drop}{logical. If TRUE the result is coerced to the lowest possible 
dimension. By default dimensions will be dropped if there are no columns 
and rows names.}

\item{na}{character. NA representation in Excel. By default it is empty 
string.}

\item{row.names}{logical value indicating whether the Excel range contains 
the row names as its first column.}

\item{col.names}{logical value indicating whether the Excel range contains 
the column names as its first row.}

\item{x}{One of \code{cr}, \code{crc}, \code{crr}, \code{crrc} objects. 
\code{cr} - read/write with/without column and row names, "r" - with 
rownames, "c" - with colnames}

\item{value}{suitable replacement value. All data will be placed in Excel
sheet starting from top-left cell of current region. Current region will be
cleared before writing.}
}
\value{
Returns appropriate dataset from Excel.
}
\description{
Current region is a region that will be selected by pressing 
  \code{Ctrl+Shift+*} in Excel. The current region is a range bounded by any 
  combination of blank rows and blank columns. \code{cr}, \code{crc}, 
  \code{crr}, \code{crrc} objects are already defined in the package. It 
  doesn't need to create or init them.
}
\details{
\code{cr} object represents Microsoft Excel application. For 
  convenient interactive usage arguments can be given without quotes in most 
  cases (e. g. \code{cr[a1] = 5} or \code{cr[u2:u85] = "Hi"} or 
  \code{cr[MyNamedRange] = 42}, but \code{cr["Sheet1!A1"] = 42}). When it 
  used in your own functions or you need to use variable as argument it is 
  recommended apply double brackets notation: \code{cr[["a1"]] = 5} or 
  \code{cr[["u2:u85"]] = "Hi"} or \code{cr[["MyNamedRange"]] = 42}. 
  Difference between \code{cr}, \code{crc}, \code{crrc} and \code{crr} is 
  \code{cr} ignore row and column names, \code{crc} suppose read and write to
  Excel with column names, \code{crrc} - with column and row names and so on.
  There is argument \code{drop} which is \code{TRUE} by default for \code{cr}
  and \code{FALSE} by default for other options. 
  All these functions never coerce characters to factors
}
\examples{

\dontrun{ 
data(iris)
data(mtcars)
xl.workbook.add()
xlc$a1 = iris
identical(crc[a1],xlc[a1:e151]) # should be TRUE
identical(crc$a1,xlc[a1:e151]) # should be TRUE
identical(crc$a1,xlc[a1]) # should be FALSE

# current region will be cleared before writing - no parts of iris dataset
crrc$a1 = mtcars 
identical(crrc$a1,xlrc[a1:l33]) # should be TRUE

}
}
\seealso{
\code{\link{xl}}
}

