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
      menuItem("Conclusion", tabName = "conclusion"),
      menuItem("About me", tabName = "about"),
      menuItem("Raw Data", tabName = "Data", icon = icon("table") )
    )

  ),
  #body of each tab
  body <- dashboardBody(
    tabItems(
      tabItem("Dashboard",div(p("Dashboard tab content"))),
      
      #Home tab (Background information)
      tabItem("Home",
              h1("Suicide & Mental Health Crisis"),
              h4("A deeper look of 51 countries and how suicides has trended from 2002-2015"),
              img(src = "mentalhealth.png", height = 500, width = 500),
              br(),
              br(),
              h3("What is Mental Health?"),
              a("MentalHealth.gov", href="https://www.mentalhealth.gov/basics/what-is-mental-health"),
              h5(HTML("'Mental health includes our emotional, psychological, and social well-being. It affects how we think, feel, and act. It also helps  <br/> determine how we handle stress, relate to others, and make choices. Mental health is important at every stage of life, from <br/> childhood and adolescence through adulthood.'")),
              h3("Why Mental Health?"),
              h5(HTML("Mental Health has in the past few years recently gained attention in the media here in the US.  It has greatly impacted atheletes, <br/> actors/actresses and many influencers. I wanted to take a closer look into the suicide rates worldwide to see what the numbers <br/> were saying.  This analysis will target suicides in 51 nations, 6 different age group, and 2 different gender categories")),
              h3("If you or anyone you know needs help:"),
              h5("National Institute of Mental Health:"),
              a("link", href="https://www.nimh.nih.gov/health/find-help"),
              h3("National Suicide Prevention Lifeline:"),
              h5("Call 1-800-273-TALK (8255)"),
              ),
      
      #Overview tab (Research Question/Business Need)
      tabItem("Info",
              h1("A Brief Introduction"),
              h4("Reasons for this analysis and the goals for this report"),
              h3("Target Audience:"),
              h5(HTML("Suicide is a multi-sector issue. It involves health care professionals, all branches of governments, politicians, and expands all the <br/> way to patients, caregivers and family members.  This also impacts any workplace and touches athletes or anyone dealing <br/> with pressures from social media.")),
              h3("Goals:"),
              h5(HTML("To spread awareness on Mental Health and to provide statistical insight on the topic.  This has recently come into the public's eye <br/> and not enough emphasis on cold hard facts have been stated.  'Is it an issue?', 'How bad is it?', 'Is it only within the uS?'. <br/>  These are all valid questions and I hope to shed some answers with data to backup my reasoning.")),
              h3(HTML("<u>About the Data</u>")),
              h4("Dataset from Kaggle:"),
              img(src = "kaggle.png"),
              br(),
              a("Kaggle Dataset", href="https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016"),
              h5(tags$li("Time Period = 1985-2016")),
              h5(tags$li("Data compiled by = World Bank, World Health Organization (WHO)")),
              img(src = "who.png"),
              br(),
              h4("Data Scrapping:"),
              h5(tags$li("Time Period shortened to 2002-2015")),
              h5(tags$li("Total of 51 countries")),
              h5(tags$li("Data split by gender (Male/Female)")),
              h5(tags$li("Data split by age group: (5-14), (15-24), (25-34), (35-54), (55-74), and (75+)")),
              br(),
              h4("Key Data Points:"),
              h5(tags$li("population: (population for that group)")),
              h5(tags$li("suicide_no: (the # of suicides for that group)")),
              h5(tags$li("gdp_per_year: (gdp for that year for the country)")),
              h5(tags$li("gdp_per_capita: (gdp per capita for that year for the country)")),
              ),
      
      # Charts tab (Analysis/Discussion/Results)
      tabItem("Charts"),
      tabItem("subitem1",
              selectInput(inputId = "sel_country", label = "Choose Country", c(data$country) ),
              plotOutput("country_plot"),
              ),
      tabItem("subitem2",
              selectInput(inputId = "sel_age", label = "Choose Age Group", c(data$country) ),
              plotOutput("age_plot"),
              ),

      # Conclusion tab (conclusion/future work/next steps)
      tabItem("conclusion",
              h1(HTML("<u>Final Thoughts</u>")),
              h5(tags$li("My conclusion")),
              h5(tags$li("Future work/Next steps")),
              img(src = "think.jpg"),
              h3("Conclusion"),
              h5(HTML("Mental Health has in the past few years recently gained attention in the media here in the US.  It has greatly impacted atheletes, <br/> actors/actresses and many influencers. I wanted to take a closer look into the suicide rates worldwide to see what the numbers <br/> were saying.  This analysis will target suicides in 51 nations, 6 different age group, and 2 different gender categories")),
              
              h3("Conclusion"),
              h5(HTML("Mental Health has in the past few years recently gained attention in the media here in the US.  It has greatly impacted atheletes, <br/> actors/actresses and many influencers. I wanted to take a closer look into the suicide rates worldwide to see what the numbers <br/> were saying.  This analysis will target suicides in 51 nations, 6 different age group, and 2 different gender categories")),
              
      ),
      
            
      #Overview tab
      tabItem("about",
              h1("About me"),
              img(src = "profile.jpg", height = "27%", width = "27%"),
              h5(tags$li(HTML("<u>Name:</u>"))),
              h5("David Jhang"),
              h5(tags$li(HTML("<u>Location:</u>"))),
              h5("New York"),
              h5(tags$li(HTML("<u>Background:</u>"))),
              h5("Finance and Data Science"),
              h5(tags$li(HTML("<u>Social Media:</u>"))),
              a("LinkedIn", href="https://www.linkedin.com/in/djhang/"),
              h5(tags$li(HTML("<u>Contact:</u>"))),
              a("Email Link", href="mailto:david.jhang@gmail.com"),
              ),
      
      # tab for raw data
      tabItem("Data",
              fluidPage(
                h1("Data Set (Suicide Rates from 2002-2005"),
              dataTableOutput("datatable")                  
              )
    )
)
)
)
