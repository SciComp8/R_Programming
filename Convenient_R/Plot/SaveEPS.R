library(ggplot2)
g <- ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point() + labs(title='MPG vs Weight')
postscript(file='mpg_weight.eps', paper='special', height=4, width=4, horizontal=F)
print(g)
dev.off() 

dir.fig <- "../report/figs_2021May01/"
fig.name <- c("ABC")
postscript(file=dir.fig %0% fig.name %0% '.eps', paper='special', height=4, width=4, horizontal=F, onefile=F)
print(out.i.SBE[[4]][['curve']])
dev.off() 
# EPS format is designed to store a single, self-contained graphic. 
# When onefile=T is specified (the default in some contexts), multiple graphs may be written to the same file, which violates the EPS specification and can cause the file to render incorrectly.
