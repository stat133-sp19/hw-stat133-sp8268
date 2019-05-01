
#Returns mean of binom dist with given trials and prob
aux_mean <- function(trials, prob) {
  return(trials*prob)
}

#Returns variance of binom dist with given trials and prob
aux_variance <- function(trials, prob) {
  return(trials*prob*(1-prob))
}

#Returns mode of binom dist with given trials and prob
aux_mode <- function(trials, prob) {
  m <- trials*prob + prob
  m_int <- as.integer(m)
  if( m == round(m) ) {
    return( c(m_int, m_int - 1) )
  } else {
    return( m_int)
  }
}

#Returns skewness of binom dist with given trials and prob
aux_skewness <- function(trials, prob) {
  return((1 - 2*prob) / sqrt(trials * prob * (1 - prob)))
}

#Returns kurtosis of binom dist with given trials and prob
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}
