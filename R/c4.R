# C4 Function
# used for S charts (when n>10)
c4 <- function(n) {

  sqrt(2/(n-1)) * (factorial(n/2-1) / factorial((n-1)/2-1))


  }
