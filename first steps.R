a <- 1:2
b <- 1:3
c <- 1:3
d <- 1:3
e <- 1:4

aaa <- expand.grid(a, b, c, d, e)
bbb <- sample(1:3, 216, replace = TRUE, prob = c(1, 3, 5))
library(xlsx)

data <- cbind(aaa, bbb)
names(data) <- c("zm1", "zm2", "zm3", "zm4", "zm5", "kon")
head(data)
library(nnet)

data2 <- NA
for (x in 1:6) {

  data2 <- cbind(data2, class.ind(data[, x]))
}
data2 <- data2[,-1]
colnames(data2) <- c(paste0("a", 1:2), paste0("b", 1:3), paste0("c", 1:3), paste0("d", 1:3), paste0("e", 1:4), paste0("kon", 1:3))
head(data2)
write.xlsx(data2, "dane.xlsx")

library(dplyr)
data2 <- as_tibble(data2)
tib <- data2 %>%
  arrange(desc(kon1), desc(kon2), desc(kon3))
# View(tib)
data2 <- as.data.frame(tib)

# foo <- function(a, b)
# {
#   w <- -(a/b) * log(a/b, base = 2)
#   if(is.na(w))
#     return(0)
#   else
#     return(w)
# }
# head(tib)
# x <- tib$a1[which(tib$kon1 == 1)]
# y <- table(tib$a1)
# x <- table(x)
# x
# y

#############################################################

source("funfun.R")
#raz
aaaa <- czystazajebistosc(data2, 0)
#dwa
exx <- aaaa[[2]]
tib <- aaaa[[1]][[2]]
aaaa2 <- czystazajebistosc(tib, exx)
#trzy
exx <- aaaa2[[2]]
tib <- aaaa2[[1]][[2]]
aaaa3 <- czystazajebistosc(tib, exx)
# 
# qq <- aaaa[[2]]
# #which(qq$kon1 == 1)
# #dim(qq)
# czystazajebistosc(qq)
# qq <- as.data.frame(qq)
# czystazajebistosc(qq)
# 
# which(qq[, dim(qq)[2] - 2] == 1)   
# 



