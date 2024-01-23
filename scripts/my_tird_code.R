# data.frames

# let´s import some data da internet !!!! 
download.file(url = "https://ndownloarder.figshare.com/files/2292169", destfile = "data_raw/portal_data_joined.csv") #va sull url che ho selezionare and destination file nel data_raw che ho creato all'inizio

library (tidyverse)

surveys <- read.csv("data_raw/portal_data_joined.csv")

head(surveys)

#dataframe cointains numeric, character, logical , each are vector

str(surveys)

dim(surveys)
nrow(surveys)
ncol(surveys) #numero colonne, righe ecc... dimensioni insomma

tail(surveys)

names(surveys)
# equivalent to 
colnames(surveys)
rownames(surveys)

summary(surveys)

# indexing and subsetting 
surveys [1,6]

surveys [1, ]
surveys [, 1]

surveys [c(1, 2, 3), c(5,6)]

surveys [1:3, 5:6]
surveys [, -1]

surveys [, "sex"]
surveys ["sex"]
surveys$plot_id

### Exercise 
surveys_200 <- surveys[200,]
surveys[nrow(surveys),]  

surveys[nrow(surveys)/2, ]

my_list <- list(name = c("Nora", "Lisanna", "Francesco"), money = c(1,6,7,3,5,8))

my_list[[1]]
my_list&names

surveys[[3]]
