source("src/data.R")
library(tidyverse) 
library(plotly)
library(ggplot2)

wind <- get_data()

plot_model <- function(prov){
  if(is.null(prov)){
    prov="Alberta"
  }
  data <- wind[wind$'Province/Territory' == prov,]
  model_province <- data %>%
    group_by(Model) %>%
    summarise(count= n())
  plot <- ggplot(model_province,aes(x = '',y=count, fill= Model)) + 
                   geom_bar(stat="identity", width=1) +
                   coord_polar("y", start=0) +
                   theme_void() 
                   
  
  return(ggplotly(plot))
}

model_viz <- plot_model(prov = NULL)
model_province <- dccGraph(id='ggplot_model_count',figure =model_viz)

  
