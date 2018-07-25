library(shiny)
library(shinydashboard)
library(ggplot2)

#line below increases the size of the file to be uploaded from the defalt 5MBS to 15MBS.
options(shiny.maxRequestSize=15*1024^2)
shinyServer(function(input,output){
 
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
     output$price<-renderPlot({
    if(input$price=="boxplot"){
      return(
        ggplot(data=data(),aes(x=as.factor(user_rating),y=price,fill=as.factor(user_rating)))+
          theme_bw()+
          geom_boxplot()+
          labs(title="A box plot showing the how price affects user ratings",
               x="user rating",
               y="price")
      )
    }
    if(input$price=="Regression"){
      return(
        ggplot(data=data(),aes(x=user_rating,y=price))+
          geom_point()+
          geom_smooth(method = lm, se=FALSE)+
          labs(title="A scatter plot shhowing the correlation between price and user rating",
               x="User rating",
               y="Price of Apps"
            
          )
        
      )
    }
  })
 
  output$hist<-renderPlot({
   # if(input$select=="AppleStore"){}
    
    if(input$appDetails== "user_rating"){
      #plot a bar graph showing the distribution of user ratings
      return(ggplot(data = data(),aes(x=user_rating))+geom_histogram(bins = input$bins)+
               
               labs(title="A Histogram showing the distribution of user ratings",
                    x="User Ratings",
                    y="Number of apps"))
    }
    if(input$appDetails== "prime_genre"){
      #plot a bar graph to show the distribution of app groups
      return( ggplot(data=data(),aes(x=prime_genre))+
                geom_bar()+
                labs(title="A bar plot showing the distribution of app groups",
                     x="App Group",
                     y="Number of apps"
                     
                ))
    }
    if(input$appDetails=="cont_rating"){
      return(
        ggplot(data = data(),aes(x=cont_rating,fill= cont_rating))+geom_bar()+
          labs(title="Distribution of Content Rating",
               x="Content rating",
               y="Number of apps")
      )
    }
    if(input$appDetails=="size_bytes"){
      return(
        ggplot(data=data(),aes(x=size_bytes))+
          geom_histogram(bins = input$bins)+
          labs(title="A bar plot showing the distribution of app sizes",
               x="size of apps in bytes",
               y="Number of apps"
               
          )
      )
    }
    if(input$appDetails=="price"){
      return(
        ggplot(data=data(),aes(x=as.factor(price)))+
          geom_bar()+
          labs(title="A bar plot showing the distribution of price",
               x="Price",
               y="Number of apps"
               
          )
      )
    }
    if(input$appDetails=="lang.num"){
      return(
        ggplot(data=data(),aes(x=lang.num))+
          geom_histogram(bins = input$bins)+
          labs(title="A Histogram showing the distribution of Languages supported by each app",
               x="Number of Languages supported",
               y="Number of apps")
      )
    }
    if(input$appDetails=="sup_devices.num"){
      return(
        ggplot(data = data(),aes(x=sup_devices.num))+
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
  output$size<-renderPlot({
    if(input$size=="boxplot"){
      return(
        ggplot(data=data(),aes(x=as.factor(user_rating),y=size_bytes,fill=as.factor(user_rating)))+
          theme_bw()+
          geom_boxplot()+
          labs(title="A box plot showing the how size of apps affects user ratings",
               x="User rating",
               y="size of app")
      )
    }
    if(input$size=="Regression"){
      return(
        ggplot(data=data(),aes(x=user_rating,y=size_bytes))+
          geom_point()+
          geom_smooth(method = lm, se=FALSE)+
          labs(title="A scatter plot shhowing the correlation between size and user rating",
               x="User rating",
               y="Size of an App"
               
          )
        
      )
    }
  })
 output$groups<-renderPlot({
  
  if(input$groups=="user_rating"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=user_rating))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app groups basing on user rating",
             x="App Group",
             y="user rating")
    )
    
  }
  if(input$groups=="size_bytes"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=size_bytes))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app Groups basing on size",
             x="App Group",
             y="Size ofApps in bytes")
    )
    
  }
  if(input$groups=="size_bytes"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=size_bytes))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app Groups basing on size",
             x="App Group",
             y="Size ofApps in bytes")
    )
    
  }
  if(input$groups=="cont_rating"){
    return(
      ggplot(data=data(),aes(x=prime_genre,fill=cont_rating))+
        theme_bw()+
        geom_bar()+
        labs(title="Comparison of app Groups basing on price",
             x="App Group",
             y="price")
    )
    
  }
  if(input$groups=="ipadSc_urls.num"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=ipadSc_urls.num))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app Groups basing on Number of Screenshots",
             x="App Group",
             y="Number of Screenshots")
    )
  }
  if(input$groups=="sup_devices.num"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=sup_devices.num))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app Groups basing on Number of devices suppported",
             x="App Group",
             y="Number of devices supported")
    )
    
  }
  if(input$groups=="lang.num"){
    return(
      ggplot(data=data(),aes(x=prime_genre,y=lang.num))+
        theme_bw()+
        geom_boxplot()+
        labs(title="Comparison of app Groups basing on Number of languages it supports",
             x="App Group",
             y="Number of languages supported")
    )
    
  }
  
})
 
 output$screenshots<-renderPlot({
  if(input$screenshots=="boxplot"){
    return(
      ggplot(data=data(),aes(x=as.factor(user_rating),y=ipadSc_urls.num,fill=as.factor(user_rating)))+
        theme_bw()+
        geom_boxplot()+
        labs(title="A box plot showing the how Number of Screenshots affects user ratings",
             x="user rating",
             y="Number of Screenshots")
    )
  }
  if(input$screenshots=="Regression"){
    return(
      ggplot(data=data(),aes(x=user_rating,y=ipadSc_urls.num))+
        geom_point()+
        geom_smooth(method = lm, se=FALSE)+
        labs(title="A scatter plot shhowing the correlation between the Number of Screenshots and user rating",
             x="User rating",
             y="Number of Screen Shots"
             
        )
      
    )
  }
})
  output$content<-renderPlot({
    if(input$content=="boxplot"){
      return(
        ggplot(data=data(),aes(x=cont_rating,y=user_rating,fill=cont_rating))+
          theme_bw()+
          geom_boxplot()+
          labs(title="A box plot showing the how size of apps affects user ratings",
               x="User rating",
               y="cont_rating")
      )
    }
    if(input$content=="histogram"){
      return(
        ggplot(data=data(),aes(x=user_rating,fill=cont_rating))+
          geom_histogram()+
          labs(title="A Histogram shhowing the correlation between content Rating and user rating",
               x="User rating",
               y="content rating"
               
          )
        
      )
    }
    
  })
 
 output$sum_ary<-renderTable({
  if(input$columns=="user_rating"){
    return(
      as.array(summary(data()$user_rating))
    )
  }
  if(input$columns=="size_bytes"){
    return(
      as.array(summary(data()$size_bytes))
    )
  }
  if(input$columns=="cont_rating"){
    return(
      as.array(summary(data()$cont_rating))
    )
  }
  if(input$columns=="lang.num"){
    return(
      as.array(summary(data()$lang.num))
    )
  }
  if(input$columns=="sup_devices.num"){
    return(
      as.array(summary(data()$sup_devices.num))
    )
  }
  if(input$columns=="price"){
    return(
      as.array(summary(data()$price))
    )
  }
  if(input$columns=="ipadSc_urls.num"){
    return(
      as.array(summary(data()$ipadSc_urls.num))
    )
  }
  
  
  
})
 
 output$table<-renderTable({
  if(input$table=="user_rating"){
    return(
      as.array(table(data()$user_rating))
    )
  }
  if(input$table=="size_bytes"){
    return(
      as.array(table(data()$size_bytes))
    )
  }
  if(input$table=="cont_rating"){
    return(
      as.array(table(data()$cont_rating))
    )
  }
  if(input$table=="lang.num"){
    return(
      as.array(table(data()$lang.num))
    )
  }
  if(input$table=="sup_devices.num"){
    return(
      as.array(table(data()$sup_devices.num))
    )
  }
  if(input$table=="price"){
    return(
      as.array(table(data()$price))
    )
  }
  if(input$table=="prime_genre"){
    return(
      as.array(table(data()$prime_genre))
    )
  }
  if(input$table=="ipadSc_urls.num"){
    return(
      as.array(table(data()$ipadSc_urls.num))
    )
  }
  
  
  
})
  })
