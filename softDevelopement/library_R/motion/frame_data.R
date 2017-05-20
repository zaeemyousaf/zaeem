dplot <- function(fdata,type='l',lwd=2,lty=1,col=terrain.colors(length(fdata))){
  # 
    # frame data
  
  # scanning each column
  # maxl max list
  maxl=NULL
  minl=NULL
  # finding boundaries
  # xrange from xmin to xmax
  #xrange=min(minxl)
  # y-axis from ymin to ymax
  # columns of fdata
  columns=length(fdata)
  rows=length(fdata[,i])
  for(i in 1:columns){
    maxl[i]=max(fdata[,i])
    minl[i]=min(fdata[,i])
  }
  #--------------------
  ymax=max(maxl)
  ymin=min(minl)
  xmax=length(fdata[,1])
  xmin=1
  #-------------------- debugging
  print(ymax)
  print(ymin)
  print(xmax)
  print(xmin)
  
  #-----------
  yinc=(ymax-ymin)/(xmax-xmin)
  print(yinc)
  plot(x=seq(xmin,xmax,1),y=seq(ymin,ymax,yinc),type='n')
  #--------------------- plot lines
  for(i in 1:columns){
  lines(x=1:rows,y=as.vector(fdata[,i]),col=col[i],lty=lty,lwd=lwd)
  }
}


d=read.table(file="/home/zaeem/Desktop/DesktopFolders/Language/R/facebook/nuData.txt",
             sep="\t",header = TRUE)
dplot(fdata=d)
