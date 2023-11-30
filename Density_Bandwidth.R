library(ggplot2)
ggplot(data = mtcars, mapping = aes(x = mpg)) + 
  # geom_density() + 
  stat_density(geom = "line", adjust = 3)
