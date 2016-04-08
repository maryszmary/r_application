library(shiny)
library(ggplot2)
my_db = read.csv('all_words.csv',  encoding = "utf-8")

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("One thousand Most Frequently Used Words"),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             selectInput("lang",
                         "Choose language:",
                         c("All",
                           unique(as.character(my_db$language))))
      ),
      column(8, "Это приложение показывает 1000 самых частотных слов некоторых языков.
                 Данные основаны на материалах сайта http://www.101languages.net/common-words/.
                 Нельзя гарантировать, что данные собраны хорошо 
                 (процесс сбора данных на сайте не описан), ровно как и не стоит верить переводам.")
    ),
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)