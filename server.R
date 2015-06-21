shinyServer(
  function(input, output) {
    library(caret)
    data(faithful) 
    set.seed(333)
    inTrain <- createDataPartition(y=faithful$waiting,p=0.5, list=FALSE)
    trainFaith <- faithful[inTrain,] 
    testFaith <- faithful[-inTrain,]
    lm1 <- lm(eruptions ~ waiting,data=trainFaith)
  
    data1 <- reactive({  
      i1 <- input$obs
      i1
    })
    data2 <- reactive({  
      i2 <- lm1$coef[1]+lm1$coef[2]*input$obs
      i2
    })
    output$val <- renderPrint({data2()[1]})
    output$plot <- renderPlot({    
      plot(eruptions ~ waiting, data = trainFaith, pch=19)
      abline(coef(lm1), col="blue")
      points(data1(),data2(), col ="red", pch=19)
      })
    } 
)