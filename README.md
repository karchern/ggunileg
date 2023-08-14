# ggunileg


I often face the problem of wanting to visually distinguish data with dozens of distinct groups, in which case color scales
often become uninformative.

![This is a bad plot: There is too many colors](vignette/man/bad_plot.png)

One potential solution is to combine color- and shape scales, but this is not really helpful out of the
because the legends are not combined by default, so mapping invidiual points to their
color- and shape value by eye is cumbersome at best.


![This is a little better, but still bad since the legend is not merged](vignette/man/still_bad_plot.png)

To fix this I offer the scale_color_highres function as a convenience function.
The number of distinct shape levels can be controlled using the numShapeLevels parameter.
Note how the colorLabel variable is mapped to  both color and shape aesthetics here.

![This is good! :)](vignette/man/better_plot.png)


### Installation

To install, run `devtools::install_github('karchern/ggunileg')`. If you don't have `devtools` installed, run `install.packages('devtools')` first.
