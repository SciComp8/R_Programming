library(recipes)  

preprocessor <- recipe(osteoporosis ~ ., data = raw_data) |>  
  step_impute_median(all_numeric_predictors()) |>  
  step_dummy(all_nominal_predictors()) |>  
  prep()

processed_training <- bake(preprocessor, new_data = NULL) # give us the preprocessed training data
