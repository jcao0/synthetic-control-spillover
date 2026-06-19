#' Per-Capita Cigarette Consumption by U.S. State, 1970-2000
#'
#' Annual per-capita cigarette sales (in packs) for 39 U.S. states from 1970
#' to 2000. The first column, \code{CA}, is California -- the treated unit in
#' the Proposition 99 tobacco-control program, a large excise-tax increase that
#' took effect in 1989. The remaining 38 columns are control (donor) states.
#' This is the running example used in the synthetic control literature.
#'
#' @format A numeric matrix with 31 rows (years 1970-2000) and 39 columns
#'   (U.S. states). Row names are the years; column names are two-letter state
#'   abbreviations, with \code{CA} (California) first.
#' @source Orzechowski and Walker, \emph{The Tax Burden on Tobacco}, as used by
#'   Abadie, Diamond and Hainmueller (2010) "Synthetic Control Methods for
#'   Comparative Case Studies".
#' @examples
#' data(california_cigarette)
#' dim(california_cigarette)
#' california_cigarette[1:5, 1:4]
"california_cigarette"
