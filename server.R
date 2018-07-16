library(shiny)
library(shinydashboard)
library(ggplot2)

#line below increases the size of the file to be uploaded from the defalt 5MBS to 15MBS.
options(shiny.maxRequestSize=15*1024^2)
shinyServer(function(input,output){
  output$hist<-renderPlot({
    #hist(data1$user_rating,breaks = input$bins)
    ggplot(data = input$files,aes(x=user_rating))+geom_histogram(bins = input$bins)+
      
      labs(title="Histogram",
            subtitle="A Histogram showing the distribution of useratings",
           x="User rating",
           y="Number of apps")
  }
  
  )
  #code to diisplay the select option for the loaded files.
  output$selectfile<-renderUI({
    if(is.null(input$file1)){return()}
    list(
      hr(),
      helpText("select the file you need"),
      selectInput("select","select",choices = input$file1$name)
    )
  })

  #code to display  the loaded files
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    df <- read.csv(input$file1$datapath[input$file1$name==input$select],
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote)
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })

  
})

