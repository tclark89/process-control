#' d2 Function for SPC Charts
#'
#' The d2 function is used as a weighting variable used in R charts, generally
#' when the number of measurements in a run is 10 or less.
#'
#' @param n A numeric vector of length at least 1 and all values integers of 1 or larger
#'
#' @return A numeric vector
#' @export
#'
#' @examples
#' n <- c(2, 4, 3, 2)
#' d2(n)
d2 <- function (n){
  n[n == 1] <- 2

  fn <- quote(function(w){ptukey(w, n, Inf, lower.tail=FALSE)})

  vapply(
    n,
    function(n){
      stats::integrate(eval(fn), 0, Inf)[[1]]
    },
    numeric(1))
}
