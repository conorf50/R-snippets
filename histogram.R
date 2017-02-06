library(MASS)
data(survey)

colors <- c("thistle", "powderblue", "khaki1", " wheat", "lightgreen", "plum2", "paleturquoise", "tan")

png(filename="histogram.png", width=600, heigh=400)
hist(survey$Age, right=FALSE, col=colors, 
  main="Student Age Distribution", 
  xlab="Student Age", ylab="Frequency")
dev.off()

# effect of breaks
png(filename="histogram_breaks_few.png", width=600, heigh=400)
breaks = seq(15, 75, by=20)    # too few classes
hist(survey$Age, right=FALSE, col=colors, breaks=breaks,
  main="Student Age Distribution", 
  xlab="Age", ylab="Frequency")
dev.off()
png(filename="histogram_breaks_many.png", width=600, heigh=400)
breaks = seq(15, 75, by=.2)   # too many classes
hist(survey$Age, right=FALSE, col=colors, breaks=breaks,
  main="Student Age Distribution", 
  xlab="Age", ylab="Frequency")
dev.off()

# removing outliers
png(filename="histogram_no_outliers.png", width=600, heigh=400)
x <- survey$Age[survey$Age<70]
breaks = seq(15,45, by=2)
g <- hist(x, right=FALSE, col=colors, breaks=breaks,
  main="Student Age Distribution (with 2 outliers (Age>70) removed)", 
  xlab="Age", ylab="Frequency", ylim=c(0,150))
text(g$mid, g$counts+5, labels=g$counts)
dev.off()



###
### Example: Hand Span for Writing vs Non-writing Hands
### 

# compare follow two code blocks

writingHandSpan <- na.omit(survey$Wr.Hnd)
nonwritingHandSpan <- na.omit(survey$NW.Hnd)

tmp <- na.omit(survey[c("Wr.Hnd", "NW.Hnd")])
writingHandSpan <- tmp$Wr.Hnd
nonwritingHandSpan <- tmp$NW.Hnd

png(filename="hand_span_01.png", width=600, heigh=400)
# draw two diagrams (using 2 rows and 1 column)
par(mfrow=c(2,1))

g <- hist(writingHandSpan, col=colors)
text(g$mid, g$counts+10, labels=g$counts)
g <- hist(nonwritingHandSpan, col=colors)
text(g$mid, g$counts+10, labels=g$counts)
dev.off()

png(filename="hand_span_02.png", width=600, heigh=400)
par(mfrow=c(2,1))

g <- hist(writingHandSpan, col=colors[1],
  xlim=c(12,24), ylim=c(0,72), 
  main="Comparision of writing and nonwriting hand spans")
text(g$mid, g$counts+10, labels=g$counts)
g <- hist(nonwritingHandSpan, col=colors[1],
  xlim=c(12,24), ylim=c(0,72), 
  main="")
text(g$mid, g$counts+10, labels=g$counts)
dev.off()








###
### Example: Hand Span for Writing vs Non-writing Hands
### 

# comparision of pulse rate for right-handed vs left-handed 

pulseRightHanded <- na.omit(survey$Pulse[survey$W.Hnd=="Right"])
pulseLeftHanded <- na.omit(survey$Pulse[survey$W.Hnd=="Left"])

tmp <- na.omit(survey[c("Pulse", "W.Hnd")])
pulseRightHanded <- subset(tmp, W.Hnd=="Right")$Pulse
pulseLeftHanded <- subset(tmp, W.Hnd=="Left")$Pulse

png(filename="pulse_writing_hand.png", width=600, heigh=400)
par(mfrow=c(2,1))

g <- hist(pulseRightHanded, xlim=c(35,110), ylim=c(0,85),
  col=colors[1],
  main=sprintf("Pulse of Right-handed Students (n=%d)", 
    length(pulseRightHanded)),
  xlab="Pulse (beats per minute)")
text(g$mid, g$counts+15, labels=g$counts)

g <- hist(pulseLeftHanded, xlim=c(35,110), ylim=c(0,10),
  col=colors[1],
  main=sprintf("Pulse of Left-handed Students (n=%d)",
    length(pulseLeftHanded)),
  xlab="Pulse (beats per minute)")
text(g$mid, g$counts+2, labels=g$counts)
dev.off()


