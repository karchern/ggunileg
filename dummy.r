library(ggplot2)
library(tidyverse)

someData <- data.frame(x = 1:100 + runif(n = 100, min = -10, max = 10), y = 1:100 + runif(n = 100, min = -10, max = 10), label1 = sample(letters[1:10], size = 100, replace = T), label2 = sample(1:5, size = 100, replace = T)) %>%
    mutate(label2 = as.factor(label2))

manual_shape_pal <- function(numShapeLevels) {
    values <- 1000
    function(n) {
        rep(1:numShapeLevels, length.out = values)
    }
}


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



plot <- ggplot(data = someData, aes(x = x, y = y, color = label1, shape = label1)) +
    geom_point() +
    scale_color_highres(numShapeLevels = 2) +
    # Custom color palette can be added like so
    #scale_color_highres(numShapeLevels = 2, colorPalette = function(x) RColorBrewer::brewer.pal(x, "Set1")) +
    theme_classic()
ggsave(plot = plot, filename = "tmp/example_plot.pdf", width = 5, height = 5)
