#' Helper function for scale_color_highres
manual_shape_pal <- function(numShapeLevels) {
    values <- 1000
    function(n) {
        rep(1:numShapeLevels, length.out = values)
    }
}

#' Conveniently show color- and shape scale with pretty legend
#'
#' This function is a convenience wrapper to allow concurrent color- and shape scaling
#' including a well-formatted legend that shows both color- and shape information for values
#' (an approach I often use to distinguish > 6 or so different groups).
#'
#' @param numShapeLevels number of distinct shapes to use
#' @param colorPalette expects a color scale (such as those provided by scales::hue_pal() or function(x) RColorBrewer::brewer.pal(x, "Set1")),
#' @return NULL
#' @export
scale_color_highres <- function(numShapeLevels, colorPalette = scales::hue_pal(), ...) {
    list(discrete_scale(
        "color",
        scale_name = "discreteColor",
        palette = colorPalette,
        ...),
    discrete_scale(
        "shape",
        scale_name = "discreteShape",
        palette = manual_shape_pal(numShapeLevels),
        ...))
}