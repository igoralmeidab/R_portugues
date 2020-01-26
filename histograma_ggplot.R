#Histograma

#https://youtu.be/j2VoIJ7VrqA

library(tidyverse) # funções do dplyr e ggplot
library(egg) # extensão do ggplot
library(ggthemes) # mais temas para o ggplot


#checar o dataframe
head(iris)

#criar o plot básico
g<- ggplot(iris)

g # apenas prepara o espação para a criação/plotagem do gráfico


#simples
g+
  geom_histogram(aes(Sepal.Length))
  


#mais complexo

g+
  geom_histogram(aes(Sepal.Length),
  bins = 32,
  colour="grey22", fill="grey80")+
  labs(title = "Sepal Length", x="Length", y = "Count", subtitle = "Histogram")+
  theme_article() # tema próprio para artigos acadêmicos do pacote egg

#variação
g+
  geom_histogram(aes(Sepal.Length),
                 bins = 28,
                 colour="grey60", fill="grey22")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência")+
  theme_bw() # tema do próprio ggplot


# composto

g+
  geom_histogram(aes(Sepal.Length),
                 bins = 28,
                 colour="grey22", fill = "grey80")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência")+
  theme_bw()+
  facet_grid(~Species)


#variação
g+
  geom_histogram(aes(Sepal.Length),
                 bins = 40,
                 colour="grey22", fill = "grey80")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência")+
  theme_article()+
  facet_grid(~Species)


#colorido

g+
  geom_histogram(aes(Sepal.Length, fill= Species),
                 bins = 28,
                 colour="grey22")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência", fill = "Espécie")+
  theme_fivethirtyeight()+
  scale_fill_fivethirtyeight ()+
  facet_grid(~Species)


#variação
g+ 
  geom_histogram(aes(Petal.Length,fill=Species),binwidth=0.1,alpha=0.3,colour="black")+
labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência", fill = "Espécie")+
  theme_article()+
  scale_fill_fivethirtyeight ()



# jornalismo / blog / apresentação / etc
g+
  geom_histogram(aes(Sepal.Length, fill= Species),
                 bins = 28,
                 colour="grey22")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência", fill = "Espécie")+
  theme_economist()+
  scale_fill_economist()+
  facet_grid(~Species)

  

g+
  geom_histogram(aes(Sepal.Length, fill= Species),
                 bins = 28,
                 colour="grey22")+
  labs(title = "Comprimento da Sépala", x="Comprimento", y = "Frequência", fill = "Espécie")+
  theme_wsj()+# Wall Street Journal
  scale_fill_wsj()+ # Wall Street Journal
  facet_grid(~Species)


