mle <- function(y) {
  # Produce error for empty vectors
  if (length(y) == 0) {
    stop("y should be a non-zero vector")
  }

  return(sum(y) / length(y))
}
