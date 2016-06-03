library(splines)

RenaultPriceModel = lm(Price ~ ns(Kilometers, df = 5 ) * model + ns(Age, df = 3),
                       data = data)

RenaultScorer = function(Kilometers, Age, model)
{
        require(splines)
        return(
                predict.lm(
                        RenaultPriceModel, 
                        data.frame("Kilometers" = Kilometers, "Age" = Age, "model" = model)
                )
        )
}

shinyServer(
        function(input, output) {
                output$kilometers       <- renderPrint({input$kilometers})
                output$age              <- renderPrint({input$age})
                output$model            <- renderPrint({input$mdoel})
                output$ResidualValue    <- renderPrint({RenaultScorer(input$kilometers, input$age, input$model)})
                }
        )
