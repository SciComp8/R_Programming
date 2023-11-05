# Perform a one-sample, two-sample, or a Welch modified two-sample t-test. The function output is identical to t.test.

tsum.test(
  mean.x,
  s.x = NULL,
  n.x = NULL,
  mean.y = NULL,
  s.y = NULL,
  n.y = NULL,
  alternative = "two.sided",
  mu = 0,
  var.equal = FALSE,
  conf.level = 0.95
)


library(BSDA)
x <- c(7.1, 7.3, 6.9, 7.5, 7.2, 7.8, 6.5, 7.0, 7.4)
y <- c(5.5, 6.0, 5.7, 5.8, 6.1, 5.9, 5.6)
tsum.test(mean(x), s.x=sd(x), n.x=length(x),
          mean(y), s.y=sd(y), n.y=length(y),
          mu=5)
