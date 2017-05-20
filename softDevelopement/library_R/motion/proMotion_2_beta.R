# throw(iv,ip,ang,g,col) will animate a projectile motion
# future: iv[vi1, vi2, vi3...], ang[ang1,ang2,...]
# multiple plots at one time
throw <- function(iv=10,ang=90,g=9.81,
    ip=c(0,0),simT=5,col='red',lwd=2,lty=1,
    type='l',wait=.1,asp=1)
  {
  # iv <- initial velocity in direction of angle
  # ang <- angle of projectile motion
  # g <- gravity acting over particle
  # ip <- initial position of particle
  # simT <- simulation time 
  # col <- col of particle
  #---------------- instant variable
  sideEdge=5
  #---------------- Method
  # calculation feild of view
  # calculation of x-dixtance over time
  # calculation of y-distance over time
  # xpos = initial_pos + xdistance
  # ypos = initial_pos + ydistance
  #------------------------------- calculation of field of view
  # 'v_x' vilocity in x direction
  v_x = iv * cos(ang*pi/180)
  print(paste(v_x,"velocity in x"))
  # 'v_y' vilocity in y direction
  v_y = iv *sin(ang*pi/180)
  print(paste(v_y,"velocity in y"))
  # plot_width = v_x * simT
  # it will travel in only one direction
  plot_width = v_x * simT
  print(paste(plot_width,"x width of plot"))
  # plot_height= v_y*simT+1/2(g)*simT^2
  # it may move upward and then downward
  # space for upward
  # 'upTrvTime' upward Travel Time
  upTrvTime = (v_y)/g
  print(paste(upTrvTime,"upward traveling time"))
  if(upTrvTime > simT) upTrvTime=simT
  #print(paste(upTrvTime,"upward traveling time after"))
  up_height = v_y * upTrvTime + (.5)*(-g)*upTrvTime^2
  print(paste(up_height,"max height"))
    # dTrvTime time taken to trvel downward
  dTrvTime=simT-upTrvTime
  print(paste(dTrvTime,"downward traveling time"))
  down_height = (.5)*(g)*dTrvTime^2
  print(paste(down_height,"down height"))
  plot_height=max(up_height,down_height)+sideEdge
  print(paste(plot_height,"plot height"))
  #------------------------------- position calculation
  # it initial time
  it=Sys.time()
  # te time elapsed
  #te=as.numeric(it-Sys.time())
  #------------------------------ empth plot
  # boundaries of plot
  # x axis start
  xstrt=(ip[1]-sideEdge)
  # x axis stop
  xstp=plot_width+sideEdge
  # y axis start
  if(down_height > up_height) {ystrt=(ip[2]-(down_height-up_height))-sideEdge;
      ystp=(ip[2]+up_height)+sideEdge} else {ystrt=(ip[2]-sideEdge); 
# change: added 'ip[2]'
      ystp=ip[2]+up_height+sideEdge}
  
  #ystrt=(ip[2]-sideEdge)+(up_height-down_height)
  # y axis stop
  ###ystp=(plot_height+sideEdge)+(down_height-up_height)
  #ystp=plot_height/2.0
  # x increment 1
  # y increment conditional
  # yinc=(plot_height+2*sideEdge-ip[2])/(plot_width+2*sideEdge-ip[1])
  yinc=(ystp-ystrt)/(xstp-xstrt)
  #------------------------------
  #plot(x=seq(xstrt,xstp,1),y=seq(ystrt,ystp,yinc),type='n')
  #----------------------------- recording positions
  # particle x position
  pxpos=NULL
  pypos=NULL
  index=1
  while((te=as.numeric(Sys.time()-it)) < simT){
  x_dis=v_x * te
  y_dis=v_y * te +(.5)*(-g)*(te)^2
  ppos=c(ip[1]+x_dis,ip[2]+y_dis)    # particle position
  pxpos[index]=ppos[1]
  pypos[index]=ppos[2]
  #print(te)
  plot(x=seq(xstrt,xstp,1),y=seq(ystrt,ystp,yinc),type='n',
       main="projectile motion",xlab="horizontal position after t second",
       ylab="vertical position after t second")
  points(x=ppos[1],y=ppos[2],col=col,lwd=lwd,asp=asp)
  lines(x=pxpos,y=pypos,col=col,lty=lty,lwd=lwd)
  Sys.sleep(wait)
  index=index+1}
}

# =========================================================== 

# returns projection path(iv,ip,ang,g,col) will animate a projectile motio
throwPath<-function(iv=10,ang=90,g=9.81,ip=c(0,0),simT=5,nreadings=10)
  {
    # iv <- initial velocity in direction of angle
    # ang <- angle of projectile motion
    # g <- gravity acting over particle
    # ip <- initial position of particle
    # simT <- simulation time 
    #---------------- instant variable
    #---------------- Method
    # calculation of x-dixtance over time
    # calculation of y-distance over time
    # xpos = initial_pos + xdistance
    # ypos = initial_pos + ydistance
    #------------------------------- calculation of field of view
    # 'v_x' vilocity in x direction
    v_x = iv * cos(ang*pi/180)
    #print(paste(v_x,"velocity in x"))
    # 'v_y' vilocity in y direction
    v_y = iv *sin(ang*pi/180)
    #----------------------------- recording positions
    # particle x position
    pxpos=NULL
    pypos=NULL
    index=1
    incr=simT/(nreadings-1)
    for(te in seq(0,simT,incr)){
      # te time elapsed
      x_dis=v_x * te
      y_dis=v_y * te +(.5)*(-g)*(te)^2
      # particle position
      ppos=c(ip[1]+x_dis,ip[2]+y_dis)
      pxpos[index]=ppos[1]
      pypos[index]=ppos[2]
      index=index+1}
    path=data.frame("x"=pxpos,"y"=pypos)
    return(path)}
#================================================
#================================================
