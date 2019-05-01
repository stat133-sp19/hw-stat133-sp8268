
#Checks if p is a valid probability ie contained on [0,1]
check_prob <- function(p) {
  if(length(p) == 1 & p >= 0 & p <=1 ) T else stop("invalid probability value")
}

#Checks if input is a valid number of trials ie non negative int
check_trials <- function(trials) {
  if(trials == round(trials) & trials >= 0) T else stop("invalid trials value")
}

#Checks if input is a valid number of successes ie integer between 0 and num trials
check_success <- function(success, trials) {
  if(all(round(success) == success & success >= 0 & success <= trials)) {
      TRUE
    } else if (any(success <= 0) | any(round(success) != success)) {
      stop("invalid success value")
    } else if(any(success > trials) ) {
      stop("success cannot be greater than trials")
    }
}





