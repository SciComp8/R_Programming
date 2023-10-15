objective_fun = function(p) {20*log(p)+30*log(1-p)}
p_opt = optimize(objective_fun, interval = c(0, 1), maximum = TRUE)
p$maximum # Show the location of the maximum value of the objective function 
p$objective # Show the maximum value of the objective function at that point (p$maximum)
