source("between.R")
# instantaneous walls
# interpolation: needs two points and ball.pos.xy
# access two points for interpolation with between
# left and right points Indexes
lrIndexes=between(ball.y,constraint.x)
# top and bottom points Indexes
tbIndexes=between(ball.x,constraint.x)
# slrx : sorted left right constraint.x
slrx = sort(x[lrIndexes])
slry = sort(y[lrIndexes])
# stby: sorted top and bottom constraint.y
stbx=sort(x[tbIndexes])
stby=sort(y[tbIndexes])
# two points on left
tpl=list(lx1=slrx[1],ly1=slry[1],lx2=c(slrx[2]),ly2=c())
lwall=left_xpoints_on_boundary_that has same y-component
rwall=
twall=
bwall=
