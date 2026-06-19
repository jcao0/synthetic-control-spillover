#' Print method for scm_spillover objects
#'
#' @param x An object of class \code{scm_spillover}.
#' @param ... Further arguments passed to or from other methods (unused).
#' @return The input object \code{x}, invisibly.
#' @export
print.scm_spillover <- function(x, ...) {
  cat("\nSCM with Spillover Effects Results\n")
  cat("===================================\n")
  cat("Average spillover-adjusted effect:", round(mean(x$spillover_effects), 3), "\n")
  cat("Average standard SCM effect:", round(mean(x$vanilla_effects), 3), "\n")
  cat("Difference:", round(mean(x$spillover_effects - x$vanilla_effects), 3), "\n")
  cat("\nNumber of post-treatment periods:", length(x$spillover_effects), "\n")
  cat("Number of affected units:", ncol(x$data$A), "\n")
  invisible(x)
}

#' Summary method for scm_spillover objects
#'
#' @param object An object of class \code{scm_spillover}.
#' @param ... Further arguments passed to or from other methods (unused).
#' @return A data frame of per-period effects, invisibly.
#' @export
summary.scm_spillover <- function(object, ...) {
  cat("\nDetailed SCM Analysis Summary\n")
  cat("==============================\n\n")

  # Create a summary table
  results_df <- data.frame(
    Period = 1:length(object$spillover_effects),
    Spillover_Effect = round(object$spillover_effects, 3),
    Vanilla_Effect = round(object$vanilla_effects, 3),
    Difference = round(object$spillover_effects - object$vanilla_effects, 3),
    CI_Lower = round(object$ci_lower, 3),
    CI_Upper = round(object$ci_upper, 3)
  )

  print(results_df)

  cat("\n--- Statistical Summary ---\n")
  cat("Mean spillover effect:", round(mean(object$spillover_effects), 3), "\n")
  cat("Mean vanilla effect:", round(mean(object$vanilla_effects), 3), "\n")
  cat("SD of spillover effects:", round(sd(object$spillover_effects), 3), "\n")

  invisible(results_df)
}

#' Plot method for scm_spillover objects
#'
#' @param x An object of class \code{scm_spillover}.
#' @param type Character; \code{"effects"} (default) for the treatment-effect
#'   plot or \code{"all"} for the full set of diagnostic plots.
#' @param ... Further arguments passed to \code{\link{plot_effects}} or
#'   \code{\link{plot_all}}.
#' @return A \pkg{ggplot2} object (invisibly), as returned by the underlying
#'   plotting function.
#' @export
plot.scm_spillover <- function(x, type = "effects", ...) {
  if (type == "effects") {
    plot_effects(x, ...)
  } else if (type == "all") {
    plot_all(x, ...)
  }
}
