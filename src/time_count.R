source("src/data.R")


time_count <- function(prov = NULL) {
    data <- get_data()
    
    if (! is.null(prov))
        data <- data |> filter(`Province/Territory` == prov)
    
    data <- data |> count(`Commissioning date`)
    
    current_total <- 0
    counts <- c()
    years <- c()
    for (i in 1:nrow(data)) {
        year <- test[[i, 1]]
        n <- test[[i, 2]]
        
        years <- c(years, year)
        current_total <- current_total + n
        counts <- c(counts, current_total)
    }
    
    return(tibble(year = years, count = counts))
}