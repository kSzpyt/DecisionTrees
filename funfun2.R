foo <- function(a, b)
{
  w <- -(a/b) * log(a/b, base = 2)
  if(is.na(w))
    return(0)
  else
    return(w)
}


czystazajebistosc2 <- function(data, ex)
{
  datf <- data.frame("warunek" = 0, "entropia" = 0)
  k1 <- which(data[, dim(data)[2] - 3] == 1)
  k2 <- which(data[, dim(data)[2] - 2] == 1)
  k3 <- which(data[, dim(data)[2] - 1] == 1)
  k4 <- which(data[, dim(data)[2]] == 1)
  I <- foo(length(k1), dim(data)[1]) + foo(length(k2), dim(data)[1]) + foo(length(k3), dim(data)[1]) + foo(length(k4), dim(data)[1])
  vec <- 1:(length(data)-4)
  if(length(ex) != 1)
  {
    vec <- vec[-ex]
  }
  
  for (x in vec) {
    y <- table(data[, x])
    x1 <- table(data[k1, x])
    x2 <- table(data[k2, x])
    x3 <- table(data[k3, x])
    x4 <- table(data[k4, x])
    
    p <- foo(x1[2], y[2]) + foo(x2[2], y[2]) + foo(x3[2], y[2]) + foo(x4[2], y[2])
    z <- foo(x1[1], y[1]) + foo(x2[1], y[1]) + foo(x3[1], y[1]) + foo(x4[1], y[1])
    if(is.na(p))
    {
      p <- 0
    }
    if(is.na(z))
    {
      z <- 0
    }
    
    sum <- p * (y[2]/sum(y)) + z * (y[1]/sum(y))
    
    names(sum) <- NULL
    datf <- rbind(datf, data.frame("warunek" = x, "entropia" = I - sum))
  }
  datf <- datf[-1, ]
  maks <- datf[which(datf[, 2] == max(datf[,2])),]
  #tiruriru
  maks <- as.numeric(maks[, 1])
  
  index <- which(data[, maks] == 1)
  
  tib1 <- data[index, ]
  tib2 <- data[-index, ]
  l <- list(tib1, tib2)
  ex <- c(ex, maks)
  return(list(l, ex, datf))
}
