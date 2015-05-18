library(leaflet)

#functions

distCalc1.fun<-function(address){
  
  rush.name <- "1653 W Congress Pkwy, Chicago, IL 60612"  
  miles<-suppressMessages(mapdist(address, rush.name, mode = 'driving')$miles)
  return(round(miles,3))
}

distCalc2.fun<-function(home.name,newHosp.name){
  
  rush.name <- "1653 W Congress Pkwy, Chicago, IL 60612"  
  miles<-suppressMessages(mapdist(home.name, newHosp.name, mode = 'driving')$miles)
  return(round(miles,3))
}



checkEligibility.fun<-function(home.name,newHosp.name,reimburseRate=0.555,noDays){
  home.dist<-distCalc1.fun(home.name)
  newHosp.dist<-distCalc2.fun(home.name,newHosp.name)
  
  if(home.dist>newHosp.dist){
    print(paste("Sorry, but you're not eligible for mileage reimbustment.",
                "Your commute(",home.dist,"miles) is greater than the",
                "new rotation commute(",newHosp.dist,"miles).  Bummer!"))
    
  } else{
    return(cat("You're eligible!\nHome to New Rotation (Miles):",
           newHosp.dist,
           "\nHome to RUSH (Miles):",
           home.dist,
           "\nReimburstment Amount($):",
           round((newHosp.dist-home.dist)*2*reimburseRate*noDays,2)))
    
  }
}





