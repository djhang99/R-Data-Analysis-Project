library(shiny)
library(dplyr)
library(ggplot2)


server <- shinyServer(function(input, output, session) {
  # set working directory and load csv file
  knitr::opts_chunk$set(root.dir = normalizePath("C:/Users/David Jhang/Desktop/NYC Data Academy/Project 2"))
  data <- read.csv(file = "/Project 2/df.csv")
  
  colscale <- c(semantic_palette[["red"]], semantic_palette[["green"]], semantic_palette[["blue"]])
  mtcars$am <- factor(data$num_suicides,levels=c(0,1),
                      labels=c("Automatic","Manual"))
  output$boxplot1 <- renderPlot({
    ggplot(data, aes(x = gender, y = num_suicides)) +
      geom_boxplot(fill = semantic_palette[["green"]]) + 
      xlab("gearbox") + ylab("Miles per gallon")
  })
  
  output$carstable <- renderDataTable(data)
})