library(shiny)

shinyServer(function(input, output) {
  cake <- read.csv("./cake.csv")
  model <- lm(angle ~ recipe + temperature, data = cake)
        
  pred <- reactive({
          recipeInput <- input$recipe
          tempInput <- input$temperature
          round(predict(model, 
                  newdata = data.frame(recipe = recipeInput, 
                                       temperature = tempInput)),
                2)
        })
  
  output$pred <- renderText({
          pred()
  })
                
          
  })