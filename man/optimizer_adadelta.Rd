% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimizers.R
\name{optimizer_adadelta}
\alias{optimizer_adadelta}
\title{Adadelta optimizer.}
\usage{
optimizer_adadelta(
  learning_rate = 1,
  rho = 0.95,
  epsilon = NULL,
  decay = 0,
  clipnorm = NULL,
  clipvalue = NULL,
  ...
)
}
\arguments{
\item{learning_rate}{float >= 0. Learning rate.}

\item{rho}{float >= 0. Decay factor.}

\item{epsilon}{float >= 0. Fuzz factor. If \code{NULL}, defaults to \code{k_epsilon()}.}

\item{decay}{float >= 0. Learning rate decay over each update.}

\item{clipnorm}{Gradients will be clipped when their L2 norm exceeds this
value.}

\item{clipvalue}{Gradients will be clipped when their absolute value exceeds
this value.}

\item{...}{Unused, present only for backwards compatability}
}
\description{
Adadelta optimizer as described in \href{https://arxiv.org/abs/1212.5701}{ADADELTA: An Adaptive Learning Rate Method}.
}
\note{
It is recommended to leave the parameters of this optimizer at their
default values.
}
\seealso{
Other optimizers: 
\code{\link{optimizer_adagrad}()},
\code{\link{optimizer_adamax}()},
\code{\link{optimizer_adam}()},
\code{\link{optimizer_nadam}()},
\code{\link{optimizer_rmsprop}()},
\code{\link{optimizer_sgd}()}
}
\concept{optimizers}
