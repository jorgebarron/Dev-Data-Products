
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(
      function(input, output) {
            
            
            
                                        
                                        
                                       
            output$var <- renderText({
                  input$goButton
                  stock <- isolate(as.numeric(input$stock))
                  strike <- isolate(as.numeric(input$strike))
                  time <- isolate(as.numeric(input$time))
                  risk_free_rate <- isolate(as.numeric(input$risk_free_rate))
                  sigma <- isolate(as.numeric(input$sigma))
                  d1 <-  ((log(stock/strike) + (risk_free_rate + 0.5 * sigma*sigma) *
                                           time) / (sigma * sqrt(time) ))
                  d2 <- ( d1 - sigma * sqrt(time ))
                  call_price =  ( stock * pnorm(d1) - strike * exp(-risk_free_rate*time)  * pnorm(d2) )
                  put_price =  ( -stock * pnorm(-d1) + strike * exp(-risk_free_rate*time)  * pnorm(-d2) )
                  if (isolate(as.numeric(input$type)) == 1) {
                       # isolate(paste(call_price)) 
                        isolate(paste( call_price)) }
                  else {
                        isolate(paste(put_price)) }
            })
            
            output$var2 <- renderText({ 
                        input$goButton
                        if (isolate(as.numeric(input$type)) == 1) {
                              isolate(paste('Price of a European Option Call: ')) }
                        else {
                              isolate(paste('Price of a European Option Put: ')) }
            
            })
            
  }
)
