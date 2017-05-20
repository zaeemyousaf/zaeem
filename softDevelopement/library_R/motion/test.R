plot(x=1:10,y=1:10,type = 'n')
initx=2
inity=2
xwall=10
for(i in 1:30){
  if (i > xwall) {i=-i; xpos=2*xwall+i} else xpos=initx+i
  ypos=inity
  print(xpos)
  points(xpos,ypos)
  Sys.sleep(.1)
  print(i)
  }

