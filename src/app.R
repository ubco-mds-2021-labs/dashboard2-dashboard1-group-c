library(dash)
source("src/layout.R")

app <- dash_app()
app |> set_layout(
    h1("Hello, Dash!")
)

app |> set_layout(layout)

app |> run_app()