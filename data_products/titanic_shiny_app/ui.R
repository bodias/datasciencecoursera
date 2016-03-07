#ui.R

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Test whether you would survive the sinking of the Titanic!"),
  
  sidebarPanel(
    h5("This sample app was built using on the Titanic dataset provided by the package 'datasets' in R."),
    h5("It uses a predictive model to predict whether a person would survive the sinking of the titanic based on the passenger details"),
    p(""),
    h4("Inform the passenger details below:"),
    p(""),
    selectInput("inputClass","Select the class ",c("1st","2nd","3rd","Crew"),selected = "1st"),
    radioButtons("inputSex","Sex ",c("Male","Female"),selected = "Male"),
    selectInput("inputAge","Age ",c("Adult","Child"),selected = "Adult"),
    actionButton("submitbtn","Submit!")
  ),
  
  mainPanel(
    h3("Result :"),
    h1(textOutput("prediction"))
  )
))