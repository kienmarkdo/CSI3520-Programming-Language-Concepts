# Installing R Studio and testing random stuff

> print("Testing 123")
[1] "Testing 123"
> print("Testing 123", quote=FALSE)
[1] Testing 123
> x <- c(1,2,3,4,5)
> x
[1] 1 2 3 4 5
> print(x)
[1] 1 2 3 4 5
> x <- seq(1,5)
> x <- seq_len(5)
> x <- c(1:5)
> plot(1,1)
> x[3]
[1] 3
> y[1:4]
Error: object 'y' not found
> matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=TRUE)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
> matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=FALSE)
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9