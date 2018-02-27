#functions
existsDiff <- function(x, y, title) {
  d1 <- as.numeric(x)
  d2 <- as.numeric(y)
  if(isGaussionDistribution(d1) == FALSE || isGaussionDistribution(d2) == FALSE || isGaussionDistribution(c(d1,d2)) == FALSE) {
    effectSize <- paste(round(vargha.delaney(d1,d2) * 100), sep = "", "%")
    pv <- wilcox.test(d1,d2)$p.value
    pvPrint <- ''
    valid <- FALSE
    if(is.nan(pv)) { 
      pvPrint  <- '-'
    }else if(pv < 0.001) {
      pvPrint<- '< 0,001'
    } else {
      pvPrint <- as.character(format(round(pv, digits = 4), nsmall = 4))
    }
    if(pv < 0.05) {
      valid = TRUE
    }
    print("--------------------------")
    print(pvPrint)
    print(effectSize)
    print(paste("Valid: ", valid))
    if(valid) {
      print(paste("There is difference ", title))
    } else {
      print(paste("Cannot say that there is difference ", title))
    }
    print("--------------------------")
  } else {
    print("--------------------------")
    print("Welch Test")
    pv <- t.test(d1,d2)$p.value
   # print(t.test(d1, d2));
    pvPrint <- ''
    valid <- FALSE
    if(is.nan(pv)) { 
      pvPrint  <- '-'
    }else if(pv < 0.001) {
      pvPrint<- '< 0,001'
    } else {
      pvPrint <- as.character(format(round(pv, digits = 4), nsmall = 4))
    }
    if(pv < 0.05) {
      valid = TRUE
    }
    print(pvPrint)
    print(paste("Valid: ", valid))
    d = cohenD(d1, d2)
    #Cohen, J. (1992), “A Power Primer”, Psychological Bulletin, 112, pp. 155-159
    interpretationEffectSize = "None"
    if(d >  0.20) {
      interpretationEffectSize = "small diff"
    }
    if(d >  0.50) {
      interpretationEffectSize = "medium diff"
    }
    if(d > 0.80) {
      interpretationEffectSize = "great diff"
    }
    print(interpretationEffectSize)
    if(mean(d1) > mean(d2)) {
      print("Effect size in favor d1")
    } else {
      print("Effect size in favor d2")      
    }
    print("--------------------------")
  }
  
  
}


cohenD <- function(data1, data2) {
     n1 <- length(data1);
     n2 <- length(data2);
     mean1 <- mean(data1);
     mean2 <- mean(data2);
     sd1 <- sd(data1);
     sd2 <- sd(data2);
     s <- sqrt(((n1 - 1) * sd1 * sd1 + (n2 - 1) * sd2 * sd2) / (n1 + n2 - 2));
     abs(mean1 - mean2) / s;
  }

# Vargha & Delaney's A12
vargha.delaney <- function(r1, r2) {
  m <- length(r1);
  n <- length(r2);
  return ((sum(rank(c(r1, r2))[seq_along(r1)]) / m - (m + 1) / 2) / n);
}

isGaussionDistribution <- function(distribution) {
  #Kolmogorov-Smirnov test
  ks1 <- ks.test(distribution, "pnorm", mean=mean(distribution), sd=sd(distribution))
  if(ks1$p.value < 0.05){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

library(ggplot2)
allData <- read.csv(file = "allBestAnswer.csv", header = TRUE, sep = ";")
expertData <- read.csv(file = "expert-best-answer.csv", header = TRUE, sep = ";")
nonExpertData <- read.csv(file = "nonExpertsBestAnswer.csv", header = TRUE, sep = ";")


step1 <- merge(x = allData, y = expertData, by = "periodAnswer", all.x = TRUE)
finalData <- merge(x = step1, y = nonExpertData, by = "periodAnswer", all.x = TRUE)

finalData[is.na(finalData)] <- 0

#finalData$expertsBestAnswer

yrange <- range(c( (finalData$expertsBestAnswer/finalData$numberUserBestAnswer), (finalData$nonExpertsBestAnswer/finalData$numberUserBestAnswer))) 
xrange <- range(finalData$periodAnswer)


png("fig2.png", width = 1000, height = 770, res = 230)
plot(xrange, yrange, xlab="Month", ylab="Probability of Best Answer", type = "n" )
#points(quantModulosRangeLNS, tempoRangeLNS, col="red")
lines(finalData$periodAnswer, (finalData$expertsBestAnswer/finalData$numberUserBestAnswer), col="red", lwd = 2.1)
lines(finalData$periodAnswer, (finalData$nonExpertsBestAnswer/finalData$numberUserBestAnswer), col="blue", lwd = 2.1)
legend(1, 0.65, legend=c("Experts", "Non-Experts"),
       col=c("red", "blue"), lty=1:1, cex=0.6)

dev.off()

existsDiff((finalData$expertsBestAnswer/finalData$numberUserBestAnswer), (finalData$nonExpertsBestAnswer/finalData$numberUserBestAnswer), "Prob. Best Answer Expert X Non Expert")




#finalData[, "Experts"] = round((finalData$expertsBestAnswer/finalData$numberUserBestAnswer), digits = 2)
#finalData[, "Others"] = round((finalData$nonExpertsBestAnswer/finalData$numberUserBestAnswer), digits = 2)
#finalData[, "Month"] = finalData$periodAnswer

#data = finalData[, c("Month", "Experts", "Others")]

#write.csv(data, file = "fig-2.csv", sep = ",",  row.names=FALSE, quote = FALSE)


