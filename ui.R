shinyUI(pageWithSidebar(
  headerPanel("Predicting Old faithful eruptions"),
  sidebarPanel(
    h3("Please enter the time that you anticipate to wait for the eruption."),
    sliderInput("obs", "Party Size:",min = 30, max = 100, value = 50),
    h3("Predicted eruption duration is"),
    verbatimTextOutput("val")
  ),
  mainPanel(
    plotOutput('plot')
  )
))