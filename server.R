library("shiny")
library("shinyapps")
library("e1071")
library("RColorBrewer")

shinyServer(function(input, output) {

TableInput <- reactive({
  switch(input$select,
          "Dataset" = Dataset1,
         "Transforming Text"=Displaymatrix,
         "Frequency and Associations"=Displayfreq)
})



textInput=reactive({
    switch(input$select,
           "Introduction"=1,"Dataset"= 2, "Method"= 3,
           "Transforming Text"=4,"Frequency and Associations"=5,
           "Clustering"=6,"KNN"=7,"Discussion"=8,"Reference"=9)
  })

output$text<- renderImage({
    filename <- normalizePath(file.path('./Doc',paste('doc',textInput(), '.png', sep='')))
    list(src = filename)
}, deleteFile = FALSE)

output$image <- renderImage({
filename <- normalizePath(file.path('./images',paste('image', textInput(), '.png', sep='')))
 list(src = filename)
}, deleteFile = FALSE)

output$code<- renderImage({
  filename <- normalizePath(file.path('./code',paste('code', textInput(), '.png', sep='')))
  list(src = filename)  
}, deleteFile = FALSE)

output$kmeans=renderPrint({
  if(input$ktable){  
    input$go
    ks(isolate(input$words))}
})

output$Plot=renderPlot({
  if(input$WordCloud)
  { input$goButton
    asso_cloud("isolate(as.character(input$word))")}
 })

output$table=renderTable({
  head(TableInput(),n=input$obs)
})

output$tabletext=renderPrint({
 if (input$select=="KNN"){(confusionMatrix(result1,testCl))}
})
})  
