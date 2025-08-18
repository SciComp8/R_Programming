# Estimate the mean of target_var in each combinatin of group_1, group_2, group_3
# If target_var is binary (0, 1), such mean will be the proportion of being 1 in each combinatin of group_1, group_2, group_3
with(data, tapply(X=target_var, INDEX=list(group_1, group_2, group_3), FUN=mean)) |>
  ftable() |>
  round(2)

## ---- numerical summaries (original scale) --------------------------------
n  <- length(x)
rng <- range(x)
q   <- quantile(x, probs = c(0, .25, .5, .75, 1))
mean_x <- mean(x)
sd_x   <- sd(x)
cv_x   <- sd_x / mean_x
iqr_x  <- IQR(x)
mad_x  <- mad(x, constant = 1.4826)  # unscaled MAD; multiply by 1.4826 for normal equiv
# Compute the median absolute deviation, i.e., the (lo-/hi-) median of the absolute deviations from the median, and (by default) adjust by a factor for asymptotically normal consistency.
tmean  <- mean(x, trim = 0.10)     # 10% trimmed mean
# trim: the fraction (0 to 0.5) of observations to be trimmed from each end of x before the mean is computed. Values of trim outside that range are taken as the nearest endpoint.

## shape: skewness & kurtosis (requires e1071)
if (!requireNamespace("e1071", quietly = TRUE)) install.packages("e1071")
library(e1071)
skew_x <- skewness(x, type = 2)      
kurt_x <- kurtosis(x, type = 2)      
# type: an integer between 1 and 3 selecting one of the algorithms for computing skewness detailed below.

num_summary <- data.frame(
  n = n,
  min = rng[1], Q1 = q[2], median = q[3], Q3 = q[4], max = rng[2],
  mean = mean_x, sd = sd_x, IQR = iqr_x, MAD = mad_x,
  CV = cv_x, trimmed_mean_10pct = tmean,
  skewness = skew_x, kurtosis = kurt_x
)

num_summary[] <- lapply(num_summary, function(v)
  if (is.numeric(v)) as.numeric(formatC(v, format = "f", digits = 3)) else v
)
# Remember: lapply() applies the given function to each column of num_summary, and returns a list by default.
# The [] ensures that the assignment keeps the data frame structure.
num_summary

## ---- graphical summaries (original scale) --------------------------------
op <- par(mfrow = c(2, 3), mar = c(4, 4, 2, 1))
# mfrow = c(2, 3) → splits the plotting area into 2 rows and 3 columns (6 plots total, filled row by row).
# mar = c(4, 4, 2, 1) → sets the plot margins (bottom = 4, left = 4, top = 2, right = 1 lines of text).
# explain each parameter in the code in one line, respectively

# 1) Histogram with FD bins + density
hist(x, breaks = nclass.FD(x, digits = 5), main = "Histogram (orig)",
     xlab = "x", probability = TRUE, border = "grey50")
# The default for breaks is "Sturges": see nclass.Sturges. Other names for which algorithms are supplied are "Scott" and "FD" / "Freedman-Diaconis" (with corresponding functions nclass.scott and nclass.FD). Case is ignored and partial matching is used. Alternatively, a function can be supplied which will compute the intended number of breaks or the actual breakpoints as a function of x.
# nclass.Sturges(x) | nclass.scott(x) | nclass.FD(x, digits = 5)
lines(density(x, adjust = 1), lwd = 2); rug(x, side = 1)
# rug: rug(x) → adds small tick marks along the x-axis at each data value for reference.
# side: On which side of the plot box the rug will be plotted. Normally 1 (bottom) or 3 (top).

# 2) Boxplot
boxplot(x, horizontal = TRUE, main = "Boxplot (orig)", xlab = "x"); rug(x, side = 1)

# 3) Stripchart (jittered)
stripchart(x, method = "jitter", pch = 19, main = "Stripchart (orig)",
           xlab = "x")
# pch = 19 → uses solid circle symbols to draw the points.

# 4) ECDF
plot(ecdf(x), main = "ECDF (orig)", xlab = "x", ylab = "F(x)"); rug(x)
# ecdf: Empirical Cumulative Distribution Function
# cumulative distribution function: what's the probability that the random variable X is less than or equal to x? 

# 5) Normal Q–Q
qqnorm(x, main = "Q–Q normal (orig)"); qqline(x, col = "red")

# 6) Log10 Q–Q for a peek at transform effect
qqnorm(log10(x), main = "Q–Q normal (log10)"); qqline(log10(x), col = "red")

par(op)
# Default state (single plot) – one histogram is shown.
# After changing layout (like par(mfrow=c(2,2))) – the plotting window is split into a 2×2 grid, so multiple plots appear in one figure.
# After restoring with par(op) – the layout goes back to the default single-plot state. 
                        
