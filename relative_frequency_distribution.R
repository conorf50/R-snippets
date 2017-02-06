library(MASS)
data(survey)

x <- na.omit(survey$Age)

breaks <- seq(15, 75, by=5)
x.cut <- cut(x, breaks, right=FALSE) # using semi-open intervals
x.freq <- table(x.cut)
x.freq

x.relfreq <- x.freq / length(x)
x.relfreq

old = options(digits=1)    # limit number of digits 
cbind(x.freq, x.relfreq)
options(old)               # restore the old option


###
### Example: Hand Span for Writing vs Non-writing Hands
### 

# comparision of pulse rate for right-handed vs left-handed 

tmp <- na.omit(survey[c("Pulse", "W.Hnd")])
pulseRightHanded <- subset(tmp, W.Hnd=="Right")$Pulse
pulseLeftHanded <- subset(tmp, W.Hnd=="Left")$Pulse

png(filename="pulse_writing_hand_relfreq.png", width=600, heigh=400)
par(mfrow=c(2,1))

g <- hist(pulseRightHanded, xlim=c(35,110), ylim=c(0,0.035),
          col=colors[1], probability=TRUE, 
          main=sprintf("Pulse of Right-handed Students (n=%d)", 
                       length(pulseRightHanded)),
          xlab="Pulse (beats per minute)")
text(g$mid, g$density+0.001, labels=sprintf("%.1f%%",100*g$counts/176))

g <- hist(pulseLeftHanded, xlim=c(35,110), ylim=c(0,0.035),
          col=colors[1], fprobability=TRUE, 
          main=sprintf("Pulse of Left-handed Students (n=%d)",
                       length(pulseLeftHanded)),
          xlab="Pulse (beats per minute)")
text(g$mid, g$counts+2, labels=g$counts)
dev.off()
