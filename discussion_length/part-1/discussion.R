#E. Discussion Length Analysis
options(warn=-1)

source("../../functions/Functions.R")

threadLen <- read.csv(file = "thread-len.csv", header = TRUE, sep = ";", dec = ",")

yrange <- range(threadLen$avgThreadLen)
xrange <- range(threadLen$monthid)
experts = subset(threadLen, threadLen$hasExp == 1)
nonExpert = subset(threadLen, threadLen$hasExp == 0)

png("fig3.png", width = 1000, height = 800, res = 230)
plot(xrange, yrange, xlab="Time Slice", ylab="Avg. Discussion Length", type = "n" )

lines(experts$monthid, experts$avgThreadLen, col="red", lwd = 2.1 )
lines(nonExpert$monthid, nonExpert$avgThreadLen, col="blue", lwd = 2.1)
legend(32, 3.5, legend=c("When a expert participe", "When no expert participe"),    col=c("red", "blue"), lwd = 4.1, lty=1:1, cex=0.5)


dev.off()

existsDiff(experts$avgThreadLen, nonExpert$avgThreadLen, "Expert thread Len X Non Expert thread Len" )
