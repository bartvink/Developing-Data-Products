library(shiny)
library(splines)

Data <- readRDS("WebScrapeRenaultCars.Rda")

shinyUI(
        pageWithSidebar(
        headerPanel("Residual value model Renault"),
        
        sidebarPanel(
                selectInput("model", "model", choices = (Data$Type), multiple = FALSE, selected = ""),
                numericInput("kilometers", "kilometers", value = 15000, min = 0, step = 5000),
                numericInput("age", "age", value = 365, min = 0, step = 365)
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel('Results',
                                 h4('Your model of choice'),
                                 verbatimTextOutput('model'),
                                 h4('Odometer reading'),
                                 verbatimTextOutput('kilometers'),
                                 h4('Age of the car in days'),
                                 verbatimTextOutput('age'),
                                 h4('Residual value'),
                                 verbatimTextOutput('ResidualValue')
                        )
                )
        )
))

