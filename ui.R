library("shiny")
library(shinyapps)
library("e1071")
library("RColorBrewer")

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("STA 250 Final Project" ),
  
    sidebarPanel(
    radioButtons("select", "Content:", 
                choices = c("Introduction", "Dataset","Method","Transforming Text","Frequency and Associations","Clustering","KNN","Discussion","Reference")),
    numericInput("obs","Number of Obervations to view in Table",5),
    checkboxInput("WordCloud", "Word Cloud (view in Graph set)",TRUE),
    textInput("word","Enter a word here to see the Word Cloud", "happy"),
    actionButton("goButton", "Go"),
    checkboxInput("ktable", "K-means Clustering (view in Table set)"),
    numericInput("words","Choose the number of top frequent words you want to see ",3),
    actionButton("go", "next")
    ),

mainPanel(
  
tabsetPanel(id="select2",
              tabPanel("Readme", imageOutput("text")),
              tabPanel("Graph", imageOutput("image"),plotOutput("Plot")),
              tabPanel("Table", tableOutput("table"),verbatimTextOutput("kmeans"),verbatimTextOutput("tabletext")),
              tabPanel("R-code", imageOutput("code"))))
))




