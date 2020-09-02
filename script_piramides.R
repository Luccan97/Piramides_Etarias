library(plotrix)
install.packages("GetoptLong")
library(GetoptLong)
library(tidyverse)

p_etarias <-
  read.csv2(
    "C:\\Users\\User\\Desktop\\DemandasCEInfo\\20200327_CNSAÚDE\\Piramides\\R\\p_etarias.csv",
    encoding = "UTF-8",
    sep = ";",
    dec = ",",
    header = TRUE)


agelabels <- c(
  "0-4",
  "5-9",
  "10-14",
  "15-19",
  "20-24",
  "25-29",
  "30-34",
  "35-39",
  "40-44",
  "45-49",
  "50-54",
  "55-59",
  "60-64",
  "65-69",
  "70-74",
  "75+"
)
mcol <- color.id('#5882FA')
fcol <- color.id('#FE2E2E')
dataset_length <- length(names(p_etarias))



for (i in 2:dataset_length) {
  
  xy.pop <- c(p_etarias[1:16, i])
  xx.pop <- c(p_etarias[17:32, i])
  
  municipality_name = names(p_etarias[i])
  
  piramide1 <- par(
    mar = pyramid.plot(
      xy.pop,
      xx.pop,
      labels = agelabels,
      main = qq("Pirâmide Etária: @{municipality_name}"),
      lxcol = mcol,
      rxcol = fcol,
      gap = 1,
      show.values = FALSE,
      top.labels = c("Masc", "Idade", "Fem"),
      ndig = 5,
    )
  )
  
}

