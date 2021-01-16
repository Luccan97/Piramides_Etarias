# Construindo pirâmides etárias!

#### As pirâmides etárias são gráficos que expressam de forma simples a distribuição demográfica de determinado território.

Técnicamente pode-se dizer que a pirâmide etária é composta por dois gráficos de barra espelhados onde a proporção de 
indivíduos de determinada faixa etária do Sexo Masculino e Sexo Feminino são representados na abscissa (eixo X) e as faixas
etárias na ordenada (eixo Y). Geralmente utiliza-se faixas etárias de 5 em 5 anos.

São inúmeras as informações que podem ser obtidas pela análise de uma pirâmide etária. Ao batermos o olho já sabemos se o território
analisado possuí alta ou baixa expectativa de vida, se estão nascendo muitas crianças, se a população economicamente ativa é maior do que
a população dependente e etc... Também, muitos outros indicadores estão "escondidos" ali.

####  Tendo em vista a importância desse indicador, elaborei um script simples que permite a construção de quantas pirâmides etárias você quiser simultaneamente.

No caso, o script está com os parâmetros configurados para receber os dados absolutos de população por faixa etária de todos os 645 munícipios do Estado de São Paulo.
[Os dados foram extraidos do site da Fundação SEADE](http://www.imp.seade.gov.br/frontend/#/tabelas).


> Após importar o dataset para o ambiente do R e retirar a coluna do período, nossa primeira ação será transformar os números absolutos de população em proporções!

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

## Agora, vamos definir alguns parâmetros gráficos da nossa pirâmide e depois rodar a função que irá criar uma pirâmide para cada um dos 646 municpipios de São Paulo.

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
## Aqui, algumas das pirâmides geradas pelo código:

![Alt-text](https://github.com/Luccan97/Piramides_Etarias/blob/master/piramides_GIFS.gif)




Bom, espero que olhando o script, que é bem simples, vocês logrem fazer pirâmides etárias e adaptar para outros dados!
Deixei dois arquivos com bases populacionais no repositório, um dos munícipios e outro dos distritos administrativos do munícipio de São Paulo!
