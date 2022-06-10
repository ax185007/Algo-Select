#import libraries


# Functions

# Identify patterns in Dataset
data_analysis <- function(data){
    p_name <- c("Univariate", "Multivariate", "Seasonality", "Trend", "Length")
    p <- c(0, 0, 0, 0, 0)

    result <- array(c(p_name, p), dim = c(2, 1, 1))

    df <- data
    # Perform analysis

    return(result)
}

# Select Algorithm
model_select <- function(param){
    methods <- c("SES", "HWES", "RNN", "FBP", "Theta")
    # Deterministic algorithm
    if (param["length"][1] < 100){
        return(methods[1])
    }else{
        return(methods[2])
    }
}

# BlackBox fucntion, wrapper for data analyzer and model selector
black_box <- function(data){
    params <- data_analysis(data)
    model <- model_select(params)
    return(model)
}