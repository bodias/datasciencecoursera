#server.R

library(shiny)
library(datasets)
library(caret)
library(randomForest)
library(e1071)

data("Titanic")
titanicdf <- data.frame(Titanic)
titanicdf <- titanicdf[,1:4]
model <- train(Survived ~ ., data=titanicdf,method="rf",trControl=trainControl(method="cv",number=5),prox=F)

surviveTitanic <- function(Class,Age,Sex) {

  inClass <- factor(Class,levels = c("1st","2nd","3rd","Crew"))
  inSex <- factor(Sex, levels = c("Male","Female"))
  inAge <- factor(Age, levels = c("Child","Adult"))
  
  input <- data.frame(Class=inClass,Sex=inSex, Age=inAge)
  prediction <- predict(model,input)

  if (prediction=="Yes"){
    return("You would have survived !")
  } 
  else{
    return("Ops, you would have the same sad ending as Jack :( ")
  }
}


shinyServer(
  function(input,output){
    output$prediction <- renderText({
      if (input$submitbtn>=1){
        isolate(surviveTitanic(input$inputClass,input$inputAge,input$inputSex))
      }
    })
  }
)