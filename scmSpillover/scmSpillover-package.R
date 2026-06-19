#' @keywords internal
#' @importFrom stats quantile rnorm sd
#' @importFrom ggplot2 aes annotate geom_hline geom_line geom_point
#'   geom_ribbon geom_vline ggplot ggsave labs scale_color_manual theme
#'   theme_minimal
"_PACKAGE"

# Column names used for non-standard evaluation inside ggplot2 aes() mappings.
# Registering them keeps R CMD check from flagging "no visible binding for
# global variable".
utils::globalVariables(c(
  "Period", "Effect", "Method", "Lower", "Upper", "Value", "Type"
))
