# Author: Zaeem Yousaf
# Data taken: By himself
# Date: 21-10-2016
#-----------------------------
# this program generates graph after analysis of data0
# commulative freq of intensity over period of time
#-----------------------------
# read data  and store into mstrData
mstrData=read.table(file="data0.txt",sep='\t',comment.char='#',
header=TRUE)
#-----------------------------
# format date and store into Dates
Dates=as.Date(mstrData$date,"%d/%m/%Y")	# date header name
#-----------------------------
# make list of dates of different intensity
# store intensity 0 Dates into dates0 and so on
# there are only four intensity levels 0..3
dates0=NULL
dates1=NULL
dates2=NULL
dates3=NULL
#----------
# make list of intensities and store into Ints
Ints=mstrData$intensity		# intensity is header name
#----------
loops=length(Dates)		# loops = number of entries
for(i in 1:loops){
	pIntensity=Ints[i]	# holds intensity on particular date
	pDate=as.character(Dates[i])	# particular corresponding date
	switch(pIntensity==0,(dates0[length(dates0)+1]=pDate))
	switch(pIntensity==1,(dates1[length(dates1)+1]=pDate))
	switch(pIntensity==2,(dates2[length(dates2)+1]=pDate))
	switch(pIntensity==3,(dates3[length(dates3)+1]=pDate))
}
# print(dates0)
# date0..3 are assigned their particular dates
#-----------------------------
# Empty plot with wise ranges
# Dates are on X-axis
# commulative frequency is on Y-axis
# X-range minOfDates-7Day ... maxOfDates+7Day for good visibility purpose
# y-range 0 .. maxOfCommulative
daysList=c(length(dates0),length(dates1),length(dates2),length(dates3),length(Dates))
highFreq=max(daysList)
#---------
yinc=1
totalTics=highFreq/yinc+1
totalDays=as.integer((as.Date(max(Dates))+7)-(as.Date(min(Dates))-7))
xinc=totalDays/(totalTics-1)
#---------
# plotting
plot(seq(as.Date(min(Dates))-7,as.Date(max(Dates))+7,xinc),seq(0,highFreq,yinc),type='n',
xlab="Date on which reading was taken",
ylab="commulative frequency",main="mstr under different intensities")
#---------
# drawing grid
grid(col='grey')
#---------
lines(as.Date(Dates),1:length(Dates),col="brown")
legend("top","All", text.col='brown');
lines(as.Date(dates0),1:length(dates0),col='black')
legend("right","NEm",text.col='black')	# NEmission
lines(as.Date(dates1),1:length(dates1),col='red')
legend("bottomright","WEdg",text.col='red')	# Without Edging
lines(as.Date(dates2),1:length(dates2),col='green')
legend("left","ShtEdg",text.col='green')	# Short Edging
lines(as.Date(dates3),1:length(dates3),col='blue')
legend("topleft","LngEdg",text.col='blue')	# Long Edging

