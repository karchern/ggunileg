library(ggplot2)
library(tidyverse)


# center <- function(x, type = c("mean", "median", "trimmed")) {
#   print(type)
#   type <- match.arg(type)
#   print(type)
#   switch(type,
#          mean = mean(x),
#          median = median(x),
#          trimmed = mean(x, trim = .1))
# }
# x <- runif(10)
# center(x, "t")

someData <- data.frame(x = 1:100 + runif(n = 100, min = -10, max = 10), y = 1:100 + runif(n = 100, min = -10, max = 10), label1 = sample(letters[1:10], size = 100, replace = T), label2 = sample(1:5, size = 100, replace = T)) %>%
    mutate(label2 = as.factor(label2))

scale_color_highres <- function(...) {
    my_manual_pal <- function (granularity, values = 1000) {
    force(values)
    function(n) {
        rep(1:granularity, length.out = values)
    }
}
    list(discrete_scale(
        "color",
        scale_name = "blaaa",
        palette = scales::hue_pal(),
        #labels = function(x) {print(x); x},
        ...),
    discrete_scale(
        "shape",
        scale_name = "blaaa",
        #palette = scales::manual_pal(1:20),
        palette = my_manual_pal(5),
        #labels = function(x) {print(x); x},
        
        ...))
}

plot <- ggplot(data = someData, aes(x = x, y = y, color = label1, shape = label1)) +
    geom_point() +
    scale_color_highres()
# discrete_scale("color", scale_name = "blaaa", name = 'test', palette = scales::hue_pal()) +
# discrete_scale("shape", scale_name = "blaaa", name = 'test', palette = scales::manual_pal(1:20))
ggsave(plot = plot, filename = "example_plot.pdf", width = 5, height = 7)
