library(MASS)
data(survey)
str(survey)

sprintf ("Variable Age has %d missing values", sum(is.na(survey$Age)))
x <- na.omit(survey$Age)

length(x)
range(x)  # returns min max

breaks <- seq(15, 75, by=5)
breaks

x.cut <- cut(x, breaks, right=FALSE) # using semi-open intervals
x.freq <- table(x.cut)
x.freq

cbind(x.freq) 

y <- x[x<70]	# drop the outliers
range(y)  
breaks <- seq(15, 45, by=5)
y.cut <- cut(x, breaks, right=FALSE)
y.freq <- table(y.cut)
cbind(y.freq) 

