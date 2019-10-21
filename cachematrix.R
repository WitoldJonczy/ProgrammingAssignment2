## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  minv <- NULL
  set <- function(y) {
    x <<- y
    minv <<- NULL
}
  get <- function() x
  setinverse <- fucntion(inverse) minv <<- inverse
  getinverse <- function() minv
  list(set = set,
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}

## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above.

cacheSolve <- function(x, ...) {
  minv <- x$getinverse()
  if (!is.null(minv)) {
    message("getting cache data")
    return(minv)
  }
  data <- x$get()
  minv <- solve(data, ...)
  x$setinverse(minv)
  minv
}