#' Helper function for scale_color_highres
manual_shape_pal <- function(num_shape_levels, shape_values) {
    values <- 1000
    if (is.null(shape_values) && is.null(num_shape_levels)) {
        shape_values <- c(c(19, 17, 15, 1, 5, 2, 0), (1:25)[!(1:25) %in% c(19, 17, 15, 1, 5, 2, 0)])
        num_shape_levels <- 4 # Default to 4 shapes
    } else {
        if (!is.null(shape_values) && !is.null(num_shape_levels)) {
            print("Only one of num_shape_levels or shape_values can be specified, defaulting to shape_values' default.")
            shape_values <- NULL
        }
        if (is.null(shape_values)) {
            shape_values <- c(c(19, 17, 15, 1, 5, 2, 0), (1:25)[!(1:25) %in% c(19, 17, 15, 1, 5, 2, 0)])
        }
        if (is.null(num_shape_levels)) {
            num_shape_levels <- length(shape_values)
        }
    }
    function(n) {
        rep(shape_values[1:num_shape_levels], length.out = values)
    }
}

#' Conveniently show color- and shape scale with pretty legend
#'
#' This function is a convenience wrapper to allow concurrent color- and shape scaling
#' including a well-formatted legend that shows both color- and shape information for values
#' (an approach I often use to distinguish > 6 or so different groups).
#'
#' @param num_shape_levels number of distinct shapes to use
#' @param color_palette expects a color scale (such as those provided by scales::hue_pal() or function(x) RColorBrewer::brewer.pal(x, "Set1")),
#' @return NULL
#' @export
scale_color_highres <- function(num_shape_levels = NULL, shape_values = NULL, color_palette = scales::hue_pal(), ...) {
    list(
        discrete_scale(
            "color",
            scale_name = "discreteColor",
            palette = color_palette,
            ...
        ),
        discrete_scale(
            "shape",
            scale_name = "discreteShape",
            palette = manual_shape_pal(num_shape_levels, shape_values),
            ...
        )
    )
}
