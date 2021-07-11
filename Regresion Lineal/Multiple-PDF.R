library(dplyr)

datos <- data.frame(x0= c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
                    x1= c(10,15,10,20,25,18,12,14,16,22,24,17,13,30,24),
                    x2= c(30,25,40,18,22,31,26,34,29,37,20,25,27,23,33),
                    y= c(24,27,29,31,25,33,26,28,31,39,33,30,25,42,40))

matriz <- matrix(c(datos$x0,datos$x1,datos$x2), nrow = 15, ncol = 3)
print ("Datos")
print (matriz)

mTranvers <- t(matriz)
print ("Datos Transpuestos")
print (mTranvers)

xt_X <- (mTranvers%*%matriz)
print ("xt * x")
print (xt_X)

xt_Y <- (mTranvers%*%datos$y)
print ("xt * y")
print (xt_Y)

inversa <- solve(xt_X)
print ("Inversa")
print (inversa)

Final <- inversa%*%xt_Y
print ("Resultado final")
print (Final)

yNew <-(Final[1,1] + (datos$x1*Final[2,1]) + (datos$x2*Final[3,1]))
print ("y Nueva")
print (yNew)

plot(datos$y, yNew,
     main="Gráfico de las Y", 
     ylab="Y",
     xlab="Nueva Y")