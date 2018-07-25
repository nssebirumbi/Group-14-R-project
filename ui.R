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
        tabItem(tabName = "help" ,
                tabsetPanel( tabPanel("Data",tableOutput("data"),
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
      
      
    ))
  )
  
)