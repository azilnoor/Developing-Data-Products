library(shiny)

shinyUI(fluidPage(
  titlePanel("Timber Volume Estimator"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(paste("Please select the size of girths and heights of trees.",
                     "Click on 'Estimate Timber Volume' to get the estimated timber.")),
      
      br(),
      sliderInput("Girth", "Girth (inches):", 
                  min = 5, max = 40, value = 19, step= 0.001),
      br(),
      sliderInput("Height", "Height (ft):", 
                  min = 50, max = 100, value = 80, step= 0.1),
      br(),
      submitButton("Estimate Timber Volume")
    ),
    
    mainPanel(
      htmlOutput("text")
    )
  )
))