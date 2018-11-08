library(shiny)


shinyUI(fluidPage(
  titlePanel("Cake Break Point Forecast"),
  sidebarLayout(
    sidebarPanel(
       selectInput("recipe",
                   h4("Choose your baking style:"),
                   choices = list("add chocolate at 40 degree celcius" = "A",
                                  "add chocolate at 60 degree celcius" = "B",
                                  "extra sugar" = "C")
                   ),
       sliderInput("temperature",
                   h4("Choose your baking temperature (degree celcius)"),
                   min = 175,
                   max = 225,
                   value = 195
                   ),
       submitButton("Bake!"),
       helpText("Bake a cake with your selected recipe and temperature,", 
                "hold half a slab of cake fixed,", 
                "pivoted the other half about the middle, see when will it break.")
       
        ),
    
    mainPanel(
       h3("Your cake's estimated break points is:"),
       h4(textOutput("pred"), style = "color:navy"),
       br(),
       br(),
       h4(em("Have a sweet day!")),
       img(src = "cake.jpeg", height = 200, width = 300)
            
    )
  )
))
