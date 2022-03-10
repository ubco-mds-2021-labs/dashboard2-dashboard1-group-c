library(tidyverse)
library(here)
library(readxl)

get_raw_data <- function() {
    data_file <- file.path(here(), "data", "WindTurbineDatabase.xlsx")
    data <- read_excel(data_file)
    
    return(data)
}

get_data <- function() {
    data <- get_raw_data()
    
    # Keep only the first year when multiple are given for "Comissioning date"
    # and convert from string to integer
    data <- data |> 
        separate(
            `Commissioning date`, 
            "Commissioning date", 
            extra = "drop"
        ) |> 
        mutate(`Commissioning date` = as.integer(`Commissioning date`)) 
    
    return(data)
}
