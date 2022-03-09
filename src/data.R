library(tidyverse)
library(here)
library(readxl)

get_raw_data <- function() {
    data_file <- file.path(here(), "data", "WindTurbineDatabase.xlsx")
    data <- read_excel(data_file)
    
    return(data)
}




