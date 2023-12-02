# Obtain all environmental variables in R
Sys.getenv()

# Obtain an environmental variable
Sys.getenv('USER')

# Set a new environmental variable
Sys.setenv(Analysis_ID = "129089anc")
Sys.getenv('Analysis_ID')
# [1] "129089anc"

# Delete the environmental variable
Sys.unsetenv('Analysis_ID')
Sys.getenv('Analysis_ID')
# [1] ""
