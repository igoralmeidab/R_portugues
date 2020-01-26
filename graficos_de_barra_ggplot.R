#Gráficos de barra
#Histograma

https://youtu.be/sPGnNkke9Fw

library(tidyverse)
library(egg)
library(ggthemes)

?ToothGrowth
head(ToothGrowth )

#Preparando dados
g<- ToothGrowth %>% group_by(supp) %>%
  summarise(m = mean(len),s = sd(len))

#gráfico simples
g %>% ggplot()+
  geom_col(aes(x=supp,y = m))

#gráfico complexo
g %>% ggplot()+
  geom_col(aes(x=supp,y = m),fill= "grey80", colour="black")+
 theme_article()  +
  labs(title ="Média de crescimento dentário por tipo de suplemento",
       x="Suplemento", y= "Média")


#Gráfico com mais uma divisão e barra de erro

#dados
g<- ToothGrowth %>% group_by(supp,dose) %>%
  summarise(m = mean(len),d = sd(len))


#gráfico
g %>% ggplot()+
 geom_col(aes(x=as.character(dose),y = m ,fill= supp), position = "dodge", colour="black")+
 geom_errorbar(aes(as.character(dose),ymin = m,ymax=m+d ,group= supp),
                position = "dodge")+
    theme_article()  +
  scale_fill_manual(values = c("grey30","grey80")) +
  labs(title ="Crescimento dentário por tipo de suplemento",
       x="Dose", y= "Crescimento dentário", fill = "Suplemento",
       caption = "C. I. Bliss (1952). The Statistics of Bioassay. Academic Press.")
  

#variação 
g %>% ggplot()+
  geom_col(aes(x=as.character(dose),y =m ,fill= supp,group = supp), position = "dodge", colour="black")+
  geom_errorbar(aes(as.character(dose),ymin =m-d,ymax=m+d ,group= supp),
                position = "dodge")+
  theme_calc()  + 
  scale_fill_brewer(type= "qual",palette=4 )+
  labs(title ="Crescimento dentário por tipo de suplemento",
       x="Dose", y= "Crescimento dentário", fill = "Suplemento")
