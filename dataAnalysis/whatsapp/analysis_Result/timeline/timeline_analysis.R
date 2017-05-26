inputFileNames=c('osama_timeline.txt','fraz_timeline.txt','hamza_timeline.txt','aliNasir_timeline.txt','zaeem_timeline.txt','mAhmad_timeline.txt','M_k_timeline.txt','rahim_timeline.txt','sadeed_timeline.txt','uzair_timeline.txt','saad_timeline.txt','ahmadShahzad_timeline.txt')
#-----------------------------------------
members=c("osama","fraz","hamza","ali","zaeem","M.A","M.K","Rahim","sadeed","uzair","saad","A.S")
# using group admin dates range to draw empty plots
oldest=read.table(file = 'ahmadShahzad_timeline.txt',sep = '\t',header = TRUE)
mostActive=read.table(file = 'osama_timeline.txt',sep = '\t',header = TRUE)
# converting dates to proper format
dates=as.Date(oldest$Dates,"%m/%d/%y")
cPosts=mostActive$ComFreq
#------------------------------------
pdf(file = "comulative_freq.pdf")
yaxis=seq(1,length(cPosts),by = length(cPosts)/length(dates))
plot(x=dates,y=yaxis,type = 'n',xlab = "TimeLine",ylab = "total posts",
     main = 'Group Admin: Ahmad Shahzad', sub = "comulative posts by each user")
colors=rainbow(12)
#-----------------------------------------
for (i in 1:length(inputFileNames)){
  # import data one by one and store temporarily in 'Individaul Data'
  indData=read.table(file = inputFileNames[i],sep = '\t',header = TRUE)
  # converting dates to proper format
  dates=as.Date(indData$Dates,"%m/%d/%y")
  cPosts=indData$ComFreq
  lines(dates,cPosts,type='l',col=colors[i])
  #text(x=,y=50*i,members[i],col = colors[i])
   # print(dates)
}
legend("left",horiz=F,legend=members,col=colors,lty=1,bty=12)
dev.off()

