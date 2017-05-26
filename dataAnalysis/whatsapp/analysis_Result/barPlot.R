pdf(file = "chat_PieChart.pdf")
chatData=read.table(file = 'table.txt',sep = '\t',header = TRUE)
pie(x = chatData$Posts,labels = abbreviate(chatData$Names),col = rainbow(12),
        main = "WhatsApp Group Admin: Ahmad Shahzad",sub="frequency Bar plot of posts")
dev.off()