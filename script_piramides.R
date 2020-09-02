
      #Plotando pirâmides etárias com facilidade de forma ágil para vários territórios simultaneamente!


#Pacotes que serão necessários, lembrando, caso não os tenha instalado retire o # e rode as linhas abaixo

#install.package("plotrix")
#install.package("GetoptLong")
#install.package("tidyverse")

library(plotrix)
library(GetoptLong)
library(tidyverse)


#Importando base de dados com valores absolutos estimados para 2020 
#produzidos pela Fundação SEADE 

p_etarias_raw <-
  read.csv2(
    "C:\\Users\\User\\Desktop\\projetos\\piramides_etarias\\p_etarias_estado_sp.csv",
    encoding = "windows-1250",
    sep = ";",
    dec = ",",
    header = TRUE)

view(p_etarias_raw)

# A coluna "Períodos" pode ser desconsiderada!

p_etarias <- p_etarias_raw[,2:99]

# Para o código funcionar de forma eficiente, é preciso transformar os números absolutos
# de população para cada território em uma porcentagem, onde o denominador será a população
# total de cada Sexo no determinado território.

#Reparem que as linhas 1 e 19 representam a população total Masculina e Feminina respectivamente

# Linhas 2 a 17 ( Faixas etárias Masculinas)
# Linhas 19 a 34 (Faixas etárias Femininas)



dataset_length <- length(names(p_etarias))

for (a in 2:dataset_length) {
  p_etarias[2,a] <- (p_etarias[2,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[3,a] <- (p_etarias[3,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[4,a] <- (p_etarias[4,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[5,a] <- (p_etarias[5,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[6,a] <- (p_etarias[6,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[7,a] <- (p_etarias[7,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[8,a] <- (p_etarias[8,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[9,a] <- (p_etarias[9,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[10,a] <- (p_etarias[10,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[11,a] <- (p_etarias[11,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[12,a] <- (p_etarias[12,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[13,a] <- (p_etarias[13,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[14,a] <- (p_etarias[14,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[15,a] <- (p_etarias[15,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[16,a] <- (p_etarias[17,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[17,a] <- (p_etarias[17,a]/sum(p_etarias[1,a]) * 100)
  p_etarias[19,a] <- (p_etarias[19,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[20,a] <- (p_etarias[20,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[21,a] <- (p_etarias[21,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[22,a] <- (p_etarias[22,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[23,a] <- (p_etarias[23,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[24,a] <- (p_etarias[24,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[25,a] <- (p_etarias[25,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[26,a] <- (p_etarias[26,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[27,a] <- (p_etarias[27,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[28,a] <- (p_etarias[28,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[29,a] <- (p_etarias[29,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[30,a] <- (p_etarias[30,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[31,a] <- (p_etarias[31,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[32,a] <- (p_etarias[32,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[33,a] <- (p_etarias[33,a]/sum(p_etarias[18,a]) * 100)
  p_etarias[34,a] <- (p_etarias[34,a]/sum(p_etarias[18,a]) * 100)
}

# Agora que transformamos todos os números absolutos em porcentagem, vamos construir as pirâmides estárias


#Definindo os rótulos das categorias de faixa etária

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

#Definindo as cores das barras
mcol <- color.id('#5882FA')
fcol <- color.id('#FE2E2E')

# Loop que irá construir uma pirâmide etária para cada coluna (território)!
# É possível alterar características visuais das pirâmides ( cores, espaços, título)

for (i in 2:dataset_length) {
  
  xy.pop <- c(p_etarias[2:17, i])
  xx.pop <- c(p_etarias[19:34, i])
  
  municipality_name = names(p_etarias[i])
  
  piramide1 <- par(
    mar = pyramid.plot(
      xy.pop,
      xx.pop,
      labels = agelabels,
      main = qq("Pirâmide Etária @{municipality_name}"),
      lxcol = mcol,
      rxcol = fcol,
      gap = 1.3,
      show.values = FALSE,
      top.labels = c("Masc", "Idade", "Fem"),
      ndig = 3,
    )
  )
  
}

# Todas as pirâmides foram constrúidas, basta navegar pela aba Plots do RStudio e exportá-las!
# Lembrando que esse código funciona para qualquer base de dados do SEADE, basta seguir os mesmos
# parâmetros na hora da importação.

# Aproveitem!!

# Autor: Lucca Nielsen 
