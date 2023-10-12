NULL %>%
  ggplot(aes(x = seq(0.001, 0.999, 0.001),
             y = sapply(seq(0.001, 0.999, 0.001), likely, n = 100, obs = 30))) +
  geom_point(col = "pink") +
  geom_line() +
  theme_minimal() + 
  labs(x = "Mean",
       y = "Likelihood",
       title = "Likelihood Function with n = 100, y = 30")
