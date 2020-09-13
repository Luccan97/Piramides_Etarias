# Pirâmides Etárias

#As pirâmides etárias são gráficos que expressam de forma simples a distribuição demográfico de determinado território.

#Técnicamente pode-se dizer que a pirâmide etária é composta por dois gráficos de barra espelhados onde a proporção de 
#indivíduos de determinada faixa etária do Sexo Masculino e Sexo Feminino são representados na abscissa (eixo X) e as faixas
#etárias na ordenada (eixo Y). Geralmente utiliza-se faixas etárias de 5 em 5 anos.

São inúmeras as informações que podem ser obtidas pela análise de uma pirâmide etária. Ao batermos o olho já sabemos se o território
análisado possuí alta ou baixa expectativa de vida, se estão nascendo muitas crianças, se a população economicamente ativa é maior do que
a população dependente e muitas outros indicadores estão "escondidos" ali.

Tendo em vista a importância desse indicador, elaborei um script simples que permite a construção de quantas pirâmides etárias você quiser simultaneamente.

No caso, o script está com os parâmetros configurados para receber os dados absolutos de população por faixa etária de todos os 645 munícipios do Estado de São Paulo.
Os dados foram extraidos do site da Fundação SEADE http://www.imp.seade.gov.br/frontend/#/tabelas

Creio que a grande benesse deste script é a capacidade de constuir muitas pirâmides de forma rápida e eficiênte. Espero que gostem. 

Agora, gostaria de fazer alguns comentários para quem quiser adaptar o código para outros contextos. 




O Script funcionará bem se fosse organizar as linhas da primeira coluna dos dados da seguinte maneira: 
A primeira LINHA recebendo a população total masculina[1] de cada território, da linha [2] até as [17] temos as populações por faixas etárias  de 5 em 5 anos masculina
Na Linha [18] temos a população total Feminina e da LINHA [19] até [34] temos as faixas etárias!
Nas linhas temos os diversos territórios ( no caso do exemplo, os 645 municipios de São Paulo)

[1] População Masculina

[2] População Masculina de 0 a 4 Anos

População Masculina de 5 a 9 Anos

População Masculina de 10 a 14 Anos

[...]

População Masculina de 70 a 74 Anos

[17] População Masculina de 75 Anos e Mais


[18] População Feminina

[19] População Feminina de 0 a 4 Anos

População Feminina de 5 a 9 Anos

População Feminina de 10 a 14 Anos

[...]

População Feminina de 70 a 74 Anos

[34] População Feminina de 75 Anos e Mais


#Bom agora, vamos ver o Loop For que vai gerar as pirâmides!

Perceba que as posições das linhas que citei acima são parâmetros importantes.

Reparem que nas linhas xy.pop e xx.pop estamos dizendo ao programa aonde estão os nossos dados referentes ao sexo Masculino e Feminino

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






