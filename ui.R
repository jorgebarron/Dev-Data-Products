# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("European Option Price Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
          radioButtons("type", "Option Type: ",
                             c("Call" = "1",
                               "Put" = "2")),

          numericInput('stock', 'Spot price of the underlying asset: ', value = 1),
          numericInput('strike', 'Strike price of the underlying asset: ', value = 1),
          numericInput('time', 'Time to maturity in years: ', value = 1),
          numericInput('risk_free_rate', 'Risk-Free Interest Rate (in decimal format): ', value = 1),
          numericInput('sigma', 'Volatility (in decimal format): ', value = 1),
          
          actionButton("goButton", "Calculate")
    ),

    mainPanel(
          h3('European option (Black Scholes calculator)'),
          h1(' '),
          h1('__________ '),h1(' '),h1(' '),
          textOutput('var2'),
          h2(' '),
          h2(' '),
          h2(' '),
          h2(' '),
          textOutput('var')
      )
  )
))
