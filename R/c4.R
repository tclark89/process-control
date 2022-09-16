#' c4 Function
#'
#' The c4 function is part of the Upper and Lower Critical Limit calculations
#' in S charts. S charts are generally used when the number of samples in a group
#' is >10, but the function is valid for all numeric inputs  greater than 1.
#' The input "n" should be the count of measurements in each run. The output
#' of c4() is a weighting value applied to the sample Standard Deviation.
#'
#' @param n A numeric vector with 1 or more elements all greater than 1.
#'
#' @return A numeric vector
#' @export
#'
#' @examples
#' n <- c(10, 8, 6, 4)
#' c4(n)
c4 <- function(n) {

  sqrt(2/(n-1)) * (factorial(n/2-1) / factorial((n-1)/2-1))


  }
