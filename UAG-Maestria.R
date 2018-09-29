# https://www.kaggle.com/blastchar/telco-customer-churn/home
rm() # remueve la asignacion de una variable
str(datos)
datos <- read.csv("C:/Users/Aula 104/Downloads/WA_Fn-UseC_-Telco-Customer-Churn.csv")
summary(datos) # sumario estadistico de un data frame
datos$SeniorCitizen <- as.factor(datos$SeniorCitizen)
library(ggplot2) # libreria de graficos
library(dplyr) # libreria de manejo de datos

ggplot(datos, aes(x=Churn, y = gender)) + 
  geom_jitter()

datos.payment <- filter(.data = datos, 
                        PaymentMethod != "Electronic check" 
                        & PaymentMethod != "Mailed check")
datos.payment <- select(datos.payment,customerID,
                        gender,tenure, PhoneService)


datos.payment <- datos %>%
  filter(PaymentMethod != "Electronic check") %>%
  filter(PaymentMethod != "Mailed check") %>%
  select(customerID,gender,tenure, PhoneService) %>%
  arrange(desc(tenure))

datos.monthlycharge.gender <- datos %>%
  group_by(gender) %>%
  summarise(Meanbygender = mean(MonthlyCharges),
            SumBygender = sum(MonthlyCharges)) 

datos.monthlycharge.method <- datos %>%
  group_by(PaymentMethod) %>%
  summarise(Meanbygender = mean(MonthlyCharges),
            SumBygender = sum(MonthlyCharges),
            Count = n()) %>%
  mutate(upper = Meanbygender + 30, lower = Meanbygender - 30)


ggplot(datos.payment , aes(x = Churn, y = gender, colour = PaymentMethod)) + 
  geom_jitter()


datos.new <- datos %>%
  select(Churn,SeniorCitizen,Dependents, tenure, Contract)

datos.new <- datos.new[complete.cases(datos.new),]
datos.new <- droplevels(datos.new)
train <- sample(1: nrow(datos.new), nrow(datos.new)*0.7)

########## no funciona
library(stats)
model.train  <- glm(Churn ~-.,datos.new[train,], 
                    family = "gaussian")
info.glm <- predict(model.train,ml.df[-train,])
error.glm <- sd(ml.df[-train,]$Salary - info.glm)


