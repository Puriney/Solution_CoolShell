

String2Vector <- function(x){
	x <- toupper(as.character(x))
	unlist(strsplit(x = x, split = ""))
}

## Wrong! BA != AB
# ValueExcelColumn <- function(x){
# 	x <- String2Vector(x)
# 	l <- length(x)
# 	## part 1
# 	out1 <- sn(a1 = 26, q = 26, n = (l - 1))
# 	## part 2
# 	out2 <- sapply(x, function(w) which(LETTERS == w))
# 	out2 <- prod(out2)
# 	out <- out1 + out2
# 	return(out)
# }

ValueExcelColumn <- function(x){
	x <- String2Vector(x)
	l <- length(x)
	v <- sapply(x, function(w) which(LETTERS == w))
	v <- as.numeric(v)
	v <- rev(v)
	# cat(v, "\n")

	o <- 0
	for (i in 1:l) {
		o <- o + v[i] * 26 ^  (i - 1)
	}
	return(o)
}

## ValueExcelColumn("coolshell") / ValueExcelColumn("shell")
## wuold yield 85165.49
## type 85165 as answer. 
## it mentioned should be string

## try and try
## DUYO
