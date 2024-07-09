# Produce a random matrix where there are 6 groups in the columns and 6 groups in the rows？

# Define the size of each row group and size of each column group
nr1 <- 4
nr2 <- 8
nr3 <- 6
nr4 <- 5
nr5 <- 7
nr6 <- 9

nc1 <- 6
nc2 <- 8
nc3 <- 10
nc4 <- 7
nc5 <- 9
nc6 <- 5

nr = nr1 + nr2 + nr3 + nr4 + nr5 + nr6
nc = nc1 + nc2 + nc3 + nc4 + nc5 + nc6

# Generate the first column group
group1_col <- rbind(
  matrix(rnorm(nr1 * nc1, mean = 1, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc1, mean = 0, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc1, mean = 0.5, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc1, mean = -0.5, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc1, mean = 1, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc1, mean = -1, sd = 0.5), nrow = nr6)
)

# Generate the second column group
group2_col <- rbind(
  matrix(rnorm(nr1 * nc2, mean = 0, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc2, mean = 1, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc2, mean = -0.5, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc2, mean = 0.5, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc2, mean = 1.5, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc2, mean = -1.5, sd = 0.5), nrow = nr6)
)

# Generate the third column group
group3_col <- rbind(
  matrix(rnorm(nr1 * nc3, mean = 0.5, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc3, mean = 0.5, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc3, mean = 1, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc3, mean = -0.5, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc3, mean = 0, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc3, mean = 2, sd = 0.5), nrow = nr6)
)

# Generate the fourth column group
group4_col <- rbind(
  matrix(rnorm(nr1 * nc4, mean = 1, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc4, mean = 0, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc4, mean = 0.5, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc4, mean = -0.5, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc4, mean = 1.5, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc4, mean = -1, sd = 0.5), nrow = nr6)
)

# Generate the fifth column group
group5_col <- rbind(
  matrix(rnorm(nr1 * nc5, mean = -1, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc5, mean = 1, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc5, mean = 0.5, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc5, mean = 0, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc5, mean = 2, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc5, mean = -2, sd = 0.5), nrow = nr6)
)

# Generate the sixth column group
group6_col <- rbind(
  matrix(rnorm(nr1 * nc6, mean = 0, sd = 0.5), nrow = nr1),
  matrix(rnorm(nr2 * nc6, mean = -1, sd = 0.5), nrow = nr2),
  matrix(rnorm(nr3 * nc6, mean = 1.5, sd = 0.5), nrow = nr3),
  matrix(rnorm(nr4 * nc6, mean = -0.5, sd = 0.5), nrow = nr4),
  matrix(rnorm(nr5 * nc6, mean = 0.5, sd = 0.5), nrow = nr5),
  matrix(rnorm(nr6 * nc6, mean = 1, sd = 0.5), nrow = nr6)
)

# Combine all 6 column groups
mat <- cbind(group1_col, group2_col, group3_col, group4_col, group5_col, group6_col)

dim(mat) # 39 45

# Randomly shuffle rows and columns
mat_2 = mat[sample(x = nr, size = nr, replace = FALSE), sample(nc, nc, replace = FALSE)] 
rownames(mat_2) = paste0("row", seq_len(nr))
colnames(mat_2) = paste0("column", seq_len(nc))
