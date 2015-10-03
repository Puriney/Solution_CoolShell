## Step 1 queens() function dependency
# http://rosettacode.org/wiki/Permutations#R
next.perm <- function(p) {
	n <- length(p)
	i <- n - 1
	r = TRUE
	for(i in (n-1):1) {
		if(p[i] < p[i+1]) {
			r = FALSE
			break
		}
	}
 
	j <- i + 1
	k <- n
	while(j < k) {
		x <- p[j]
		p[j] <- p[k]
		p[k] <- x
		j <- j + 1
		k <- k - 1
	}
 
	if(r) return(NULL)
 
	j <- n
	while(p[j] > p[i]) j <- j - 1
	j <- j + 1
 
	x <- p[i]
	p[i] <- p[j]
	p[j] <- x
	return(p)
}
 
print.perms <- function(n) {
	p <- 1:n
	while(!is.null(p)) {
		cat(p,"\n")
		p <- next.perm(p)
	}
}
## Step 2 queens() function with solutions
# http://rosettacode.org/wiki/N-queens_problem#R
safe <- function(p) {
	n <- length(p)
	for(i in 1:(n-1)) {
		for(j in (i+1):n) {
			if(abs(p[j] - p[i]) == abs(j - i)) return(FALSE)
		}
	}
	return(TRUE)
}
 
queens <- function(n) {
	solutions <- list()
	p <- 1:n
	k <- 0
	while(!is.null(p)) {
		if(safe(p)) {
			# cat(p,"\n")
			k <- k + 1
			solutions[[k]] <- p

		}
		p <- next.perm(p)
	}
	cat("Result: ", k, "solutions\n")
	return(solutions)
}
q9 <- queens(9)
## Step 3 
q9.key <- sapply(q9, function(x) paste(x, collapse=""))
prev.pwd <- "zWp8LGn01wxJ7"
target.value <- "e48d316ed573d3273931e19f9ac9f9e6039a4242"

coolshell.code <- paste0(prev.pwd, q9.key, "\n")
require(digest)
coolshell.query <- sapply(coolshell.code, function(x) as.character(digest(x, algo = "sha1", serialize=F)))

i <- which(coolshell.query == target.value)
q9.key[[i]]