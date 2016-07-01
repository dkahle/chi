#' The Inverse Chi Distribution
#' 
#' Density, distribution function, quantile function and random 
#' generation for the inverse chi distribution. 
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
#' @seealso \code{\link{dchi}}
#' @name invchi
#' @examples
#' 
#' s <- seq(0, 2, .01)
#' plot(s, dinvchi(s, 7), type = 'l')
#' 
#' f <- function(x) dinvchi(x, 7)
#' q <- .5
#' integrate(f, 0, q)
#' (p <- pinvchi(q, 7))
#' qinvchi(p, 7) # = q
#' mean(rinvchi(1e5, 7) <= q)
#' 
#' 
#' samples <- rinvchi(1e5, 7)
#' plot(density(samples))
#' curve(f, add = TRUE, col = "red")
#' 
#' 
NULL




#' @rdname invchi
#' @export
dinvchi <- function(x, df, ncp = 0, log = FALSE) {
  log_f <- dchi(1/x, df, ncp, log = TRUE) - 2*log(x)
  if(log) return(log_f)
  exp(log_f)
}




#' @rdname invchi
#' @export
pinvchi <- function(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE) {
  pchi(1/q, df, ncp, !lower.tail, log.p)
}





#' @rdname invchi
#' @export
qinvchi <- function(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE) {
  qchi(1-p, df, ncp, lower.tail, log.p)^(-1)
}





#' @rdname invchi
#' @export
rinvchi <- function(n, df, ncp = 0) {
  1 / rchi(n, df, ncp)
}



