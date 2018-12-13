library(readxl)
dane <- read_excel("dane2.xlsx", sheet = "Sheet2")
dane <- as.data.frame(dane)
str(dane)
#source("funfun2.R")

a <- czystazajebistosc2(dane, 0)
a1 <- a[[1]][[1]] # bieszczady- już nie tykamy jest super
a2 <- a[[1]][[2]]
e1 <- a[[2]]

b <- czystazajebistosc2(a2, e1)
b1 <- b[[1]][[1]] 
b2 <- b[[1]][[2]]
e2 <- b[[2]]

c <- czystazajebistosc2(b1, c(e2, 3, 4))
c1 <- c[[1]][[1]] 
c2 <- c[[1]][[2]]
e3 <- c[[2]]
