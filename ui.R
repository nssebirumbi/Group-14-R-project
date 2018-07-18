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
        tabItem(tabName = "help" ,
                tabsetPanel( tabPanel("Data",tableOutput("data"),
                                      h3("How to import datasets"),
                                      h4("Steps"),
                                      p("1-A dataset with a name Applestore.csv should be imported into the system
                                        by clicking on the Import Dataset tab."),
                                      p("2- A windows explorer will open and the user 
                                        will navigate through the files and choose the 
                                        csv file compatible with the system."),
                                      p("3- After selecting the appropriate dataset, the user should
                                        then click on the open button of the windows explorer to upload the file."),
                                      p("4- The system will now be able to analyse the imported dataset"),
                                      h3("Incompatible datasets"),
                                      p(" A compatible dataset should be named appleStore.csv with the following columns below and their meaning"),
                                      p("1.	\"id\" : App ID"),
                                      p("2.	\"track_name\": App Name"),
                                      p("3.	\"size_bytes\": Size (in Bytes)") ,
                                      p("4.	\"currency\": Currency Type"),
                                      p("5.	\"price\": Price amount") ,
                                      p("6.	\"rating_count_tot\": User Rating counts (for all version)") ,
                                      p("7.	\"rating_count_ver\": User Rating counts (for current version)"),
                                      p("8.	\"user_rating\" : Average User Rating value (for all version)"),
                                      p("9.	\"user_rating_ver\": Average User Rating value (for current version)") ,
                                      p("10.	\"ver\" : Latest version code"),
                                      p("11.	\"cont_rating\": Content Rating"),
                                      p("12.	\"prime_genre\": Primary Genre ") ,
                                      p("13.	\"sup_devices.num\": Number of supporting devices "),
                                      p("14.	\"ipadSc_urls.num\": Number of screenshots showed for display"), 
                                      p("15.	\"lang.num\": Number of supported languages") ,
                                      p("16.	\"vpp_lic\": Vpp Device Based Licensing Enabled 
                           ")))
               
        )
      )
      
      
    )
  )
  
)