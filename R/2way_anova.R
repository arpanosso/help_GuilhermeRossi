############ Delineamento Inteiramente Casualizado - DIC ############
############    Script para Análise da Variancia – DIC   ############

######## ----------------- Entrada de dados  ---------------- ########
Entre os dados: Tratamentos - TR e Observações 
F<-read.table("soybean peroxide_2way.txt", h=T)
F

analise<-aov(Peroxide~factor(Water)*factor(Soybean),data=F)

analise

anova(analise)
### fim do teste anova 2 fatores

## Carregue o script "Contrastes para um Fator"(se for o caso).