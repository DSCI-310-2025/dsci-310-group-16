#' Split data into train/test sets
split_data <- function(data, prop = 0.75) {
  set.seed(2024)
  split <- initial_split(data, prop = prop)
  list(
    train = training(split),
    test = testing(split)
  )
}

#' Train a linear model
train_lm_model <- function(train_data, formula) {
  lm(formula, data = train_data)
}