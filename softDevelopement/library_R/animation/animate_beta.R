animate <-function(x,y=NULL,simT=1,type='l',lwd=1,lty=1,
                   main=NULL,sub=NULL,xlab=NULL,ylab=NULL,add=FALSE,col='black'){
    if(is.null(y)){y=x; x=1:length(x)}
    yinc=(max(y)-min(y))/(max(x)-min(x))
    if(!add){
        plot(x=min(x):max(x),y=seq(min(y),max(y),yinc),type='n',
             main=main,xlab=xlab,ylab=ylab)
        grid()
    }
    loops=length(x)-1
    wait=simT/loops
    for(i in 1:loops){
                                        # previous x coord
        px=x[i]
                                        # current x coord
        cx=x[i+1]
                                        # previous y coord
        py=y[i]
                                        # current y coord
        cy=y[i+1]
        lines(c(px,cx),c(py,cy),lty=lty,lwd=lwd,type=type)
        Sys.sleep(wait)
    }
}
