plot(model)

hist(mymethod, xlab = "MLR Accuracy", ylab = "Frequency", main = paste("Histogram of MLR Accuracy"))
hist(baselines, xlab = "Mode Accuracy", ylab = "Frequency", main = paste("Histogram of Mode Accuracy"))
hist(accuraciesNN, xlab = "Nearest Neighbor Accuracy", ylab = "Frequency", main = paste("Histogram of Nearest Neighbor"))

plot(c(1:100), mymethod[sampleSNPS], xlab="SNP", ylab="Accuracy", type="p", ylim=c(0,1))
points(c(1:100), baselines[sampleSNPS], col="red", type="p")
points(c(1:100), accuraciesNN[sampleSNPS], col="blue", type="p")
legend("bottomright", c("MLR", "Mode", "Nearest Neighbor"), lty=c(1,1), col=c("black", "red", "blue"))
legend("bottomright", c("MLR", "Mode", "Nearest Neighbor"), lty=c(0,1), col=c("black", "red", "blue"))
legend("bottomright", c("MLR", "Mode", "Nearest Neighbor"), lty=c(2,2), col=c("black", "red", "blue"))
legend("bottomright", c("MLR", "Mode", "Nearest Neighbor"), pty=c(1,1), col=c("black", "red", "blue"))