source(file="/home/zaeem/Desktop/DesktopFolders/Language/R/animation/animate.R")
# will animate barplot
anibarplot <- function(height, width = 1, space = NULL, simT=5,
        names.arg = NULL, legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL){

  
  #------------------------------------
  #------------------------------------
#   xmax=length(height)*(width+space)
#   ymax=max(height)
#   plot.new()
#   plot.window(xlim=c(0,xmax),ylim=c(0,ymax))
#   box()
#   axis(1)
#   axis(2)
  #----------------- if add is false draw newplots
if(length(space) ==0) space=.2
if(length(space) < length(height)) space=rep(space,ceiling(length(height)/length(space)))
  if(!add){
    xmax=length(height)*(width)+sum(space[1:length(height)]);
    xmin=0
    ymax=max(height);
    ymin=min(height)
#     plot.new();
#     plot.window(xlim=c(0,xmax),ylim=c(0,ymax));
#     box();
#     axis(1);
#     axis(2);
  plot(x=seq(xmin,xmax,1),y=seq(ymin,ymax,by=(ymax-ymin)/(xmax-xmin)),type='n')
    }
    #------------------
  loops=length(height)
  for(i in 1:loops){
  # x coord of left bottom of bar
  xlb=i*space[1]+(i-1)
  #print(paste("x left bottom",xlb))
  ylb=0
  ylt=height[i]
  yrt=ylt
  yrb=0
  # x coord of left top of bar
  xlt=xlb
  # x coor of right top of bar
  xrt=xlt+width
  xrb=xrt
  # x coords of a bars to draw polygon
  xcor=c(xlb,xlt,xrt,xrb,xlb)
  ycor=c(ylb,ylt,yrt,yrb,ylb)
  #if(border==F) {pborder=col; acol=col} else {pborder=border;acol=col}
  animate(x=xcor,y=ycor,add=TRUE,simT =simT/loops)
  polygon(x=xcor[1:4],y=ycor[1:4],col=col,
          border=border)
  }

  #return(list("xcor"=xcor,"ycor"=ycor))
}
