library(shiny)
data(trees)
treesReg = lm(Volume ~ Girth + Height, data=trees)

shinyServer(function(input, output) {
  newTimber <- reactive({
    newTree = data.frame(Girth=as.numeric(input$Girth),Height=as.numeric(input$Height))
    newTimber <- predict(treesReg,newTree)[[1]]
    
  })
  
  output$text <- renderUI({
    
    HTML(paste(sprintf("<h2>Summary</h2>"),
               sprintf("The program is utilized the Black Cherry Trees datasets (trees) in r. The purpose to to estimate the volume of timber produce by the trees using multivariate linear regression"),
               sprintf("<br>"),
               sprintf("User need to use the side bar to set the number of girth and height. After that, press the 'Estimate Timber Volume' button, the desired input and the estimated timber volume will be computed and shown below."),
               sprintf("<br>"),
               sprintf("<h4>Estimate from girth size & tree height</h4>"),
               sprintf("Girth  :<b> %s inches </b>", input$Girth),
               sprintf("Height : <b>%s ft </b>", input$Height),
               sprintf("<br/>"),
               sprintf("<h3>Estimated Timber Volume: %f cubic ft </h3>", newTimber()),
               sep="<br/>"))
  })
})