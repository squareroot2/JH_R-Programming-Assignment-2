## Cache the potentially time-consuming task of computing the inverse of an (invertible) matrix via 2 functions:-

# 1. makeCacheMatrix  - a wrapper for the given invertible matrix with getters and setters, and
# 2. cacheSolve to compute the inverse of the matrix object created in step 1. above 

## 1. input some matrix and convert it to a special matrix object, then create a
#   special matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) 
{
  invM <- NULL # initialise the matrix inverse internal to the
  
  # method to set or initialise underlying matrix from outside the defining environment
  set <- function(y)
  {
    x <<- y # assign value from another environment to this enviroment
    
    # re-initialise the internal matrix inverse ready to be used again by new set call
    invM <<- NULL 
  }
  
  get <- function() x # method to get underlying matrix
  
  # method to set the matrix inverse
  setInverse <- function(inverse) invM <<- inverse
  
  # method to return the matrix inverse of makeCacheMatrix object
  getInverse <- function() invM #  
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## 2. compute the inverse of a makeCacheMatrix object 
# if this matrix is unchanged, and its inverse already calculated, then retrieve this existing inverse matrix object from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) { # does the inverese already exist? if so get it
    message("getting cached data")
    return(inv) # return the inverse matrix
  }
  # mean not exist; so get numeric vector using makeCacheMatrix.get
  data <- x$get() 
  inv <- solve(data, ...) # determine the inverse of data = a matrix
  x$setInv(inv) # set it in the makeCacheMatrix object
  inv # return the inverse matrix; same as return(inv)
}
