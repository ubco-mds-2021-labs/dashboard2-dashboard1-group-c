library(dash)
library(dashBootstrapComponents)

row1 <- div(
    
)

row2 <- div(
    h1("Hello")
)

layout <- div(
    list(
        dbcRow(row1),
        dbcRow(row2)
    )
)