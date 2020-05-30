library(nnet) #for multiple regression
library(dplyr) #for data cleaning
library(caret) #for trainiing the model
library(glmnet) #for lasso regression
library(Amelia) #for predictive imputatin
library(stringr) #for slicing character variables
library(ggplot2) #for visualisation
library(mltools) #for one hot encoding
library(corrplot) #for plotting a correlation graph
library(tidyverse) #for data cleaning
library(data.table) #for data manupulation

#Loading the data
train <- read.csv("/Users/kritik/Desktop/Data Science/Datasets/Analytics Vidhya/bigmart_train.csv",na.strings = c('',' ','NA'),header = T)
test <- read.csv("/Users/kritik/Desktop/Data Science/Datasets/Analytics Vidhya/bigmart_test.csv",na.strings = c('',' ','NA'),header = T)

#Pre-viewing the data
dim(train); dim(test)
test$Item_Outlet_Sales <- NA #Setting the response variable in test dataset to NA
bigmart <- suppressWarnings(bind_rows(train,test))
dim(bigmart)


head(bigmart)
str(bigmart)

#Data characteristics function
dataInfo <- function(df) {
  NAvalues <- list(); NAclass <- list(); UniqueVals <- list(); ColName <- names(df); Index <- c(1:dim(df)[2])
  for(i in 1:dim(df)[2]) {
    NAvalues[i] <- sum(is.na(df[,i]))
    NAclass[i] <- class(df[,i])
    if(class(df[,i])=="numeric" | class(df[,i])=="integer") {
      UniqueVals[i] <- 'Not Applicable'
    }
    else{
      UniqueVals[i] <- length(unique(df[,i]))
    }
  }
  NAlist <- cbind(Index,ColName,NAvalues,NAclass,UniqueVals) 
}

Info <- dataInfo(bigmart); Info

#Dealing with Item_Identifier
head(table(bigmart$Item_Identifier))
min(table(bigmart$Item_Identifier))
bigmart$Item_Identifier <- as.factor(bigmart$Item_Identifier)


bigmart$Item_Category <- str_sub(bigmart$Item_Identifier,start = 1L, end = 2L)
bigmart$Item_Category <- as.factor(bigmart$Item_Category)
head(bigmart$Item_Category)

#Dealing with Item_Weight
imputeWeight <- function(df) {
  df %>%
    group_by(Item_Identifier) %>%
    mutate(Item_Weight = ifelse(is.na(Item_Weight),mean(Item_Weight,na.rm = T),Item_Weight)) %>%
    ungroup()
}

Identify_Weight <- bigmart[,c(1,2)]
Identify_Weight <- imputeWeight(Identify_Weight)
bigmart[,c(1,2)] <- Identify_Weight


ggplot(bigmart) + geom_histogram(aes(Item_Weight),binwidth = 0.5,fill = 'skyblue', col = 'black')

Info <- dataInfo(bigmart); Info

#Dealing with Item_Fat_Content
glimpse(bigmart$Item_Fat_Content)
unique(bigmart$Item_Fat_Content)


levels(bigmart$Item_Fat_Content) <- list('Low Fat' = 'LF','Low Fat' = 'low fat','Regular'='reg')
unique(bigmart$Item_Fat_Content)


NC <- as.data.table(bigmart[,c(3,13)])
NC[Item_Category=='NC',Item_Fat_Content:='Non Consumable',Item_Fat_Content]
bigmart[,c(3,13)] <- NC


ggplot(bigmart %>% group_by(Item_Fat_Content) %>% summarise(Count = n())) + 
  geom_bar(aes(Item_Fat_Content, Count), stat = 'identity', fill = 'skyblue',col='black')

Info <- dataInfo(bigmart); Info

#Dealing with Item_Visibility
bigmart[,4][bigmart[,4]==0] <- NA

imputeFat <- function(df) {
  df %>%
    group_by(Item_Identifier) %>% 
    mutate(Item_Visibility = ifelse(is.na(Item_Visibility),mean(Item_Visibility,na.rm=T),Item_Visibility)) %>%
    ungroup()
}

Vis <- bigmart[,c(1,4,5)]
Vis <- imputeFat(Vis)
bigmart[,c(1,4,5)] <- Vis


ggplot(bigmart) + geom_histogram(aes(Item_Visibility),binwidth = 0.005, fill = 'skyblue', col = 'black')

Info <- dataInfo(bigmart); Info

#Dealing with Outlet_Size
sub_mart <- bigmart  %>%
  select(Outlet_Identifier,Outlet_Establishment_Year,Outlet_Size,Outlet_Location_Type,Outlet_Type)

sub_mart$Outlet_Identifier <- as.factor(sub_mart$Outlet_Identifier)
sub_mart$Outlet_Establishment_Year <- as.factor(sub_mart$Outlet_Establishment_Year)
sub_mart$Outlet_Size <- factor(sub_mart$Outlet_Size,levels = c("Small","Medium","High"),labels = c(1,2,3),ordered = T)
sub_mart$Outlet_Location_Type <- factor(sub_mart$Outlet_Location_Type,levels = c("Tier 3","Tier 2","Tier 1"),labels = c(3,2,1),ordered = T)
sub_mart$Outlet_Type <- as.factor(sub_mart$Outlet_Type)


str(sub_mart)


imputed_mart <- amelia(sub_mart, m = 5, ords = c("Outlet_Size","Outlet_Location_Type"),
                       noms = c("Outlet_Establishment_Year", "Outlet_Identifier","Outlet_Type"),
                       incheck = TRUE,empri = 1)


fit1 <- multinom(Outlet_Size~Outlet_Location_Type+Outlet_Establishment_Year+Outlet_Identifier+Outlet_Type,data = imputed_mart$imputations$imp1)
fit2 <- multinom(Outlet_Size~Outlet_Location_Type+Outlet_Establishment_Year+Outlet_Identifier+Outlet_Type,data = imputed_mart$imputations$imp2)
fit3 <- multinom(Outlet_Size~Outlet_Location_Type+Outlet_Establishment_Year+Outlet_Identifier+Outlet_Type,data = imputed_mart$imputations$imp3)
fit4 <- multinom(Outlet_Size~Outlet_Location_Type+Outlet_Establishment_Year+Outlet_Identifier+Outlet_Type,data = imputed_mart$imputations$imp4)
fit5 <- multinom(Outlet_Size~Outlet_Location_Type+Outlet_Establishment_Year+Outlet_Identifier+Outlet_Type,data = imputed_mart$imputations$imp5)


anova(fit1,fit2,fit3,fit4,fit5,test = "Chisq")
bigmart$Outlet_Size <- imputed_mart$imputations$imp4$Outlet_Size


ggplot(bigmart %>% group_by(Outlet_Size) %>% summarise(Count = n())) + 
  geom_bar(aes(Outlet_Size, Count), stat = 'identity', fill = 'skyblue',col = 'black')

#Feature Engineering
bigmart$Item_Price_Weight <- bigmart$Item_MRP / bigmart$Item_Weight
bigmart$Outlet_Operational_Years <- 2013 - bigmart$Outlet_Establishment_Year

Info <- dataInfo(bigmart); Info

#Encoding Categorical Variables
bigmart$Outlet_Size <- ifelse(bigmart$Outlet_Size == 1, 0, ifelse(bigmart$Outlet_Size == 2, 1, 2))
bigmart$Outlet_Location_Type <- ifelse(bigmart$Outlet_Location_Type == 3, 0, ifelse(bigmart$Outlet_Location_Type == 2, 1, 2))


ohe_var <- bigmart[,c(3,5,7,11,13)]
bigmart_ohe <- one_hot(as.data.table(ohe_var))
bigmart[,c(3,5,7,11,13)] <- NULL
bigmart <- bind_cols(bigmart,bigmart_ohe)

#Splitting the data
test <- subset(bigmart,is.na(bigmart$Item_Outlet_Sales))
train <- subset(bigmart,!is.na(bigmart$Item_Outlet_Sales))

#Separating Response and Predictors
Ytrain <- train[,8]
Xtrain <- train[,-8]

#Building the model
set.seed(123)
my_control = trainControl(method="cv", number=5)
Grid = expand.grid(alpha = 1, lambda = seq(11,13,by = 0.0001))
lasso_mod = train(x = train[, -c(1,8)], y = train$Item_Outlet_Sales,
                  method='glmnet', trControl= my_control, tuneGrid = Grid)


head(lasso_mod$results)

#Testing the model
test$Item_Outlet_Sales <- predict(lasso_mod,newdata=test)
