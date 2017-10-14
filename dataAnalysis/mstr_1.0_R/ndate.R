# import data0.txt
data=read.table(file="data0.txt",sep='\t',comment.char='#',header=T)
raw_dates=data$date
for_dates=as.Date(raw_dates,'%d/%m/%Y')
diff_dates=diff(for_dates)
barplot(table(diff_dates))
