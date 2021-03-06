## Two functions that cache the inverse of a matrix. Purpose is to demonstrate memory management (cache) 
## and the scoping of variables which can save computing time on large data sets.

## The `makeCacheMatrix` function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}

## The `cacheSolve` function computes the inverse of the special "matrix" returned by 
## `makeCacheMatrix` and if the inverse has already been calculated (and the matrix has not changed), 
## then `cacheSolve` retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
}
