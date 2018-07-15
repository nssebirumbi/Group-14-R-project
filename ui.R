library(shiny)
library(shinydashboard)
library(ggplot2)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "Mobile App Statistics"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home",icon = icon("home"),tabName = "home"
                 
        ),
        menuItem("Import dataset",icon = icon("table"),tabName = "dataset"
                 
        ),
        menuItem("Summary",tabName = "summary",icon = icon("list-alt")),
        menuItem("Visualization",tabName = "visualization",icon=icon("bar-chart-o")),
        menuItem("Help",tabName = "help",icon = icon("cog", lib = "glyphicon"))
      )
      
      
      
    ),  
    dashboardBody(
      tabItems(
        tabItem(tabName = "home"
                
        ),
        tabItem(tabName = "dataset"
                
        ),
        
        tabItem(tabName = "visualization"
                
        ),
        tabItem(tabName = "summary"
                
        ),
        tabItem(tabName = "help" 
                
        )
      )
      
      
    )
  )
  
)