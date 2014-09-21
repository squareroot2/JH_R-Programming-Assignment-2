# Testing my cachematrix code

source("cachematrix.R")

rm(aMatrix) # initialise

# create and view matrix and its properties
aMatrix <- c(6, 2, 4, 8, 4, 10, 2, 16, 14) 
aMatrix
dim(aMatrix) <- c(3,3)
aMatrix
class(aMatrix)
solve(aMatrix)

# now create makeCacheMatrix object from given meatrix
rm(cm) # initialise
cm <- makeCacheMatrix(aMatrix)
cm
cm$get() # view the matrix
class(cm)
str(cm)

# create the matrix inverse of the given matrix
cacheSolve(cm)


####################

# Gregory D. HorneCommunity TA· R Programming Coursera course. Sep 2014
# Unit tests (with expected output) for Programming Assignment 2

### Example

      source("cachematrix.R")

     amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
    amatrix$get()         # Returns original matrix
     [,1] [,2]
[1,]    1    3
[2,]    2    4

    cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
    [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

   amatrix$getInverse()  # Returns matrix inverse
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

   cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

    amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
    cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
            [,1] [,2]
[1,] -0.13333333  0.2
[2,]  0.01010101  0.0

    amatrix$get()         # Returns matrix
     [,1] [,2]
[1,]    0   99
[2,]    5   66

    amatrix$getInverse()  # Returns matrix inverse
            [,1] [,2]
[1,] -0.13333333  0.2
[2,]  0.01010101  0.0