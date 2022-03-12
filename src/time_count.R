library(plotly)
library(ggplot2)

source("src/data.R")


time_count <- function(prov = NULL) {
    data <- get_data()
    
    if (! is.null(prov))
        data <- data |> filter(`Province/Territory` == prov)
    
    data <- data |> count(`Commissioning date`)
    n <- nrow(data)
    
    # Get cumulative totals
    current_total <- 0
    counts <- c()
    years <- c()
    for (i in 1:n) {
        year <- data[[i, 1]]
        count <- data[[i, 2]]
        
        years <- c(years, year)
        current_total <- current_total + count
        counts <- c(counts, current_total)
    }
    
    #Add in missing years
    indices <- c()
    missing_years <- c()
    missing_counts <- c()
    for (i in 2:n) {
        diff <- years[i] - years[i - 1]
        if (diff > 1) {
            count <- counts[i - 1]
            for (j in 1:(diff - 1)) {
                missing_years <- c(missing_years, years[i - 1] + j)
                missing_counts <- c(missing_counts, counts[i - 1])
            }
        }
    }
    for (i in 1:length(missing_years)) {
        missing_year <- missing_years[i]
        missing_count <- missing_counts[i]
        index <- which(years == missing_year - 1)
        len <- length(years)
        years <- c(years[1:index], missing_year, years[index + 1:len])
        counts <- c(counts[1:index], missing_count, counts[index + 1:len])
    }
    years <- na.omit(years)
    counts <- na.omit(counts)
    data <- tibble(year = years, count = counts)
    
    # Create chart
    if (is.null(prov))
        title_string = "Cumulative Turbine Count over Time in Canada"
    else
        title_string = sprintf("Cumulative Turbine Count over Time in %s", prov)
    plot <- ggplot(data) + 
        aes(
            x = year,
            y = count
        ) +
        geom_line(color = "blue") +
        geom_point(color = "blue", size = 1) +
        ggtitle(title_string)
    
    return(ggplotly(plot))
}
