install.packages("shiny")

library(shiny)


##############################################################BASIC RSHINY PLOT ###############################################################

# Creating a plot which plots the histogram for different samples of random normal variables ranging from 1 value to 10000 values

# Building the User Interface
ui<-fluidPage(
  sliderInput(inputId = "hist_sample",
              label = "Choose the sample value",
              value = 1,
              min = 1,
              max = 10000),
  plotOutput(outputId = "hist_plot")
)

# Writing down the server instructions for the app to follow
server<-function(input, output){
  output$hist_plot<-renderPlot({
    set.seed(12383301)
    a<-rnorm(input$hist_sample)
    title<-paste("Histogram with", input$hist_sample, "samples", sep = " ")
    hist(a, breaks = 30, probability = TRUE, main = title)
    lines(seq(min(a)-3, max(a)+3, length.out = 10000), dnorm(seq(min(a)-3, max(a) + 3, length.out = 10000), mean = mean(a), sd=sd(a)))
    
  })
}

# knitting the UI and Server components
shinyApp(ui=ui, server = server)


