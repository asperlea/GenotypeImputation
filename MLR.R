Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

library(glmnet)

numSNPs <- 10000
LDsize <- 20
baselines <- c()
mymethod <- c()
for (i in c(1:numSNPs)) {
  print(paste("SNP ", i))
  trainingIndexes<-c()
  if (i < 11) {
    trainingIndexes <- c(1:(LDsize + 1))[-i]
  } else if (i > (numSNPs - (LDsize / 2))) {
    trainingIndexes <- c((numSNPs - LDsize):numSNPs)[-i]
  } else {
    trainingIndexes <- c((i-(LDsize / 2)):(i+(LDsize / 2)))[-(LDsize / 2 + 1)]
  }
  trainingDataSNP <- cbind(trainingData[,trainingIndexes], trainingData[,i])
  x <- trainingDataSNP[, -(LDsize + 1)]
  y <- as.factor(trainingDataSNP[, (LDsize + 1)])
  #collapse classes that have two few samples into other classes
  if (length(which(y == 0)) < 10) {
    y[which(y == 0)] = 1
  }
  if (length(which(y == 1)) < 10) {
    y[which(y == 1)] = 2
  }
  if (length(which(y == 2)) < 10) {
    y[which(y == 2)] = 1
  }
  y <- factor(y)

  print("Training model . . .")
  modelOutput = tryCatch({
    model <- cv.glmnet(x, y, family="multinomial")
    testingDataSNP <- testingData[,trainingIndexes]
    predictions<-predict(model, testingDataSNP, type="response", s=c("lambda.1se", "lambda.min"))
    results=c()
    for (j in c(1:15)) {
      results<-c(results,names(which(predictions[j,,] == max(predictions[j,,]))))
    }
    results<-as.integer(results)
    print(length(results))
    print(length(testingData[,i]))
    accuracy<-length(which(testingData[,i] == results))/15
    mymethod<-c(mymethod, accuracy)
    print(paste("My accuracy", accuracy))
    
    baselineResults<-Mode(y)
    baselineAccuracy<-length(which(testingData[,i] == baselineResults))/15
    baselines<-c(baselines, baselineAccuracy)
    print(paste("Base accuracy", baselineAccuracy))
  }, error = function(e) {print("Not enough samples")})
  print("Done.")
}
