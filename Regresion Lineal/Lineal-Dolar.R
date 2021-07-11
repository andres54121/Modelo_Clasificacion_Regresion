library(tidyverse)

URL_CSV <- "https://raw.githubusercontent.com/andres54121/Modelo_Clasificacion_Regresion/main/Dolar.csv"
datos <- read.csv(URL_CSV)

# "mejor" ajuste de regresión lineal simple
lm(formula = VALOR ~ ï..FECHA, data = datos)

#Grafica
datos %>% 
  ggplot(aes(x = ï..FECHA,
             y = VALOR)) +
  geom_point() +
  geom_abline(intercept = 79.016512,
              slope = -0.001329,
              col = 'blue')
#Predecir precio dolar
fecha <- 44350
precio <- -0.001329 * fecha + 79.016512
print(precio)