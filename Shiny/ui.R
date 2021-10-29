library(shiny)
library(ggplot2)
library(shinydashboard)

dashboardPage(
  #main title
  dashboardHeader(title='Dashboard'),
  dashboardSidebar(
    
    #sidebar
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("home")),
      menuItem("Overview", tabName = "Info" ),
      menuItem("Report", tabName = "Report", icon = icon("bar-chart-o"),selected=T,
               menuSubItem("Analysis", tabName = "subitem1"),
               menuSubItem("Conclusion", tabName = "subitem2")),
      menuItem("Data", tabName = "Data", icon = icon("table") )
    )
    
    

  ),
  #body of each tab
  body <- dashboardBody(
    tabItems(
      tabItem("Dashboard",div(p("Dashboard tab content"))),
      tabItem("Home","Homepage"),
      tabItem("Overview","About the project explain it here"),
      tabItem("Report","Charts Tab"),
      tabItem("subitem1","Charts and Graphs - Interactive if possible"),
      tabItem("subitem2","Some sort of conclusion"),
      tabItem("subitem2","Some sort of conclusion"),
      
      tabItem("Data",dataTableOutput("data"))
    )
)
)
