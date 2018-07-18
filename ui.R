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
                # Define UI for data upload app ----
                ui <- fluidPage(
                  
                  # App title ----
                  titlePanel("Uploading Files"),
                  
                  # Sidebar layout with input and output definitions ----
                  sidebarLayout(
                    
                    # Sidebar panel for inputs ----
                    sidebarPanel(
                      
                      # Input: Select a file ----
                      fileInput("file1", "Choose CSV File",
                                multiple = TRUE,
                                accept = c(
                                  ".csv")),
                      
                      uiOutput("selectfile"),
                      
                      # Horizontal line ----
                      tags$hr(),
                      
                      # Input: Checkbox if file has header ----
                      checkboxInput("header", "Header", TRUE),
                      
                      # Input: Select separator ----
                      radioButtons("sep", "Separator",
                                   choices = c(Comma = ",",
                                               Semicolon = ";",
                                               Tab = "\t"),
                                   selected = ","),
                      
                      radioButtons("quote", "Quote",
                                   choices = c(None = "",
                                               "Double Quote" = '"',
                                               "Single Quote" = "'"),
                                   selected = '"'),
                      
                      # Horizontal line ----
                      tags$hr(),
                      
                      # Input: Select number of rows to display ----
                      radioButtons("disp", "Display",
                                   choices = c(Head = "head",
                                               All = "all"),
                                   selected = "head")
                      
                    ),
                    
                    # Main panel for displaying outputs ----
                    mainPanel(
                      
                      # Output: Data file ----
                      tableOutput("contents")
                      
                    )
                    
                  )
                )
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
                  
                  
                ),
        tabItem(tabName = "summary"
                
        ),
        tabItem(tabName = "help" 
                
        )
      )
      
      
    )
  )
  
)