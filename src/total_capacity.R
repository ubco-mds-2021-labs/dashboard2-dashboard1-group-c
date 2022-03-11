source("src/data.R")
library(tidyverse) 
library(plotly)
library(ggplot2)

wind <- get_data()

plot_total_capacity <- function(prov){
	province <- wind %>%
							group_by(`Province/Territory`) %>%
							summarise(Turbine_rate=sum(`Turbine rated capacity (kW)`))
	if(is.null(prov)){
		prov="Alberta"
	}
	
	plot <- ggplot(province, aes(x = reorder(`Province/Territory`,Turbine_rate), 
														 y = Turbine_rate, fill=ifelse(`Province/Territory`==prov, 'red', 'black'))) +
														 geom_bar(stat = "identity")+coord_flip() +
														 theme(legend.position="none") +
		                         labs(title = "Total Wind Capacity by Province")+
		                         labs(x = "Province", y="Total Capacity (MW)")
	
	return(ggplotly(plot))
}

total_capacity_viz <- plot_total_capacity(prov = NULL)
total_capacity <- dccGraph(id='ggplot_total_capacity',figure =total_capacity_viz)
