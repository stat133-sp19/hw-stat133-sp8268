

#' @title Choose
#' @description Computes the number of combinations possible with given number of successes in
#' given number of trials
#' @param n number of trials, must be non negative int
#' @param k number of successes, must be non negative int less than num trials
#' @return computed number of combinations
#' @examples
#' bin_choose(5, 2)
#' bin_choose(n = 5, k = 0)
#' bin_choose(n = 5, k = 1:3)
#' @export
bin_choose <- function(n, k) {
  if( any(k > n) ) {
    stop("k cannot be greater than n")
  } else {
    return(factorial(n) / (factorial(k) * factorial(n - k)))
  }
}

#' @title Binomial Probability
#' @description Computes the probability of obtaining given number of successesin given
#' trials with probability of success prob
#' @param successs number of successes, must be non negative int less than num trials
#' @param trials number of trials, must be non negative int
#' @param prob probability of success, must be numeric between 0 and 1
#' @return computed probability
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(0:2, 5, 0.5)
#' @export
bin_probability <- function(success, trials, prob) {
  if( check_trials(trials) & check_prob(prob) & check_success(success, trials) ) {
    return(bin_choose(trials, success) * prob^(success) * (1 - prob)^(trials - success))
  }
}

#' @title Binomial Distribution
#' @description creates dataframe with probability distribution for binomial with given
#' number of trials and prob of success
#' @param trials number of trials, must be non negative int
#' @param prob probability of success, must be numeric between 0 and 1
#'@return dataframe with successes in the first column and associated probabality
#'in the second column
#'@examples
#' bin_distribution(19, .25)
#' bin_distribution(trials = 100, prob = .5)
#'@export
bin_distribution <- function(trials, prob) {
  trials_vec <- 0:trials
  dist <- data.frame(success = trials_vec,
                     probability = bin_probability(trials_vec, trials, prob))
  class(dist) <- c("bindis", "data.frame")
  return(dist)
}

#' @export
plot.bindis <- function(bindis) {
  barplot(height = bindis$probability, names.arg = bindis$success,
          xlab = "Number of Succeses", ylab = "Probability", space = .2)
}

#' @title Binomial Cumulative Density Function
#' @description creates dataframe with both the probability distribution and
#' the cumulative probability distribution for binomial with given number of
#' trials and prob of success
#' @param trials number of trials, must be non negative int
#' @param prob probability of success, must be numeric between 0 and 1
#'@return dataframe with successes in the first column, probabality in the
#'second column, and cumulative probabilty in the third
#'@examples
#' bin_cumulative(19, .25)
#' bin_cumulative(trials = 100, prob = .5)
#'@export
bin_cumulative <- function(trials, prob) {
  trials_vec <- 0:trials
  cum_probs <- c()
  for(i in trials_vec) {
    cum_probs <- c(cum_probs, sum(bin_probability(0:i, trials, .5)))
  }
  dist <- data.frame(success = trials_vec,
                     probability = bin_probability(trials_vec, trials, prob),
                     cumulative = cum_probs)
  class(dist) <- c("bincum", "data.frame")
  return(dist)
}

#' @export
plot.bincum <- function(bincum) {
  plot(bincum$success, bincum$cumulative,
       xlab = "Number of Succeses", ylab = "Cumulative Probability")
  lines(bincum$success, bincum$cumulative)
}

