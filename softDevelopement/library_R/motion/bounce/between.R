# info: between locates x between each pair and returns their indexes

between <- function(x,lst){
i=1
indexes=NULL
for(i in 1:(length(lst)-1)){
# if found record it and search another

prev=lst[i]
cur=lst[i+1]
if(prev <= x && x <= cur || cur <= x && x <= prev) {
indexes[length(indexes)+1]=i
indexes[length(indexes)+1]=i+1
}
}
# indexes contains indexes
# please treat it pairwise
# from left to right, each pair shows index of those numbers who
# have x between them
return(indexes)
}
