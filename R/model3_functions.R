# splitting data
split_data <- function(data,prop = 0.75, strata = 'cnt'){
    set.seed(2024)
    split <- initial_split(data, prop = 0.75,strata = 
    all_of(strata))
    list(train = training(split), test = testing(split))
}

#fitting linear best model
fit_best_model <- function(train_data) {
    lm(log(cnt) ~ season+ temp + weathersit, 
    data = train_data)
}
