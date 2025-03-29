probe.keep.1 <- !(featureNames(norm.set) %in% anndata.450k$Name[anndata.450k$chr %in% c("chrX","chrY")])

probe.keep.2 <- !(featureNames(norm.set.filter) %in% xReactiveProbes$norm.set.filter)

uniq_sample_1 <- rownames(sample_1)[!(rownames(sample_1) %in% rownames(sample_2))]

library(dplyr)
gene_num <- filter(.data=ClassFreq, !Class%in%c('1000', '0101', '0001'))
