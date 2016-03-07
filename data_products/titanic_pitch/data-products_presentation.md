Titanic Survival Test
========================================================
author: Braian O. Dias
date: 06-Mar-2016
transition: rotate

<small>
- Predict whether a person would survive based on parameters.
- Coursera Data Products Course Project.
</small>

========================================================

Would you survive the sinking of the Titanic?
Based on the passenger data it's actually possible to predict whether you would have survived.

- Uses a machine learning algorithm to predict the result
- Easy to use, just a few details about the passenger

Check it out!

https://bodias.shinyapps.io/titanic_shiny_app/

Underlying magic
========================================================

Based on the Titanic dataset provided by the package 'datasets' in R, the Machine Learning algorithm predicts the result of your trip at Titanic.

- Uses random forests algorithm with cross validation
- Gives you the most likely result 
- Very fast
- Accuracy rely on the dataset provided (enough to have fun :) )




Training step
========================================================

ML training step using data from the "datasets" package


```r
data("Titanic")

titanicdf <- data.frame(Titanic)
titanicdf <- titanicdf[,1:4]
model <- train(Survived ~ ., data=titanicdf,method="rf",trControl=trainControl(method="cv",number=5),prox=F)
```

How to use
========================================================

To test whether you would have survived this tragic event, simply go to :
- https://bodias.shinyapps.io/titanic_shiny_app/
- Inform the class where you would be on the ship (1st,2nd, 3rd Class or Crew Member)
- Inform your Gender
- Inform your age group (Adult or Child)

Have fun!
