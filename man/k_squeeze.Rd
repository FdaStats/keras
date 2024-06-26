% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backend.R
\name{k_squeeze}
\alias{k_squeeze}
\title{Removes a 1-dimension from the tensor at index \code{axis}.}
\usage{
k_squeeze(x, axis = NULL)
}
\arguments{
\item{x}{A tensor or variable.}

\item{axis}{Axis to drop (axis indexes are 1-based).}
}
\value{
A tensor with the same data as \code{x} but reduced dimensions.
}
\description{
Removes a 1-dimension from the tensor at index \code{axis}.
}
\section{Keras Backend}{


This function is part of a set of Keras backend functions that enable
lower level access to the core operations of the backend tensor engine
(e.g. TensorFlow, CNTK, Theano, etc.).

You can see a list of all available backend functions here:
\url{https://keras.rstudio.com/articles/backend.html#backend-functions}.
}

