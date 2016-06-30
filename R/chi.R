#' The Chi Distribution
#' 
#' Density, distribution function, quantile function and random 
#' generation for the chi distribution.
#' 
#' The functions (d/p/q/r)chi simply wrap those of the standard 
#' (d/p/q/r)chisq R implementation, so look at, say, 
#' \code{\link{dchisq}} for details.
#' 
#' 
#' @param x,q vector of quantiles.
#' @param p vector of probabilities.
#' @param n number of observations. If length(n) > 1, the length is 
#'   taken to be the number required.
#' @param df degrees of freedom (non-negative, but can be
#'   non-integer).
#' @param ncp non-centrality parameter (non-negative).
#' @param log,log.p logical; if TRUE, probabilities p are given as 
#'   log(p).
#' @param lower.tail logical; if TRUE (default), probabilities are 
#'   P[X <= x] otherwise, P[X > x].
#' @seealso \code{\link{dchisq}}; these functions just wrap the 
#'   (d/p/q/r)chisq functions.
#' @name chi
#' @importFrom stats dchisq pchisq qchisq rchisq
#' @examples
#' 
#' s <- seq(0, 5, .01)
#' plot(s, dchi(s, 7), type = 'l')
#' 
#' f <- function(x) dchi(x, 7)
#' q <- 2
#' integrate(f, 0, q)
#' (p <- pchi(q, 7))
#' qchi(p, 7) # = q
#' mean(rchi(1e5, 7) <= q)
#' 
#' 
#' samples <- rchi(1e5, 7)
#' plot(density(samples))
#' curve(f, add = TRUE, col = "red")
#' 
#' 
NULL




#' @rdname chi
#' @export
dchi <- function(x, df, ncp = 0, log = FALSE) {
  log_f <- dchisq(x^2, df, ncp, log = TRUE) + log(2) + log(x)
  if(log) return(log_f)
  exp(log_f)
}




#' @rdname chi
#' @export
pchi <- function(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE) {
  pchisq(q^2, df, ncp, lower.tail, log.p)
}





#' @rdname chi
#' @export
qchi <- function(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE) {
  sqrt( qchisq(p, df, ncp, lower.tail, log.p) )
}





#' @rdname chi
#' @export
rchi <- function(n, df, ncp = 0) {
  sqrt( rchisq(n, df, ncp) )
}



