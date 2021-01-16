# Construindo pirâmides etárias!

#### As pirâmides etárias são gráficos que expressam de forma simples a distribuição demográfica de determinado território.

Técnicamente, pode-se dizer que a pirâmide etária é composta por dois gráficos de barra onde a proporção de 
indivíduos de determinada faixa etária do sexo Masculino e sexo Feminino são representados espelhados na abscissa (eixo X) e as faixas
etárias em ordem crescente na ordenada (eixo Y). Geralmente utilizam-se  as faixas etárias categorizadas de 5 em 5 anos.

São inúmeras as informações que podem ser obtidas pela análise de uma pirâmide etária. De forma superficial, pelo formato da pirâmide é possível captar nuances da dinâmica da unidade territórial em análise. Aspectos em comum com alguns dos indicadores socioeconômicos mais importantes estão "escondidos" no formato da pirâmide. Uma base larga com topo estreito (triangular) indica uma população cujas condições apontam para uma baixa expectativa de vida e uma alta taxa de natalidade por exemplo. Do contrário, pirâmides mais "arredondadas" (barril) indicam uma expectativa de vida maior, menor natalidade e por aí vai...


#### Tendo em vista a importância desse indicador, elaborei um script simples que permite a construção de várias pirâmides etárias ao mesmo tempo. 

No caso, o script está com os parâmetros configurados para receber os dados absolutos de população por faixa etária de todos os 646 munícipios do Estado de São Paulo.
[Os dados foram extraidos do site da Fundação SEADE](http://www.imp.seade.gov.br/frontend/#/tabelas).

A tabela importada do SEADA possuí as faixas etárias separadas por sexo nas linhas e os municípios do Estado de São Paulo nas colunas. A idéia é utilizar o ambiente do RStudio para criar uma função que dê conta de "scanear" a tabela e construir, uma à uma, as pirâmides etárias de todos os municípios. 

Após importar o dataset para o ambiente do R e retirar a coluna do período, nossa primeira ação será transformar os números absolutos de população por faixa etária em porcentagens!

## Importando o arquivo com a função read.csv

```ruby
p_etarias_raw <-
  read.csv2(
    "C:\\Users\\User\\Desktop\\projetos\\piramides_etarias\\p_etarias_estado_sp.csv",
    encoding = "windows-1250",
    sep = ";",
    dec = ",",
    header = TRUE)
```


## Calculando a razão do número absoluto de pessoas de cada faixa etária pela população total do mesmo sexo e multiplicando por 100

```ruby
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
```

## Agora, que nossos dados estão preparados, vamos definir alguns parâmetros gráficos da nossa pirâmide e depois rodar a função que irá criar uma pirâmide para cada um dos 646 municpipios de São Paulo.

```ruby
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
      lxcol = "purple",
      rxcol = "orange2",
      gap = 1.1,
      show.values = FALSE,
      top.labels = c("Masc", "Idade", "Fem"),
      ndig = 3,
    )
  )
  
}

```

## Após poucos minutos, as pirâmide etárias dos 646 municípios estarão na aba de Plots do RStudio com a possibilidade de serem salvos em JPEG ou PDF. Aqui, algumas das pirâmides geradas pelo código:

<img src="https://raw.githubusercontent.com/Luccan97/Piramides_Etarias/master/piramides_GIFS.gif" width=1000>


Eu postei um vídeo no YouTube mostrando com mais detalhes a aplciação do script, caso tenha interesse, [clique aqui](https://www.youtube.com/watch?v=rsTSsNSitAg).


