# https://www.kaggle.com/blastchar/telco-customer-churn/home


datos <- read.csv("C:/Users/OmarVr/Downloads/WA_Fn-UseC_-Telco-Customer-Churn.csv")
summary(datos)

library(ggplot2)
library(dplyr)

ggplot(datos, aes(x=Churn, y = gender)) + 
  geom_jitter()

  datos.payment <- datos %>%
    filter(PaymentMethod != "Electronic check") %>%
    filter(PaymentMethod != "Mailed check")
  ggplot(datos.payment , aes(x = Churn, y = gender, colour = PaymentMethod)) + 
  geom_jitter()
  