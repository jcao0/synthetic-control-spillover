
#' Generate simulated data for testing
#'
#' @param n_units Number of units
#' @param n_periods Number of time periods
#' @param treatment_start When treatment begins
#' @param effect_size Size of treatment effect
#' @return A numeric matrix with dimensions (n_periods x n_units).
#'   The first column represents the treated unit, remaining columns are
#'   control units. Rows represent time periods.
#' @examples
#' # Generate test data with default parameters
#' data <- generate_test_data()
#' dim(data)  # 30 periods x 20 units
#'
#' # Generate smaller dataset
#' data <- generate_test_data(n_units = 10, n_periods = 20,
#'                            treatment_start = 15, effect_size = -3)
#' @export
generate_test_data <- function(n_units = 20,
                               n_periods = 30,
                               treatment_start = 20,
                               effect_size = -5) {

  # Generate Basic Data
  data <- matrix(rnorm(n_units * n_periods, 100, 10),
                 nrow = n_periods,
                 ncol = n_units)

  # Add time trends
  for (t in 1:n_periods) {
    data[t, ] <- data[t, ] - t * 0.5
  }

  # Add treatment effect
  if (treatment_start <= n_periods) {
    data[treatment_start:n_periods, 1] <-
      data[treatment_start:n_periods, 1] + effect_size
  }

  return(data)
}

