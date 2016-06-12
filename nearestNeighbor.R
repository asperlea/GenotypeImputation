nearestNeighbor <- function(x, data) {
  maxmatch <- 0
  idx <- 0
  for (i in c(1:nrow(data))) {
    nmatch <- length(which(x == data[i,]))
    if (nmatch > maxmatch) {
      maxmatch <- nmatch
      idx <- i
    }
  }
  return(data[i,])
}

print("Reading training data . . .")
SNPdata <- t(read.table("imputation_training.txt", header = TRUE, sep=" "))
print("Done.")

trainingData <- SNPdata[c(1:120),]
testingData <- SNPdata[c(121:135),]


numSNPs <- 10000
accuraciesNN <- c()
for (i in c(1:numSNPs)) {
  testingCopy <- testingData
  testingCopy[,i] <- rep(-1, nrow(testingCopy))
  predictions <- matrix(nrow = nrow(testingCopy), ncol = ncol(testingCopy))
  for (j in c(1:nrow(testingCopy))) {
    predictions[j,] <- nearestNeighbor(testingCopy[j,], trainingData)
  }

  accuracy <- length(which(testingData[,i] == predictions[,i])) / 15
  print(paste("SNP: ", i))
  print(accuracy)
  accuraciesNN <- c(accuraciesNN, accuracy)
}