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
    output('ggplot_map', 'figure'),
    list(input('province', 'value'),
         input('year', 'value')),
    function(prov, year) {
        return(plot_province(prov, year))
})

app |> run_app()

