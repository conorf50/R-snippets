library(MASS)
data(survey)

x <- na.omit(survey$Age)

breaks <- seq(15, 75, by=5)
x.cut <- cut(x, breaks, right=FALSE) # using semi-open intervals
x.freq <- table(x.cut)
x.freq

x.cumfreq = c(0, cumsum(x.freq)) 
x.cumfreq

cbind(breaks, x.cumfreq)






#
# Ogive
# 

png(filename="age_ogive.png", width=600, heigh=300)
plot(breaks, x.cumfreq,
  main="Student Age Distribution",  
  xlab="Age", ylab="Cumulative frequency")   
lines(breaks, x.cumfreq)
grid()
dev.off()


#
# Skewed and Ogive
# 

breaks <- seq(15, 45, by=5)
x <-na.omit(survey$Age[survey$Age<70])
y <- na.omit(60 - x)
range(y)

x.cut <- cut(x, breaks, right=FALSE) # using semi-open intervals
x.freq <- table(x.cut)
x.cumfreq = c(0, cumsum(x.freq)) 

y.cut <- cut(y, breaks, right=FALSE) # using semi-open intervals
y.freq <- table(y.cut)
y.cumfreq = c(0, cumsum(y.freq)) 

# Skewed

png(filename="ogive_positive_skew_hist.png", width=600, heigh=400)
hist(x, breaks=breaks, right=FALSE, col=colors[1],
     main="",  
     xlab="", ylab="Cumulative frequency")   
dev.off()
png(filename="ogive_negative_skew_hist.png", width=600, heigh=400)
hist(y, breaks=breaks, right=FALSE, col=colors[1],
     main="",  
     xlab="", ylab="Cumulative frequency")   
dev.off()

# Ogive

png(filename="ogive_positive_skew.png", width=600, heigh=400)
plot(breaks, x.cumfreq,
     main="",  
     xlab="", ylab="Cumulative frequency")   
lines(breaks, x.cumfreq)
grid()
dev.off()
png(filename="ogive_negative_skew.png", width=600, heigh=400)
plot(breaks, y.cumfreq,
     main="",  
     xlab="", ylab="Cumulative frequency")   
lines(breaks, y.cumfreq)
grid()
dev.off()
