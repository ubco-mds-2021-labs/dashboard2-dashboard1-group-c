library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)
library(dashBootstrapComponents)
source("src/data.R")


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

layout <- dbcContainer(
    dbcRow(
        list(
            province,
            year,
            map
        )
    ), style = list('max-width' = '50%')
)
