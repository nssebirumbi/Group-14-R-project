library(shiny)
library(shinydashboard)
library(ggplot2)

#line below increases the size of the file to be uploaded from the defalt 5MBS to 15MBS.
options(shiny.maxRequestSize=15*1024^2)
shinyServer(function(input,output){
  output$hist<-renderPlot({
    
    if(input$appDetails== "user_rating"){
      #plot a bar graph showing the distribution of user ratings
      return(ggplot(data = data1,aes(x=user_rating))+geom_histogram(bins = input$bins)+
               
               labs(title="A Histogram showing the distribution of user ratings",
                    x="User Ratings",
                    y="Number of apps"))
    }
    if(input$appDetails== "prime_genre"){
      #plot a bar graph to show the distribution of app groups
      return( ggplot(data=data1,aes(x=prime_genre))+
                geom_bar()+
                labs(title="A bar plot showing the distribution of app groups",
                     x="App Group",
                     y="Number of apps"
                  
                ))
    }
    if(input$appDetails=="size_bytes"){
      return(
        ggplot(data=data1,aes(x=size_bytes))+
          geom_histogram(bins = input$bins)+
          labs(title="A bar plot showing the distribution of app sizes",
               x="size of apps in bytes",
               y="Number of apps"
               
          )
      )
    }
    if(input$appDetails=="price"){
      return(
        ggplot(data=data1,aes(x=as.factor(price)))+
          geom_bar()+
          labs(title="A bar plot showing the distribution of price",
               x="Price",
               y="Number of apps"
            
          )
      )
    }
    if(input$appDetails=="lang.num"){
      return(
        ggplot(data=data1,aes(x=lang.num))+
          geom_histogram(bins = input$bins)+
          labs(title="A Histogram showing the distribution of Languages supported by each app",
               x="Number of Languages supported",
               y="Number of apps")
      )
    }
    if(input$appDetails=="sup_devices.num"){
      return(
        ggplot(data = data1,aes(x=sup_devices.num))+
          geom_histogram(bins=30)+
          labs(title="Distribution of Number of devices supported",
               x="Number of devices supported",
               y="Number of apps")
      )
    }
    else{
      return(NULL)
    }
    
  })
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

