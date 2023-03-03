library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict QSec and MPG from Weight, Horsepower, and Displacement"), 
  sidebarLayout(
    sidebarPanel(
      
      h4("Description:"),
      p("This is a multilinear regression model that predicts 1/4 mile time (qsec) and Miles per Gallon (mpg) using weight, horsepower, and displacement in the mtcars dataset."),
      h4("How to use:"),
      p("Use the sliders below to adjust the weight, horsepower, and displacement and hit the submit button. The results will be displayed on the main panel."),
      
      sliderInput("sliderWT", "What is the weight of the car (in tons)?", 1, 6, value = 3, step = 0.01),
      sliderInput("sliderHP", "What is the cars horsepower?", 50, 350, value = 150),
      sliderInput("sliderDISP", "What is the cars displacement", 50, 500, value = 250),
      submitButton("Submit")
    ), 
    mainPanel(
      h3("Predicted 1/4 Mile time from Model:"),
      textOutput("predQsec"),
      h3("Predicted Miles per Gallon from Model:"),
      textOutput("predMPG")
    )
  )
))
