# import gase bill and store into gb
gb <- read.table(file="gas.txt",header = TRUE)
# import electricity bill and store into eb
eb <- read.table(file="electricity.txt",header = TRUE)
svg(filename = "Billing.svg",width = (1365*7)/767.0)
par(mfrow=c(2,2))
plot(ts(eb$Units,frequency=12,start=c(2014,9)),main="Electricity unit consumption",
     xlab="Time from 01/09/2014 onward",ylab="Units consumed each months")
grid()
plot(ts(gb$HM3,frequency=12,start=c(2014,10)),main="Gas Units consumed",
     xlab="Time from 01/10/2014 onward",ylab="Gas: in cubic Hectometer consumed")
grid()

plot(ts(eb$Units*eb$Cost,frequency=12,start=c(2014,9)),main="Electricity Bill in rupees",
     xlab="Time from 01/09/2014 onward",ylab="Rupees")
grid()
plot(ts(gb$Cost,frequency=12,start=c(2014,10)),main="Gas Bill in rupees",
     xlab="Time from 01/10/2014 onward",ylab="Rupees")
grid()

dev.off()
# setting graphical parameters to default after finishing job
#par(mfrow=c(1,1))