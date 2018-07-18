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
        
        tabItem(tabName = "visualization",
                
                fluidRow(
                  
                  tabsetPanel(type="tab",
                              tabPanel("Distributions",
                                       fluidRow(
                                         plotOutput("hist")
                                         
                                         
                                       ),
                                       fluidRow(
                                         
                                         box(title = "controls for the Graph",status = "primary",solidHeader = T,
                                             sliderInput("bins","Number of Breaks",1,100,50)
                                         ),
                                         box(title = "App Details to show their distributions",status = "primary",solidHeader = T,
                                             "These app deatails were named according to column names in the CSV fie",
                                             selectInput("appDetails","select app property",c("user_rating","size_bytes","prime_genre","price","sup_devices.num","lang.num"),selected = "user_rating")
                                         )
                                         
                                         
                                         
                                         
                                       )
                                       
                                       
                                       
                                       
                              ),
                              tabPanel("Price vs user ratings"),
                              tabPanel("Size vs user ratings"),
                              tabPanel("No of languages Vs useratings")
                              
                  )
                  
                  
                )
                
                
        ),
        tabItem(tabName = "summary"
                
        ),
        tabItem(tabName = "help" 
                
        )
      )
      
      
    )
  )
  
)