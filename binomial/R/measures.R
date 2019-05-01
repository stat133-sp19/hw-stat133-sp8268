
#' @title Binomial Mean
#' @description Returns mean of binom dist with given trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return mean
#' @examples
#' bin_mean(trials = 10, prob = .4)
#' bin_mean(110, prob = .56)
#' @export
bin_mean <- function(trials, prob) {
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description Returns variance of binom dist with given trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return variance
#' @examples
#' bin_variance(trials = 10, prob = .4)
#' bin_variance(110, prob = .56)
#' @export
bin_variance <- function(trials, prob) {
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description Returns mode of binom dist with given trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return variance
#' @examples
#' bin_variance(trials = 10, prob = .4)
#' bin_variance(110, prob = .56)
#' @export
bin_mode <- function(trials, prob) {
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description Returns skewness of binom dist with given trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return skewness
#' @examples
#' bin_skewness(trials = 10, prob = .4)
#' bin_skewness(110, prob = .56)
#' @export
bin_skewness <- function(trials, prob) {
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description Returns kurtosis of binom dist with given trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return Kurtosis
#' @examples
#' bin_kurtosis(trials = 10, prob = .4)
#' bin_kurtosis(110, prob = .56)
#' @export
bin_kurtosis <- function(trials, prob) {
  return(aux_kurtosis(trials, prob))
}
