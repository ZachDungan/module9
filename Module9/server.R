library(shiny)

shinyServer(function(input, output) {
  modelQsec <- lm(qsec ~ wt + hp + disp, data = mtcars)
  modelMPG <- lm(mpg ~ wt + hp + disp, data = mtcars)
  
  modelpredQsec <- reactive({
    wtInput <- input$sliderWT
    hpInput <- input$sliderHP
    dispInput <- input$sliderDISP
    predict(modelQsec, newdata = data.frame(wt = wtInput, hp = hpInput, disp = dispInput))
  })
  
  modelpredMPG <- reactive({
    wtInput <- input$sliderWT
    hpInput <- input$sliderHP
    dispInput <- input$sliderDISP
    predict(modelMPG, newdata = data.frame(wt = wtInput, hp = hpInput, disp = dispInput))
  })
  
  output$predQsec <- renderText({
    modelpredQsec()
  })
  
  output$predMPG <- renderText({
    modelpredMPG()
  })
})
