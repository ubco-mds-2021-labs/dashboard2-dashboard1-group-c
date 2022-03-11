library(dash)
source("src/layout.R")
source("src/map.R")
source("src/models.R")
source("src/time_count.R")
source("src/total_capacity.R")

app <- dash_app()
app |> set_layout(
    h1("Hello, Dash!")
)

app |> set_layout(layout)

app$callback(
		output('ggplot_total_capacity', 'figure'),
		list(input('province', 'value')),
		function(prov) {
				return(plot_total_capacity(prov))
	})

app |> run_app()
