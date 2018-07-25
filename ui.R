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
        tabItem(tabName = "home",
                h2("Description"),
                p("The Mobile App Statistics is a data system that analyzes app details from the App Store and generates insights which are intended to help developers get more people to download their applications and optimistically increase the user ratings of their apps. "),br(), 
                
                h2("System functionality"),
                em(p("Users of this system can use it to collect analysis on;")),
                p("1.  How price of an app affect the user rating and which app groups are most bought which will help app developers while pricing their apps."),
                p("2.   How new versions have improved the app ratings."),
                p("3.   Which app group has the best, average, and least user ratings which will give app developers a field to focus on most."),
                p("4.   How the size of an app affect its user rating."),
                p("5.   how app screen shots shown when users are downloading apps affect user rating."),
                p("6.   How languages supported by the App affect user ratings.")
        ),
        
        tabItem(tabName = "dataset",
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
                                           
                                           box(title = "controls for the Graph",status = "primary",solidHeader = T,
                                               sliderInput("bins","Number of Breaks",1,100,50)
                                           ),
                                           box(title = "App Details to show their distributions",status = "primary",solidHeader = T,
                                               "These app deatails were named according to column names in the CSV fie",
                                               selectInput("appDetails","select app property",c("user_rating","size_bytes","cont_rating","prime_genre","price","sup_devices.num","lang.num"),selected = "user_rating")
                                           )
                                           
                                           
                                           
                                         ),
                                         fluidRow(
                                           
                                           
                                           plotOutput("hist")
                                           
                                           
                                         )
                                       
                                       
                                       
                              ),
                              tabPanel("Price",
                                         ui<-fluidPage(
                                           fluidRow(
                                             plotOutput("price")
                                           ),
                                           fluidRow(
                                             box(title = "Variation Categories",status = "primary",solidHeader = T,
                                                 selectInput("price","select category",c("boxplot","Regression"),selected = "boxplot_variation")
                                             )
                                             
                                           )
                                         )
                                         ),
                               tabPanel("Size",
                                         ui<-fluidPage(
                                           fluidRow(
                                             plotOutput("size")
                                           ),
                                           fluidRow(
                                             box(title = "Variation Categories",status = "primary",solidHeader = T,
                                                 selectInput("size","select category",c("boxplot","Regression"),selected = "boxplot_variation")
                                             )
                                             
                                           )
                                         )
                                         
                                         ),
                              tabPanel("No of languages Vs useratings"),
			                                      tabPanel("Comparison in Groups",
                                         ui<-fluidPage(
                                           fluidRow(
                                             box(title = "App Detail to Get Group comparison",status = "primary",solidHeader = T,
                                                 "These app deatails were named according to column names in the CSV fie",
                                                 selectInput("groups","select app property",c("user_rating","cont_rating","size_bytes","price","sup_devices.num","ipadSc_urls.num","lang.num"),selected = "user_rating")
                                             )
                                            
                                           ),
                                           fluidRow(
                                             plotOutput("groups")
                                         )
                                         )
                    )

                              
                  		)
                  )
                  
                ),
        tabItem(tabName = "summary"
                
        ),
        tabItem(tabName = "help" ,
                tabsetPanel(tabPanel("Data",tableOutput("data"),
                                      h3("How to import datasets"),
                                      h4("Steps"),
                                      p("1-Import a dataset with a name Applestore.csv 
                                        by clicking on the Import Dataset tab."),
                                      p("2- A windows explorer opens "),
                                      p("3- Navigate and choose the 
                                        csv file compatible with the system."),
                                      p("4-  click on the open button of the windows explorer to upload the file."),
                                      p("5- The system is now be able to analyse the imported dataset"),
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
                                        ")
                                      ),
                             tabPanel("Visualization",
                                      h3("How to visualize insights after importing the datasets"),
                                      h4("Steps"),
                                      p("1- Click on the visualization tab after importing the datasets"),
                                      p("2- Choose among the displayed navigation tabs i.e. Distribution, price, screenshots, content rating,Comparison in groups, App versions and size"),
                                      p("3- Choose the controls of how to display the graph by using the slider under the Distribution tab"),
                                      p("4- Choose the categories of the distribution graph you want to be displayed by choosing from the dropdown list"),
                                      p("5- All the other tabs have the Variation category option displayed after clicking on them"),
                                      p("6- Choose among the options such as box plot and regression which will display the appropriate graphs")
                             ),
                             tabPanel("Summary",
                                      h3("Using the summary tab"),
                                      h4("Steps"),
                                      p("1- Click on the summary tab to display the summary options"),
                                      p("2- Select the dataset column to display its summary such as mean, min and max"),
                                      p("3- User has two select options that can display the summary at the same time")),
                             tabPanel("Sentimental Analysis",
                                      h3("Using the sentimental analysis tab"),
                                      h4("Steps"),
                                      p("1- Click on the sentimental analysis tab after importing the datasets"),
                                      p("2- Sentiment and polarity navigation tabs are displayed"),
                                      p("3- Click on sentiment to display the sentimental analysis"),
                                      p("4- Click on polarity to display the polarity")))
               
        					)
      			)
      
      
    		)
  	)
  
)
