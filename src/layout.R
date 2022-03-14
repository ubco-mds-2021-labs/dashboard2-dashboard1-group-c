library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(dashBootstrapComponents)
source("src/data.R")
source("src/total_capacity.R")
source("src/time_count.R")
source('src/map.R')
source('src/models.R')

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


row1 <- div(
    list(
        dbcRow(
            list(
                dbcCol(
                    list(
                        dbcRow(div("WIND TURBINES"), style = list("color" = "black", "textAlign" = "left",  "font-size" = 40, "margin-top" = 10)),
                        dbcRow(div(br(),
                                   br())),
                        dbcRow(div("This is a data visualization app that allows members of Natural Resources Canada planning committees to visually explore a dataset outlining existing windpower capacity in Canada.")),
                        dbcRow(div(br(),
                                   br())),
                        dbcRow(div("Controls"), style = list("color" = "black", "textAlign" = "left",  "font-size" = 30, "margin-top" = 10)),
                        dbcRow(div(br(),
                                   br())),
                        dbcRow(div("Select the province to get the information about wind turbines in that province. Also, slider lets you select the desired year so that cumulative count and geographic location of turbine can be seen for that year.")),
                        dbcRow(div(br(),
                                   br()))
                    )
                ,style = list("background-color" = "grey")),
                dbcCol(div(map)),
                dbcCol(div(total_capacity))
            )
        )
    )
)

row2 <- div(
    list(
        dbcRow(
            list(
                dbcCol(
                    list(
                        dbcRow(div(province)),
                        dbcRow(div(br(),
                                   br())),
                        dbcRow(div(year)),
                        dbcRow(div(br(),
                                   br()))
                    ),
                    style = list("background-color" = "grey")),
                dbcCol(div(line)),
                dbcCol(div(bar_plot))
            )
        )
    )
)
layout <- div(list(row1,row2))
    