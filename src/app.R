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

app |> run_app()
