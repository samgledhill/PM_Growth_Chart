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
          
            textInput("user_name",
                      "What is your name?"),
            
            sliderInput("users",
                        "Know your Market: Users",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("industry",
                        "Know your Market: Industry",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("business",
                        "Know your Product: The Business",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("product",
                        "Know your Product: The Product",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("tactics",
                        "Know your Craft: Tactics (the trees)",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("strategy",
                        "Know your Craft: Strategy (the forest)",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("leadership",
                        "Know your Self: Leadership",
                        min = 0,
                        max = 5,
                        value = 0),
            
            sliderInput("collaboration",
                        "Know your Self: Collaboration",
                        min = 0,
                        max = 5,
                        value = 0)
        ),

        # Just return values for now
        mainPanel(
          
          h3(textOutput("name")),
          tableOutput("values"),
          
          plotOutput("plot")
        )
    )
)

# Define server logic
server <- function(input, output) {
  
  
    output$name <- renderText({
      paste0("Hello ", input$user_name, "!")
    })

    sliderValues <- reactive({
      
      data.frame(
        Name = c("Users",
                 "Industry",
                 "The Business",
                 "The Product",
                 "Tactics (the trees)",
                 "Strategy (the forest)",
                 "Leadesrhip",
                 "Collaboration"),
        Value = as.character(c(input$users,
                               input$industry,
                               input$business,
                               input$product,
                               input$tactics,
                               input$strategy,
                               input$leadership,
                               input$collaboration)),
        stringsAsFactors = FALSE)
      
    })
    
    # Show the values in an HTML table ----
    output$values <- renderTable({
      sliderValues()
    })
      
    output$plot <- renderPlot({
      df <- tibble(name = input$user_name,
                   business = input$business,
                   product = input$product,
                   collaboration = input$collaboration,
                   leadership = input$leadership,
                   strategy = input$strategy,
                   tactics = input$tactics,
                   users = input$users,
                   industry = input$industry)
      
      df <- df %>% 
        pivot_longer(cols = business:industry, 
                     names_to = "dimension", 
                     values_to = "score")
      
      df %>% 
        mutate(dimension = factor(dimension,
                                  levels = unique(dimension),
                                  labels = str_to_title(unique(dimension)))) %>%
        ggplot(aes(x = dimension,
                   y = score)) +
        geom_col(fill = "red",
                 alpha = 1,
                 width = 1) +
        geom_hline(yintercept = seq(0, 5, by = 1),
                   color = "grey50", size = 0.8) +
        geom_vline(xintercept = seq(1.5, 7.5, by = 2),
                   color = "grey50", size = 0.8) +
        coord_polar(clip = "off") +
        theme(panel.grid = element_blank(),
              panel.background = element_blank(),
              axis.text.y = element_blank(),
              axis.ticks.y = element_blank(),
              axis.title = element_blank()) +
        annotate("segment",
                 x = 0.5, xend = 0.5,
                 y = -1, yend = 6.5,
                 color = "black",
                 size = 1.5) +
        annotate("segment",
                 x = 2.5, xend = 2.5,
                 y = -1, yend = 6.5,
                 color = "black",
                 size = 1.5) +
        annotate("segment",
                 x = 4.5, xend = 4.5,
                 y = -1, yend = 6.5,
                 color = "black",
                 size = 1.5) +
        annotate("segment",
                 x = 6.5, xend = 6.5,
                 y = -1, yend = 6.5,
                 color = "black",
                 size = 1.5) +
        annotate("text", 
                 x = .5,
                 y = 0:5,
                 label = c(0, 1, 2, 3, 4, 5),
                 hjust = -1) +
        annotate("text", 
                 x = 2.5,
                 y = 0:5,
                 label = c(0, 1, 2, 3, 4, 5),
                 vjust = -0.5) +
        annotate("text",
                 x = 7.5,
                 y = 5,
                 label = "Know your Market",
                 hjust = 1.5,
                 vjust = -8,
                 fontface = 2) +
        annotate("text",
                 x = 1.5,
                 y = 5,
                 label = "Know your Product",
                 hjust = -0.4,
                 vjust = -8,
                 fontface = 2) +
        annotate("text",
                 x = 3.5,
                 y = 5,
                 label = "Know your Self",
                 hjust = -0.7,
                 vjust = 10,
                 fontface = 2) +
        annotate("text",
                 x = 5.5,
                 y = 5,
                 label = "Know your Craft",
                 hjust = 1.6,
                 vjust = 10,
                 fontface = 2)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
