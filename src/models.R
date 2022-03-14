source("src/data.R")
library(tidyverse) 
library(plotly)
library(ggplot2)

wind <- get_data()

plot_model <- function(prov){
    if(is.null(prov)){
        data <- wind
    }
    else{
        data <- wind %>% filter(`Province/Territory` == prov)
    }
  model_province <- data %>%
    group_by(Model) %>%
    summarise(count= n())
  plot2 <- ggplot(model_province,aes(x = Model,y=count, fill=Model)) + 
                   geom_bar(stat="identity") + 
      theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
                   
  
  return(ggplotly(plot2))
}

model_viz <- plot_model(prov = NULL)
bar_plot<- dccGraph(id='ggplot_bar',figure = plot_model(prov = NULL))

  
