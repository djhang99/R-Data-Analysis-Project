library(shiny)
library(ggplot2)
library(shinydashboard)
library(DT)

data <- read.csv(file = "./df.csv")

dashboardPage(
  
  #main title
  dashboardHeader(title=NULL),
  dashboardSidebar(
    
    #sidebar
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("home")),
      menuItem("Overview", tabName = "Info" ),
      menuItem("Charts", tabName = "Charts", icon = icon("bar-chart-o"),selected=T,
               menuSubItem("By Country", tabName = "subitem1"),
               menuSubItem("By Age Group", tabName = "subitem2")),
      menuItem("Data", tabName = "Data", icon = icon("table") )
    )

  ),
  #body of each tab
  body <- dashboardBody(
    tabItems(
      tabItem("Dashboard",div(p("Dashboard tab content"))),
      tabItem("Home",
              h1("Suicide Analysis"),
              h4("A deeper look of 51 countries and how suicides have trended from 2002-2015"),
              img(src = "mentalhealth.png", height = 500, width = 500),
              br(),
              br(),
              h3("Project Description"),
              h5("Mental Health is rapidly growing worldwide and has in the past few years recently hit mainstream media. I wanted to take a closer look into the suicide rates to see if there was a way to measure and quantify that growth and see which age group, gender, country/region are experiencing the most rapid growth."),
              h3("Goals"),
              h5("Suicide prevention is a multi-sector issue. It involves health care professionals, government welfare, politicans and expands all the way to patients, caregivers and family members. I wanted to better understand the data presented to help visually represent this issue so that it could spread awareness to all these involved parties.")
              ),
      tabItem("Info",
              h1("Overview on Analysis"),
              h4("This page will describe some general description and information about the analysis"),
              br(),
              h3("About the Data"),
              h5("Dataset from Kaggle:"),
              a("Kaggle Dataset", href="https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016"),
              h5(tags$li("Time Period = 1985-2016")),
              h5(tags$li("Data compiled by = World Bank, World Health Organization (WHO)")),
              h3("Data Scrapping (Subset Information)"),
              h5(tags$li("Time Period shortened to 2002-2015")),
              h5(tags$li("Total of 51 countries")),
              h5(tags$li("Data split by gender (Male/Female)")),
              h5(tags$li("Data split by age group: (5-14), (15-24), (25-34), (35-54), (55-74), and (75+)")),
              h3("Definitions"),
              h5("What is Mental Health?"),
              a("MentalHealth.gov", href="https://www.mentalhealth.gov/basics/what-is-mental-health"),
              h5("'Mental health includes our emotional, psychological, and social well-being. It affects how we think, feel, and act. It also helps determine how we handle stress, relate to others, and make choices. Mental health is important at every stage of life, from childhood and adolescence through adulthood.'"),
              h3("If you or anyone you know needs help"),
              h5("National Institute of Mental Health:"),
              a("link", href="https://www.nimh.nih.gov/health/find-help"),
              h3("National Suicide Prevention Lifeline:"),
              h5("Call 1-800-273-TALK (8255)"),
              ),
      tabItem("Charts"),
      tabItem("subitem1",
              selectInput(inputId = "sel_country", label = "Choose Country", c(data$country) ),
              plotOutput("country_plot"),
              ),
      tabItem("subitem2",
              selectInput(inputId = "sel_age", label = "Choose Age Group", c(data$country) ),
              plotOutput("age_plot"),
              ),
      tabItem("Data",
              fluidPage(
                h1("Data Set (Suicide Rates from 2002-2005"),
              dataTableOutput("datatable")                  
              )
    )
)
)
)
