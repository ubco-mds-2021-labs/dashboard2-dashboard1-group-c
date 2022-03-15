### Our Implementation:

Our dashboard for wind turbines has in total of four plots including two bar graphs, one map and one line chart. The map will represent the different locations of the turbines present in different provinces. Total capacity bar graph will depict the total capacity of the wind turbines present in various provinces. Line chart is showing the total count of the wind turbines in various locations. Amd finally, the lower right bar graph is for different models of wind turbines in various provinces.

We have interactive widgets on the side bar. One is a drop down, which will let the user select the province about which he wants to fetch the information. Another is the slider to select the particular year. This will help user to know the timeline of how wind turbines were increased in particular province.

### Changes we did:

As a whole, we are able to replicate the exact application as we did in python. We have created the exact same side bar with total capacity bar graph, total count line graph and map for the locations of the turbines in various provinces. The only change that we did is in the pie chart. We have replaced the pie chart with the bar graph as ggplotly does'nt support polar coordinates due to which we were not able to make a pie chart. In place of that, the exact information has been shown using the bar graph.

### Future goals:

We are aiming in improving the styling of our dashboard. We will goal to make it more visually appealing. This will include more clear orientation along with better styling.
Some limitation of our dashboard is that we don't include variety of information since we mostly focus on the relationship of the location in Canada and Turbine. Another limitation is that we haven't integrate our plots nicely in the whole dashboard. We will need to do some position adjustment so that plots are aligned. In addition, we can add some clear and nice elements/icons in our dashboard to make it looks tidy and interesting.

### Experience of implementing dashboard in R: 

The overall experience was good as we were able to replicate the dashboard as was in python with certain modifications. But comparatively, R was quite difficult to work with because of the limitations it has with respect to dash. Also, there were not much documentation available to refer to as was the case with python. But, the overall experience was good and with the joint team efforts we were able to create the dashboard/ app in R as well.