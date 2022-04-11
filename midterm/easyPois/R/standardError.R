standardError <- function(y, SEType = "basic", B = 10) {
  if (SEType == "basic") {

    SE <- sqrt(mle(y) / length(y))

  } else if (SEType == "bootstrap") {

    samples <- replicate(B, sample(y, length(y), TRUE))
    MLE <- apply(samples, 2, mle)
    SE <- sd(MLE)

  }

  return(SE)

}
