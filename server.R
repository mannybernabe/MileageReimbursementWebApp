library(ggmap)
library(leaflet)
require(leaflet)

source("RUSH_functions.R")


shinyServer(function(input, output) {
  
 
  
  ntext <- eventReactive(input$goButton, {
    
    validate(
      need(input$homeName != "", "Please enter a home address")
    )
    
    validate(
      need(input$hospName != "", "Please enter a hospital address")
    )
    
    
    checkEligibility.fun(input$homeName,
                         input$hospName,
                         input$reimNum,
                         input$tripNum)
  }
   
  )
  
  nmap<-eventReactive(input$goButton,{
    item.names<-c(input$homeName,
                  input$hospName,
                  "1653 W Congress Pkwy, Chicago, IL 60612")
    item.coor.df<-geocode(item.names)
    item.coor.df$names<-c("Home Sweet Home", "New Rotation Location","Rush Home Base")
    
    
    m = leaflet() %>% addTiles() %>% 
      setView(-87.669117, 41.875057, zoom=12) %>%
      addMarkers(data=item.coor.df, popup = item.coor.df$names)
    m
    
  })
  
  output$value <- renderPrint({ntext() })
  output$myMap = renderLeaflet({nmap()})
  
  

  
})