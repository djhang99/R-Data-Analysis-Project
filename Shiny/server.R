library(shiny)
library(dplyr)
library(ggplot2)


server <- shinyServer(function(input, output, session) {
  
  # set working directory and load csv file
  data <- read.csv(file = "./df.csv")

  #creating subset dataframe for country graph
  chart2 <- reactive({
    req(input$sel_country)
    
    country_df = data %>% 
      filter(country %in% input$sel_country) %>%
      group_by(year, country) %>%
      summarise(yearly_suicides = sum(num_suicides), gdp_cap = mean(gdp_per_capita))
  })

  #creating subset dataframe for age graph
  chart3 <- reactive({
    req(input$sel_age)
    
    age_df = data %>% 
      filter(country %in% input$sel_age) %>%
      group_by(year, age) %>%
      summarise(yearly_suicides = sum(num_suicides), gdp_cap = mean(gdp_per_capita))
  })

  #creating subset dataframe for age graph
  chart4 <- reactive({
    req(input$sel_gdp)
    
    data1 = data %>%
    group_by(country, year) %>%
    summarise(gdp_per_capita = mean(gdp_per_capita), total_suicides=round(sum(num_suicides),2))
    
    gdp_df = data1 %>% 
      filter(country %in% input$sel_gdp) %>%
      group_by(year) 
  })  

  #creating subset dataframe for gender graph
  chart5 <- reactive({
    req(input$sel_gender)
    
    gender_df = data %>% 
      filter(country %in% input$sel_gender) %>%
      group_by(year, sex) %>%
      summarise(yearly_suicides = sum(num_suicides), yearly_pop= sum(population), gdp_cap=mean(gdp_per_capita))
  })
  
  
  # Interactive Chart for "country graph" Tab 
  output$country_plot <- renderPlot({
    ggplot(chart2(), aes(x = year, y = yearly_suicides, color= yearly_suicides)) +
      geom_point() +
      geom_line() +
      xlim(2002,2016) +
      labs(title = "Yearly Suicides", x = "Year", y = "# of Suicides") + 
      theme(legend.position = "none")
    
  })
  
  # Interactive Chart for "age graph" Tab 
  output$age_plot <- renderPlot({
    ggplot(chart3(), aes(x = age, y = yearly_suicides, fill = age)) +
      geom_boxplot() +
      geom_jitter(shape = 15,
                  color = "steelblue",
                  position = position_jitter(0.21)) +
      labs(title = "Yearly Suicides by Age Group", x = "Age Group", y = "# of suicides (yearly)") +
      theme_classic()  
  })
  
  # Interactive Chart for "gdp graph" Tab 
  output$gdp_plot <- renderPlot({
    ggplot(chart4(), aes(x = total_suicides, y = gdp_per_capita, color= total_suicides)) +
      geom_point() +
      geom_line() +
      labs(title = "Yearly # of Suicides vs Yearly GDP", x = "Yearly Suicides", y = "GDP (per capita)") +
      theme(legend.position = "none")
  })

  # Interactive Chart for "gender graph" Tab 
  output$gender_plot <- renderPlot({
    ggplot(chart5(), aes(x=year, y=yearly_suicides, fill=sex)) + 
      geom_bar(stat="identity", position=position_dodge()) +
      labs(title = "Male vs Female Breakdown", x = "Year", y = "# of suicides")
  })
  
  
  # Data Table for "Data" Tab
  output$datatable <- renderDataTable(data)
})
