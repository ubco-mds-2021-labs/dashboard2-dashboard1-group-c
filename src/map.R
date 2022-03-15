source("src/data.R")
library(sf)
library(tidyverse) 
library(plotly)

wind <- get_data()



plot_province <- function(prov, year){
    path <- file.path(here(), "data", "georef-canada-province.geojson")
    sf_gb <- st_read(path, quiet = TRUE)
    if (is.null(prov)) {
        region <- sf_gb
        wind_province <- wind %>% filter(`Commissioning date`<= year)
    }
    else{
        region <- sf_gb %>% filter(prov_name_en == prov) #%>% st_geometry()
        wind_province <- wind %>% filter(`Province/Territory`==prov & `Commissioning date`<= year)
    }
    
    base <- ggplot(st_geometry(region)) + geom_sf()
    pts <- geom_point(data = wind_province, aes(x = Longitude, y = Latitude), colour = "red", alpha = 0.3)
    
    return(ggplotly(base + pts))
}

plot_map <- plot_province(prov = NULL, year= 1990)
map <- dccGraph(id='ggplot_map',figure=plot_map)

