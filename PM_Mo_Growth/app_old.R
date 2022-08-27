#
# This is a Shiny web application that aims to implement the Organa PM
# Competency framework.
#
#  Commenced 20th August, 2022
#

library(shiny)
library(tidyverse)

# Define UI for application
ui <- fluidPage(
  tags$head(# Note the wrapping of the string in HTML()
    tags$style(
      HTML(
        "

        table, td, th {
          border: 1px solid black;
          border-collapse: collapse;
          padding: 5px;
        }"
      )
    )),
  
  # Application title
  titlePanel("Organa PM Competency Framework"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("user_name",
                "What is your name?"),
      plotOutput("plot")
      ),
    
    
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Know your Market",
                 tabsetPanel(type = "tabs",
                            tabPanel("Users",
                                      h3("Users"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("You’ve never been involved in any kind of user research. Your experience has been focused on delivery, not 
                                               user-centred outcomes.")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You’ve worked in a team that talks about their users and tries to create products for them, but you’ve not 
                                               really been involved in understanding them. You’re starting to understand and experience different sets of 
                                               data, quantitative and qualitative, you can draw upon to understand new and existing users.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You’ve started to identify ways to understand both the total market of potentialusers and the
                                              discreet addressable market of who you’re really targeting. There are other sources that will help
                                              you understand users and you’ve started using them. Perhaps you’ve made some decisions based on either
                                               qualitative or quantitative user data from your existing users.")),
                                          tr(
                                            td("3 Competent"),
                                            td("For existing users you can articulate who they are, their needs and pain points. For potential users you use 
                                              market segmentation and have experience with behavioural, demographic, psychographic or geographic segmentation. 
                                              You’re comfortable making decisions using qualitative or quantitative data and you’re well on your way to becoming 
                                              the company-acknowledged expert on your users.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("Perhaps you’ve entered into the Product Manager role from a marketing, social science or user research background 
                                              so you have an extra lens on users. You know the benefits of different research methods, the contexts in which they’re 
                                              best applied and are capable of working with Teams that provide this or carrying out this work yourself.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’re an acknowledged expert in the field of market and user research. You can riff on all methods and when they’re 
                                            best used. You might have led the Product Insights team and you’re definitely coaching others because of how deep your 
                                            knowledge and experience is."))
                                          )
                                        ),
                                      sliderInput("users",
                                                  "Know your Market: Users",
                                                  min = 0,
                                                  max = 5,
                                                  value = 0
                                                  )
                             ),
                             tabPanel("Industry",
                                      h3("Industry"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("You’re completely new to your company’s industry.")),
                                          tr(td("1 Beginner"),
                                             td("You’ve been at the company long enough to garner some basic understanding of your industry, but you don’t know much 
                                                outside of what you’ve been told internally.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You have a basic understanding of your main competitors and how you’re positioned. You’ve started to regularly 
                                              read what’s going on in your space and have starting using this knowledge in your discussions and decisions. If you don’t
                                              have access to people who do product marketing activities such as market sizing and segmentation, you should start 
                                              getting a grip on this.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You know enough about the industry you’re in to confidently hold your own in the company and your team. Your knowledge 
                                              is good enough to adequately lead your product team and bring market context into conversations. You know who your main 
                                              competitors are, how your product is positioned against theirs, and you have a solid grip on market dynamics and trends.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("People come to you because you know a LOT about this industry and they can learn from you. You might have some specialist
                                              knowledge that few have. You deeply understand competitors, their unique value propositions and how your product is 
                                              positioned against them. You have strong opinions on where the industry is going, backed by experience, data and insights 
                                              and can use these to actively shape product strategy.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’ve worked most of your career in this space. You know pretty much everything there is to know in this space and if 
                                              you weren’t a PM, you could probably work as a industry expert consulting to companies in the industry."))
                                          )
                                        ),
                                      sliderInput("industry",
                                                  "Know your Market: Industry",
                                                  min = 0,
                                                  max = 5,
                                                  value = 0)
                             )
                             )),
        tabPanel("Know your Product",
                 tabsetPanel(type = "tabs",
                             tabPanel("The Product",
                                      h3("The Product"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("Hey everyone, I’m new here. Can you teach me how this thing works?")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You’ve taken some time with key people to understand how the product works and you’ve spent a little bit of time 
                                            using it yourself. You’re starting to get yourself across all aspects of the product including its proposition, feature 
                                            set and compliance or governance requirements.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You know the product pretty well and have progressed to learning a broader range of topics about the product, like how 
                                            it works from a technical and UX perspective. You recognise there are ethical decisions that need to be considered, personally 
                                            and socially. You could train a new customer on how to successfully use the product.")),
                                          tr(
                                            td("3 Competent"),
                                            td("Most of the time you know the answer to a question about the product. Demo’ing to a prospective customer or handling live 
                                            support queries wouldn’t be a problem. You can speak to its relative state from a business model, ethics, UX, and tech 
                                            perspective. You’ve been in enough discussions and have made enough decisions to feel confident leading it, because you know 
                                            it.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("Either you’ve worked on the product for quite some time and can riff on its history and tales of success and failure 
                                            from many perspectives. Or perhaps you used to work as an engineer, designer or BA on the product and now you’re not
                                            only super deep in that area, but you’re also fully competent (level 3) everywhere else.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’ve either worked on it so long that there isn’t much you don’t know about the product, or you were pretty much 
                                            there from the beginning and designed it in the early days. No-one knows more about this product than you do."))
                                        )
                                      ),
                                      sliderInput("product",
                                                  "Know your Product: The Product",
                                                  min = 0,
                                                  max = 5,
                                                  value = 0)),
                             tabPanel("The Business",
                                      h3("The Business"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("You’re probably brand new to the company. Either that, or your onboarding process as a new employee was ... lacking.")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You have a basic understanding of why the company exists and perhaps where it wants to be. You’ve been onboarded into 
                                            some basic definition of company strategy and perhaps you’ve seen an org chart. You should have been exposed to the company’s 
                                            key metrics or KPIs.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You’ve started to build some relationships with different departments that you can collaborate with in order to succeed 
                                            with your product, e.g. marketing, customer service. You have a better understanding of the short and long term goals of the 
                                               company and the business metrics your product needs to strive for.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You know your stakeholders and how important they are to your product. Your product strategy aligns to the goals of the 
                                            business and you make sure you stay aligned. You can confidently give this context to your team and justify how product 
                                            decisions relate back to the business. You understand the business model, cost and revenue drivers, and you’re across key 
                                            product metrics and can map these back to business goals.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("You’ve built amazing relationships in the company and people regularly come to you to learn about the business, its 
                                            strategy or who to speak to if they need something. You’re capable of inputting into higher tier company strategy 
                                            discussions and go outside the realm of your local context. You’re deep in the business model and across key metrics 
                                               such as value or impact.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’re a founder / one of the earliest employees, or a massively seasoned veteran of the company. Perhaps you’ve 
                                            worked your way through a bunch of departments and know how the company works intimately well. There’s not much you don’t 
                                               know about the business, its strategy and how it works."))
                                        )
                                      ),
                                      sliderInput(
                                        "business",
                                        "Know your Product: The Business",
                                        min = 0,
                                        max = 5,
                                        value = 0
                                      )
                                      )
                             )
                ),
        tabPanel("Know your Craft",
                 tabsetPanel(type = "tabs",
                             tabPanel("Tactics (the trees)",
                                      h3("Tactics"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("You’re completely new to working with product teams, or you’ve only worked on waterfall projects that deliver a 
                                               specification. Budget, time or scope has been your language.")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You’re either mildly capable of delivering increments of a product in an iterative way, or you’ve only ever worked 
                                            with testing prototypes. Either way, you’re really at the beginning of your agile / product journey. Familiarity with 
                                            popular frameworks and a modern PM mindset is developing.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You’re competent in delivery or discovery, but still new to the idea of balancing them. You might be competent working 
                                            Scrum, but you’ve just experienced a design sprint. Whilst your focus is discovery, you understand the importance of a 
                                            supporting role in delivery and to the engineers, as well as the importance of engaging with other areas e.g. 
                                            go-to-market, customer service and operations.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You can juggle product discovery with delivering validated solutions in a quality fashion. You’re comfortable working
                                            with UX designers, researchers and stakeholders to groom and prioritise the backlog, ensuring only validated solutions make
                                            it into the product. You’re confident in saying no and articulating why. You dig into usage data and analyse metrics
                                            you’re trying to move, and formulate hypotheses to gradually improve the product. You’ve developed a profound understanding
                                            and use of product frameworks and embody a modern PM mindset.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("You’re capable of leading & facilitating discovery sprints. You know when to innovate, when to iterate and when to 
                                            optimise. You’re adept at balancing competing interests and co-ordinating key decisions. People come to you for advice, 
                                            you mentor PM’s or PO’s, you are truly able to educate more than just product people on the PM mindset and overarching
                                            product process.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’re an expert in the field and regularly give public talks on new or innovative ways to balance discovery, delivery 
                                            and operations. Maybe you’ve written a book. Maybe you’re Jeff Patton, Melissa Perri or Marty Cagan. If so, wow! Hi ... 
                                               we’re big fans of your work :)"))
                                        )
                                      ),
                                      sliderInput(
                                        "tactics",
                                        "Know your Craft: Tactics (the trees)",
                                        min = 0,
                                        max = 5,
                                        value = 0
                                      )
                             ),
                             tabPanel("Strategy (the forest)",
                                      h3("Strategy"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("Maybe you’ve only ever worked executing someone else’s product strategy. What’s an OKR?")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You’re able to piece together a basic product vision statement and have an emerging sense of why we’re here, 
                                            what’s important to the team & stakeholders. How that translates into steps towards that product vision, you’re not 
                                               really sure.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("Your team has a product vision, you articulate outcome-based goals and have basic metrics in place to help your 
                                            team make good decisions. You understand the strategic relationship between your product and other stakeholders. You
                                            know the needs and pains of those stakeholders and know how to manage their requests honestly and transparently. You are 
                                               an evangelist for the product.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You regularly analyse all the various internal (company) and external (market) signals and trends in order to create a 
                                            dynamic product strategy that articulates the reasoning behind your goals and roadmap. You’ve got structures in place 
                                            (e.g. quarterly OKRs) that define and track strategic goals. You have an understanding of your product’s lifecycle and can 
                                            make the difficult decision to retire a product or feature.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("People come to you to help them design compelling product strategies that encompass all the various dimensions of 
                                            shipping a great product, outside just the product itself e.g. position, pricing, go-to-market, product ops, support.
                                            Perhaps you coach and mentor other PMs, or work at a group / portfolio level and can create strategy outside of your 
                                               direct influence.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You participate at senior levels of the business because of your strategic prowess. You might not be great at writing 
                                            user stories, but you’re a legend on product strategy."))
                                        )
                                      ),
                                      sliderInput(
                                        "strategy",
                                        "Know your Craft: Strategy (the forest)",
                                        min = 0,
                                        max = 5,
                                        value = 0
                                      )
                                      )
                             )
                 ),
        tabPanel("Know yourself",
                 tabsetPanel(type = "tabs",
                             tabPanel("Collaboration",
                                      h3("Collaboration"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("You’ve never worked in a team before, you’ve been a lone wolf! The main success you care about is your own.")),
                                          tr(
                                            td("1 Beginner"),
                                            td("You’ve started to learn the importance of valuing the team & company’s success over your own, though most of your 
                                            experience has been in top-down, command and control environments where people are told what to do. You’re starting to 
                                            let go of the need to be in control, but it’s just the beginning.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You value the long term success of your team over short term wins. You share information openly and honestly. You’ve 
                                            also learned how to adjust your planning around dependencies to other teams and you’ve got the basics of Agile 
                                            collaboration down pat.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You’re able to make challenging priority decisions that are in the best interests of your company. This might mean 
                                            prioritising another team’s interests over your own, for the greater good. You’re capable of launching an initiative even 
                                            if it transcends the scope of your team, because the impact is what’s important. You’re solid at creative safe happy team 
                                               environments.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("You’re capable of leading organisation-wide initiatives that rely on many teams contributing and collaborating. This is 
                                            very difficult and requires a blend of skills like project management and Agile leadership along with being able to “see and 
                                            sense the whole”. This happens because of your approachable nature, strong relationships you nurture across the organisation 
                                               and your ability to leverage collective intelligence.")),
                                          tr(
                                            td("5 Expert"),
                                            td("Your company relies on you to drive company-wide initiatives because you’re great at execution and you embody what 
                                            Agile is all about - adaptation, trust and relationships. You’re able to lead highly complex initiatives with many 
                                            competing interests by building strong relationships, being in tune with the reality on the ground and bringing the right
                                            people together to solve problems collaboratively. You are a diplomat in the truest, most positive sense of the word. Ever 
                                               considered joining the United Nations?"))
                                        )
                                      ),
                                      sliderInput("collaboration",
                                                  "Know your Self: Collaboration",
                                                  min = 0,
                                                  max = 5,
                                                  value = 0)
                                      ),
                             tabPanel("Leadership",
                                      h3("Leadership"),
                                      withTags(
                                        table(
                                          tr(
                                            th("Competency"),
                                            th("Example")),
                                          tr(
                                            td("0 None"),
                                            td("Regardless of formal titles and responsibilities, you’ve never led people before.")),
                                          tr(
                                            td("1 Beginner"),
                                            td("Perhaps you’ve worked in a team where you’ve occasionally stepped up and provided direction. You’ve probably seen good 
                                            and bad leadership and have some early opinions and observations on what this could mean.")),
                                          tr(
                                            td("2 Adv. Beginner"),
                                            td("You’re starting to learn what it means to be a leader, how to influence, motivate and inspire people. You know that 
                                            internal self-awareness is what differentiates great leaders from the rest. Perhaps you’ve had some experience providing
                                            direction to a team or have supported a team member in their growth.")),
                                          tr(
                                            td("3 Competent"),
                                            td("You’re aware of different kinds of situational leadership, what intrinsically motivates people and regularly 
                                            communicate in a way that inspires your team to think for themselves. You have mechanisms in place to get behavioural 
                                            feedback from your peers and practise active listening. When leading, you consider your duty of care to those around you, 
                                            your users, society, and the environment. You are both mentoring and actively managing product folk.")),
                                          tr(
                                            td("4 Advanced"),
                                            td("You’re a seasoned manager of people or teams and know how to actively grow people. You’re a specialist in certain kinds
                                            of leadership and can help new PM’s (or anyone for that matter) learn how to be a better leader. There’s an art to listening
                                            and you’re a master at it because you’re deeply self aware. You enable and empower as opposed to telling or instructing. 
                                               Humility is a word you love.")),
                                          tr(
                                            td("5 Expert"),
                                            td("You’ve been leading and coaching people and teams for a long time and regardless of what you’re doing, you know 
                                            intimately well how get the best out of people. People naturally follow you and want to learn how to lead like you. You
                                            inspire everyone around you and could educate others on what great leadership looks like. You inspire trust and people keep 
                                            choosing you as the one they want to work with. You should write a book :)"))
                                        )
                                      ),
                                      sliderInput("leadership",
                                                  "Know your Self: Leadership",
                                                  min = 0,
                                                  max = 5,
                                                  value = 0)
                                      )
                             )
                 )
        )
      )
),
)





    # Define server logic
  server <- function(input, output) {
    output$name <- renderText({
      paste0("Hello ", input$user_name, "!")
    })
    
    sliderValues <- reactive({
      data.frame(
        Name = c(
          "Users",
          "Industry",
          "The Business",
          "The Product",
          "Tactics (the trees)",
          "Strategy (the forest)",
          "Leadesrhip",
          "Collaboration"
        ),
        Value = as.character(
          c(
            input$users,
            input$industry,
            input$business,
            input$product,
            input$tactics,
            input$strategy,
            input$leadership,
            input$collaboration
          )
        ),
        stringsAsFactors = FALSE
      )
      
    })
    
    # Show the values in an HTML table ----
    output$values <- renderTable({
      sliderValues()
    })
    
    output$plot <- renderPlot({
      df <- tibble(
        name = input$user_name,
        business = input$business,
        product = input$product,
        collaboration = input$collaboration,
        leadership = input$leadership,
        strategy = input$strategy,
        tactics = input$tactics,
        users = input$users,
        industry = input$industry
      )
      
      df <- df %>%
        pivot_longer(
          cols = business:industry,
          names_to = "dimension",
          values_to = "score"
        )
      
      df %>%
        mutate(dimension = factor(
          dimension,
          levels = unique(dimension),
          labels = str_to_title(unique(dimension))
        )) %>%
        ggplot(aes(x = dimension,
                   y = score)) +
        geom_col(fill = "red",
                 alpha = 1,
                 width = 1) +
        geom_hline(yintercept = seq(0, 5, by = 1),
                   color = "grey50",
                   size = 0.8) +
        geom_vline(
          xintercept = seq(1.5, 7.5, by = 2),
          color = "grey50",
          size = 0.8
        ) +
        coord_polar(clip = "off") +
        theme(
          panel.grid = element_blank(),
          panel.background = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.title = element_blank()
        ) +
        annotate(
          "segment",
          x = 0.5,
          xend = 0.5,
          y = -1,
          yend = 6.5,
          color = "black",
          size = 1.5
        ) +
        annotate(
          "segment",
          x = 2.5,
          xend = 2.5,
          y = -1,
          yend = 6.5,
          color = "black",
          size = 1.5
        ) +
        annotate(
          "segment",
          x = 4.5,
          xend = 4.5,
          y = -1,
          yend = 6.5,
          color = "black",
          size = 1.5
        ) +
        annotate(
          "segment",
          x = 6.5,
          xend = 6.5,
          y = -1,
          yend = 6.5,
          color = "black",
          size = 1.5
        ) +
        annotate(
          "text",
          x = .5,
          y = 0:5,
          label = c(0, 1, 2, 3, 4, 5),
          hjust = -1
        ) +
        annotate(
          "text",
          x = 2.5,
          y = 0:5,
          label = c(0, 1, 2, 3, 4, 5),
          vjust = -0.5
        ) +
        annotate(
          "text",
          x = 7.5,
          y = 5,
          label = "Know your Market",
          hjust = 1.5,
          vjust = -8,
          fontface = 2
        ) +
        annotate(
          "text",
          x = 1.5,
          y = 5,
          label = "Know your Product",
          hjust = -0.4,
          vjust = -8,
          fontface = 2
        ) +
        annotate(
          "text",
          x = 3.5,
          y = 5,
          label = "Know your Self",
          hjust = -0.7,
          vjust = 10,
          fontface = 2
        ) +
        annotate(
          "text",
          x = 5.5,
          y = 5,
          label = "Know your Craft",
          hjust = 1.6,
          vjust = 10,
          fontface = 2
        )
    })
  }
  
  # Run the application
  shinyApp(ui = ui, server = server)
  