#
# This is a Shiny web application that aims to implement the Organa PM
# Competency framework.
#
#  Commenced 20th August, 2022
#

library(shiny)

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Organa PM Competency Framework"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("users",
                        "Know your users:",
                        min = 0,
                        max = 5,
                        value = 0)
        ),

        # Just return values for now
        mainPanel(
           textOutput("value")
        )
    )
)

# Define server logic
server <- function(input, output) {

    output$value <- renderText({
        paste0("You selected: ", input$users)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
