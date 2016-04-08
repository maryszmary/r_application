library(shiny)
library(ggplot2)

my_db = read.csv('all_words.csv',  encoding = "UTF-8")

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- my_db
    if (input$lang != "All") {
      data <- data[data$language == input$lang,]
    }
    data
  }))
  
})
