############
The CacheMatrix creats instances of all functions needed to solve. It is the 
templete.
############

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## It searches for any cached variable

cacheSolve <- function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
 #jgkljkh
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}


m<-cbind(c(1,2,3),c(0,4,5),c(1,0,6)) # taken an invetible square matrix
cacheSolve(makeCacheMatrix(m))  # result