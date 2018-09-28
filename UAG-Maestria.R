# https://www.kaggle.com/blastchar/telco-customer-churn/home
rm() # remueve la asignacion de una variable

datos <- read.csv("C:/Users/OmarVr/Downloads/WA_Fn-UseC_-Telco-Customer-Churn.csv")
summary(datos) # sumario estadistico de un data frame

library(ggplot2) # libreria de graficos
library(dplyr) # libreria de manejo de datos

ggplot(datos, aes(x=Churn, y = gender)) + 
  geom_jitter()

datos.payment <- datos %>%
  filter(PaymentMethod != "Electronic check") %>%
  filter(PaymentMethod != "Mailed check")
ggplot(datos.payment , aes(x = Churn, y = gender, colour = PaymentMethod)) + 
  geom_jitter()


ggplot(datos, aes(x = Churn, y = SeniorCitizen, size = tenure)) +
  geom_jitter()
  