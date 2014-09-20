source("cachematrix.R")
# matrix(1:2:9, nrow = 3, ncol = 3, byrow=TRUE) 
rm(aMatrix)
aMatrix <- c(6, 2, 4, 8, 4, 10, 2, 16, 14) 
aMatrix
dim(aMatrix) <- c(3,3)
aMatrix
class(aMatrix)
solve(aMatrix)

rm(cm)
cm <- makeCacheMatrix(aMatrix)
cm
cm$get()
class(cm)
str(cm)

cacheSolve(cm)
