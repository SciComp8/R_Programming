data <- replicate(200, {
  var(rnorm(80, mean = 10, sd = 6)) })

ggplot() +
  geom_density(aes(x = data,  color = "blue")) +
  stat_function(fun = dnorm, 
                args = list(mean = mean(data),
                            sd = sd(data)),
                aes(color = "black")) +
  scale_color_identity(name = '',
                       breaks = c('blue', 'black'),
                       labels = c("Sampling Distribution", "Normal Density"), # Label the legend key names
                       guide = 'legend') +
  theme_bw() +
  labs(x = "Sample variance", y = "Density", title = "Sampling Distribution Density")
