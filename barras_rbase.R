# Gráfico de barra com Rbase

# https://youtu.be/8FEVt-qnZMs

#mais simples
dados<- 4:8

barplot(dados)

#adicionando legendas e idenficações

names(dados)<- 1:5
barplot(dados)

names(dados)<- c("a","b","c","d","e")
names(dados)<- c("abacate","berinjela","cebola","dados","elefante")
barplot(dados)


barplot(dados, xlab= "legenda eixo x", ylab = "legenda eixo y", main = "título")


#cores e bordas

barplot(dados,col = "blue") # col para cores, nome das cores

barplot(dados,col = c("blue","red","orange","white","black")) # 


barplot(dados,border= "#FF00FF", col = "#FFFFFF") #border para borda, sistema RBG


#transformando dados em gráficos rapidamente

data()

laranja<- Orange
porco<- ToothGrowth

#média de crescimento dentes por vitamina C
tapply(porco$len,porco$supp,mean)

barplot(tapply(porco$len,porco$supp,mean))

#circunferencia laranjeiras por idade
tapply(laranja$circumference,laranja$age,mean)

barplot(tapply(laranja$circumference,laranja$age,mean))

#gráficos mais completos
barplot(tapply(laranja$circumference,laranja$age,mean),
        col = "sienna1",border= "black" ,
        xlab= "Idade da árvore",ylab= "Circunferência", main = "Circunferência de laranjeiras por idade")


barplot(tapply(porco$len,porco$supp,mean),
        col = "slategray1",border= "blue" ,
        xlab= "Vitamina C",ylab= "Tamanho do dente", main = "Dentes de porquinho-da-índia que consomem vitamina C")
