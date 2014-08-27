## Written By: Louis Halbert
## 
## Purpose: Caching the Mean of a Vector
##
## Function: Create two functions that are used to create a special 
## object that stores a numeric vector and cache's its mean


## This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function(x = matrix()) {
	# Holds the cached value (or NULL if nothing is cached)
	# Initially set value to NULL
	m <- NULL

  # Store a matrix
	setMatrix <- function(newVar) {
		x <<- newVar

		# Empty the cache
		m <<- NULL
  }

    # Returns the stored matrix
	getMatrix <- function() {
		x
	}

	# Cache the given argument 
	cacheInverse <- function(solve) {
		m <<- solve
	}

	# Get the cached value
	    getInverse <- function() {
            m
    }

    # Return a list. Each named element of the list is a function
	list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
		
}


## This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
        
        # Get the cached value
        inverse <- x$getInverse()

        # If a cached value exists, return it
        if(!is.null(inverse)) {
                message("Getting data from cache...")
                return(inverse)
        }

        # Otherwise get the matrix, caclulate the inverse and store it
        # in the cache
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)

        # Return a matrix that is the inverse of 'x'
        inverse
}
