
#' @title Binomial Random Variable
#' @description returns a list with named elements trials and probability of
#' success
#' @param trials number of trials
#' @param prob probability of success
#' @return binomial random variable object
#' @examples
#' bin_variable(trials = 10, prob = .4)
#' bin_variable(110, prob = .56)
#' @export
bin_variable <- function(trials, prob){
  if( check_prob(prob) & check_trials(trials)) {
    var <- list(trials = trials, prob = prob)
    class(var) <- "binvar"
    return(var)
  }
}

#' @export
print.binvar <- function(binvar) {
  heading <- ' "Binomial Variable" \n \n Parameters: \n '
  trials <- paste("- number of trials:", binvar$trials)
  success <- paste("- prob of success:", binvar$prob)
  cat(paste(heading, trials, success, sep = "\n"))
}

#' @export
summary.binvar <- function(binvar) {
  trials <- binvar$trials
  p <- binvar$prob
  var <- list(trials = trials, prob = p, mean = aux_mean(trials, p),
              variance = aux_variance(trials, p),
              mode = aux_mode(trials, p),
              skewness = aux_skewness(trials, p),
              kurtosis = aux_kurtosis(trials, p))
  class(var) <- "summary.binvar"
  return(var)
}

#' @export
print.summary.binvar <- function(sumbin) {
  cat(' "Summary Binomial" \n \n Parameters: \n ')
  cat("- number of trials:", sumbin$trials)
  cat("- prob of success:", sumbin$prob)
  cat("\n Measures")
  cat("\n - mean:", sumbin$mean, "\n - variance:", sumbin$variance,
      "\n - mode:", sumbin$mode, "\n - skewness:", sumbin$skewness,
      "\n - kurtosis:", sumbin$kurtosis)
}
