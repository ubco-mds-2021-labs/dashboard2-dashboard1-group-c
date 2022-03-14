library(dash)
source("src/layout.R")
source("src/map.R")
source("src/models.R")
source("src/time_count.R")
source("src/total_capacity.R")

app <- Dash$new(external_stylesheets = dbcThemes$BOOTSTRAP)

app |> set_layout(layout)

# Capacity bar chart callback
app$callback(
		output('ggplot_total_capacity', 'figure'),
		list(
        input('province', 'value')
    ),
		function(prov) {
				return(plot_total_capacity(prov))
	  }
)

# Map callback
app$callback(
    output('ggplot_map', 'figure'),
    list(
        input('province', 'value'),
        input('year', 'value')
    ),
    function(prov, year) {
        return(plot_province(prov, year))
    }
)

# Count line chart callback
app$callback(
    output("count-graph", "figure"),
    list(
        input("province", "value")
    ),
    function(prov) {
        return(time_count(prov))
    }
)

# Count Model Pie Chart Callback
# app$callback(
#   output("ggplot_model_count", "figure"),
#   list(
#     input("province", "value")
#   ),
#   function(prov) {
#     return(plot_model(prov))
#   }
# )
# app$run_server(debug = T)
app |> run_app()
