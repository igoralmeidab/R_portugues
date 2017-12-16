#anova
#one way

data("ToothGrowth")
library(jmv)
library(tidyverse)


descriptives(ToothGrowth,vars= c("len","dose"))

#teste
anova(ToothGrowth, dep = 'len', factors = 'dose')

#mais completo
anova(ToothGrowth, #dado
      dep = 'len', #variável dependente
      factors = c('supp', 'dose'), # variáveis independentes
      effectSize = 'eta', # effect size / tamanho do efeito
      postHoc = c('supp', 'dose'), #teste post Hoc 
      plotHAxis = 'dose', # gráfico eixo x
      plotSepLines = 'supp', #gráfico separação linhas
      descStats = TRUE, # estatística descritiva
      homo = TRUE) #teste de Levene para homogeneidade dos dados (p>0.05)


#gráfico
graf<- ToothGrowth %>% group_by(dose) %>% summarise(media = mean(len), sd = sd(len))

#gráfico de barras
ggplot(graf) + geom_col(aes(x=as.factor(dose),y=media),colour="black",fill=c("grey50"))+ 
  geom_errorbar(aes(x=as.factor(dose),ymax=media+sd,ymin=media-sd),position="dodge")+
  theme_bw()+
  labs(title="Análise ANOVA do dataset ToothGrowth",x= "Dose", y="Média de crescimento")


#gráfico de linha

ggplot(graf) + geom_line(aes(x=dose,y=media))  +
  geom_pointrange(aes(x=dose,y=media,ymin=media-sd,ymax=media+sd))+
  theme_bw()+
  labs(title="Análise ANOVA do dataset ToothGrowth",x= "Dose", y="Média de crescimento")



