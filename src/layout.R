library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(dashBootstrapComponents)
source("src/data.R")
source("src/total_capacity.R")

#Dropdown for province
province <- dbcRow(
    list(
        htmlLabel('Select Province'),
        dccDropdown(
            id = "province",
            options = list(list(label = "Alberta", value = "Alberta"),
                           list(label = "British Columbia", value = "British Columbia"),
                           list(label ="Manitoba", value= "Manitoba"),
                           list(label ="New Brunswick", value= "New Brunswick"),
                           list(label ="Newfoundland and Labrador", value= "Newfoundland and Labrador"),
                           list(label ="Northwest Territories", value= "Northwest Territories"),
                           list(label ="Nova Scotia", value= "Nova Scotia"),
                           list(label ="Ontario", value= "Ontario"),
                           list(label ="Prince Edward Island", value= "Prince Edward Island"),
                           list(label ="Quebec", value= "Quebec"),
                           list(label ="Saskatchewan", value= "Saskatchewan"),
                           list(label ="Yukon", value= "Yukon")),
            value = NULL
        )
    )
)

#Slider for year
year <- dbcRow(
    list(
        htmlLabel('Select Year'),
        dccSlider(
            id="year",
            min=1990,
            max=2021,
            step = 0.5,
            value=1990
        )
    )
)



sidebar <- div(
    dbcRow(
        list(
            dbcRow(
                div("WIND TURBINES"), 
                style = list("color" = "black", "textAlign" = "center",  "font-size" = 40, "margin-top" = 10), 
                
            ),
            dbcRow(
                div(province)
                
            ),
            dbcRow(
                div(year),
                br(),
                br(),
                br(),
                br(),
                
            )
        ),
        style = list("background-color" = "grey", "height" = 70)
    )
)


row1 <- div(
    style = list(
        borderBottom = "thin lightgrey solid",
        backgroundColor = "grey"
        
    ),
    dbcRow(
        list(
            dbcCol(
                div(
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    map,
                    style = list(width = "80%", padding = "10px 5px", backgroundColor = "grey") 
                ),
                md = 6
            ),
            dbcCol(
                div(
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    total_capacity,
                    style = list(width = "80%", padding = "10px 5px", backgroundColor = "grey") 
                ),
                md = 6
            )
        )
        
    )
)


row2 <- div(
    style = list(
        borderBottom = "thin lightgrey solid",
        backgroundColor = "grey"
        
    ),
    dbcRow(
        list(
            dbcCol(
                div(
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    br(),
                    dccGraph(id = "count-graph", figure = time_count(NULL)),
                    style = list(width = "80%", padding = "10px 5px", backgroundColor = "grey") 
                ),
                md = 6
            )
            
        )
        
    )
)

layout <- div(list(sidebar, row1, row2))
    