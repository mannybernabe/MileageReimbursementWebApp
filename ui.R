library(leaflet)

shinyUI(fluidPage(
  titlePanel("Rotation Mileage Estimator (Beta v0.02)"),
  
  sidebarLayout(
    
    sidebarPanel(
      p("This app estimates the mileage reimbursement 
      amount for Rush Medical Residents for off-site rotations.  Caveat: 
Driving distances are via Google Maps.  While Rush suggests you use MapQuest, the results should be comparable and will at least inform you if it's worth the time to fill-out the form.
        Please",a("email me",href="mailto:mileApp+bernabe.emmanuel@gmail.com"),"if you find any bugs or would like to suggest improvements!"),
      h3("Instructions"),
      p("Fill out the below 
        information and hit the GO button.  
        For address look-ups check out",
        a("google maps.", href = "https://www.google.com/maps/place/Rush+
          University+Medical+Center/@41.874694,-87.668657,
          17z/data=!3m1!4b1!4m2!3m1!1s0x880e2d17737365ed:0x46a1c53cdfb354ab",
          target="_blank")),
      textInput("homeName", 
                label = h4("Enter Your Home Address (e.g. 1234 W. Love St., Chicago, IL):"),
                value="1227 W 18th St, Chicago, IL 60608"),
      textInput("hospName", 
                label = h4("New Rotation Hospital Address:"),
                value="1460 N Halsted St., Chicago, IL 60642"),
      numericInput("reimNum", 
                   label = h4("Reimbursement Rate (Currently at $0.555 per additional mile)"), 
                   value = 0.555,step=.005),
      numericInput("tripNum", 
                   label = h4("Number of Round Trips (i.e. The number of days you were on the new rotation.):"), 
                   value = 5),
      actionButton("goButton", "Go!"),
      
      p("Now here's Rick Astley to cheer up your day!"),
      HTML('<iframe width="200" height="150" src="//www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allowfullscreen></iframe>')

      
    ),
    
    mainPanel(h4("Estimation:"),
              verbatimTextOutput("value"),
              leafletOutput('myMap')
              
    )
  )
))