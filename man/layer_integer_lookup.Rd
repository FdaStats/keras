% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-preprocessing.R
\name{layer_integer_lookup}
\alias{layer_integer_lookup}
\title{A preprocessing layer which maps integer features to contiguous ranges.}
\usage{
layer_integer_lookup(
  object,
  max_tokens = NULL,
  num_oov_indices = 1L,
  mask_token = NULL,
  oov_token = -1L,
  vocabulary = NULL,
  invert = FALSE,
  output_mode = "int",
  sparse = FALSE,
  pad_to_max_tokens = FALSE,
  ...
)
}
\arguments{
\item{object}{What to compose the new \code{Layer} instance with. Typically a
Sequential model or a Tensor (e.g., as returned by \code{layer_input()}).
The return value depends on \code{object}. If \code{object} is:
\itemize{
\item missing or \code{NULL}, the \code{Layer} instance is returned.
\item a \code{Sequential} model, the model with an additional layer is returned.
\item a Tensor, the output tensor from \code{layer_instance(object)} is returned.
}}

\item{max_tokens}{The maximum size of the vocabulary for this layer. If \code{NULL},
there is no cap on the size of the vocabulary. Note that this size
includes the OOV and mask tokens. Default to \code{NULL.}}

\item{num_oov_indices}{The number of out-of-vocabulary tokens to use. If this
value is more than 1, OOV inputs are modulated to determine their OOV
value. If this value is 0, OOV inputs will cause an error when calling the
layer. Defaults to 1.}

\item{mask_token}{An integer token that represents masked inputs. When
\code{output_mode} is \code{"int"}, the token is included in vocabulary and mapped
to index 0. In other output modes, the token will not appear in the
vocabulary and instances of the mask token in the input will be dropped.
If set to \code{NULL}, no mask term will be added. Defaults to \code{NULL}.}

\item{oov_token}{Only used when \code{invert} is \code{TRUE.} The token to return for OOV
indices. Defaults to -1.}

\item{vocabulary}{Optional. Either an array of integers or a string path to a text
file. If passing an array, can pass a list, list, 1D numpy array, or 1D
tensor containing the integer vocabulary terms. If passing a file path, the
file should contain one line per term in the vocabulary. If this argument
is set, there is no need to \code{adapt} the layer.}

\item{invert}{Only valid when \code{output_mode} is \code{"int"}. If \code{TRUE}, this layer will
map indices to vocabulary items instead of mapping vocabulary items to
indices. Default to \code{FALSE}.}

\item{output_mode}{Specification for the output of the layer. Defaults to \code{"int"}.
Values can be \code{"int"}, \code{"one_hot"}, \code{"multi_hot"}, \code{"count"}, or
\code{"tf_idf"} configuring the layer as follows:
\itemize{
\item \code{"int"}: Return the vocabulary indices of the input tokens.
\item \code{"one_hot"}: Encodes each individual element in the input into an
array the same size as the vocabulary, containing a 1 at the element
index. If the last dimension is size 1, will encode on that dimension.
If the last dimension is not size 1, will append a new dimension for
the encoded output.
\item \code{"multi_hot"}: Encodes each sample in the input into a single array
the same size as the vocabulary, containing a 1 for each vocabulary
term present in the sample. Treats the last dimension as the sample
dimension, if input shape is (..., sample_length), output shape will
be (..., num_tokens).
\item \code{"count"}: As \code{"multi_hot"}, but the int array contains a count of the
number of times the token at that index appeared in the sample.
\item \code{"tf_idf"}: As \code{"multi_hot"}, but the TF-IDF algorithm is applied to
find the value in each token slot.
For \code{"int"} output, any shape of input and output is supported. For all
other output modes, currently only output up to rank 2 is supported.
}}

\item{sparse}{Boolean. Only applicable when \code{output_mode} is \code{"multi_hot"},
\code{"count"}, or \code{"tf_idf"}. If \code{TRUE}, returns a \code{SparseTensor} instead of a
dense \code{Tensor}. Defaults to \code{FALSE}.}

\item{pad_to_max_tokens}{Only applicable when \code{output_mode} is \code{"multi_hot"},
\code{"count"}, or \code{"tf_idf"}. If TRUE, the output will have its feature axis
padded to \code{max_tokens} even if the number of unique tokens in the
vocabulary is less than max_tokens, resulting in a tensor of shape
\verb{[batch_size, max_tokens]} regardless of vocabulary size. Defaults to \code{FALSE}.}

\item{...}{standard layer arguments.}
}
\description{
A preprocessing layer which maps integer features to contiguous ranges.
}
\details{
This layer maps a set of arbitrary integer input tokens into indexed
integer output via a table-based vocabulary lookup. The layer's output indices
will be contiguously arranged up to the maximum vocab size, even if the input
tokens are non-continguous or unbounded. The layer supports multiple options
for encoding the output via \code{output_mode}, and has optional support for
out-of-vocabulary (OOV) tokens and masking.

The vocabulary for the layer can be supplied on construction or learned via
\code{adapt()}. During \code{adapt()}, the layer will analyze a data set, determine the
frequency of individual integer tokens, and create a vocabulary from them. If
the vocabulary is capped in size, the most frequent tokens will be used to
create the vocabulary and all others will be treated as OOV.

There are two possible output modes for the layer.
When \code{output_mode} is \code{"int"},
input integers are converted to their index in the vocabulary (an integer).
When \code{output_mode} is \code{"multi_hot"}, \code{"count"}, or \code{"tf_idf"}, input integers
are encoded into an array where each dimension corresponds to an element in
the vocabulary.

The vocabulary for the layer must be either supplied on construction or
learned via \code{adapt()}. During \code{adapt()}, the layer will analyze a data set,
determine the frequency of individual integer tokens, and create a vocabulary
from them. If the vocabulary is capped in size, the most frequent tokens will
be used to create the vocabulary and all others will be treated as OOV.
}
\seealso{
\itemize{
\item \code{\link[=adapt]{adapt()}}
\item \url{https://www.tensorflow.org/api_docs/python/tf/keras/layers/IntegerLookup}
\item \url{https://keras.io/api/layers/preprocessing_layers/categorical/integer_lookup}
}

Other categorical features preprocessing layers: 
\code{\link{layer_category_encoding}()},
\code{\link{layer_hashing}()},
\code{\link{layer_string_lookup}()}

Other preprocessing layers: 
\code{\link{layer_category_encoding}()},
\code{\link{layer_center_crop}()},
\code{\link{layer_discretization}()},
\code{\link{layer_hashing}()},
\code{\link{layer_normalization}()},
\code{\link{layer_random_brightness}()},
\code{\link{layer_random_contrast}()},
\code{\link{layer_random_crop}()},
\code{\link{layer_random_flip}()},
\code{\link{layer_random_height}()},
\code{\link{layer_random_rotation}()},
\code{\link{layer_random_translation}()},
\code{\link{layer_random_width}()},
\code{\link{layer_random_zoom}()},
\code{\link{layer_rescaling}()},
\code{\link{layer_resizing}()},
\code{\link{layer_string_lookup}()},
\code{\link{layer_text_vectorization}()}
}
\concept{categorical features preprocessing layers}
\concept{preprocessing layers}
