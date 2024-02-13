getwd()
nuevo_dir<-"C:/pre-estadistica descriptiva"
setwd(nuevo_dir)

#1
x<- c(1,2,3,4,5)
y<- c(9.1,2.4,7.5,1.3,3.4)

Un vector es una estructura de datos unidimensional que almacena tipos de datos
(numericos, cadenas de caracetres y/o lógicos (Si y no, 1-0, True or False)).
Se diferencia de una lista porque esta tiene más de una dimensión.
Ambos vectores tienen una longitud de 5 valores.
Integer hace referencia a valores enteros (Ej:1) y double a valores con decimales. (Ej: 1.5).
Los datos decimales ocupan más memoria en la CPU.

#2
valor_suma<- x+y
print(valor_suma)

valor_resta<- x-y
print(valor_resta)

valor_mult<- x*y
print(valor_mult)

valor_div<- x/y
print(valor_div)

valor_eleva<- x^y
print(valor_eleva)

#3
y^2

#4
y*10

#5
y+25

#6
max(y)

#7
min(y)

#8
abs(9.1)

#9
sqrt(y)

#10
sum(c(y))

#11
lista<-list(c(x,y))
print(lista)
typeof(lista)
str(lista)
View(lista)

Este nuevo objeto tiene una longitud de 10 valores.
R utiliza datos de tipo double 
Eso es a causa de la coercion, la prioridad de un software 
para transformar un tipo de dato a otro.

#12
is.na(lista)

#13
z<-c(29,NA,12,46,73)

#14
mean(z)

El resultado es not assigned, basicamente porque
dentro del vector existe un valor sin ninguna asignación.

Se pordría solucionar sustituyendo NA por un valor numérico.

z<-c(29,45,12,46,73)
mean(z)

#15
matriz1<-matrix(c(24,69,3,90,23,56,1,63,87,21,77,19),
                nrow=4, ncol=3,  
                byrow=TRUE)
print(matriz1)

Los valores numericos se van rellenando por orden en el
que los has metido en la matriz, fila por fila.
  
#16
matriz1<-matrix(nrow=4, ncol=3,
                data= c(24,69,3,90,23,56,1,63,87,21,77,19))
             
print(matriz1)

#17
"a" <-matrix(nrow=3, ncol=3,
            data= c(1,2,3,4,5,6,7,8,9))
                  
"b" <-matrix(nrow=3, ncol=3,
             data= c(10,11,12,13,14,15,16,17,18))

#18
suma_matriz<- a+b
resta_matriz<- a-b

print(suma_matriz)
print(resta_matriz)

Obtenemos un resultado negativo basicamente porque R resta los valores
uno por uno con el que se corresponde en su posicion en la matriz.La matriz a
tiene valores de menor tamaño que la matriz b por lo que resultan en valores 
negativos.

#19
matriz_t<- t(matriz1)
print(matriz_t)

#20
matriz1*2

#21
matriz_mult<- a*b
print(matriz_mult)

#22
elemento <- matriz_mult[2, 3]
print(elemento)

segunda_fila <- matriz_mult[2, ]
print(segunda_fila)

tercera_columna <- matriz_mult[ , 3]
print(tercera_columna)

2a FICHA

#1
set.seed(123)
num_cuentas<-round(rnorm(100, mean=50, sd=10))
print(num_cuentas)

#2
mean(num_cuentas)

#3
median(num_cuentas)

#4
moda<- as.numeric(names(sort(table(num_cuentas), decreasing=TRUE)[1]))
print(paste("La moda de las cuentas en el yacimiento es:", moda))

#5
range(num_cuentas)

#6
quantile(num_cuentas, 0.25)

#7
quantile(num_cuentas, 0.75)

#8
var(num_cuentas)

#9
sd(num_cuentas)

#10
hist(num_cuentas, 
     breaks = 10,  
     col = "skyblue",  
     xlab = "Número de cuentas por yacimiento", 
     ylab = "Frecuencia",  
     main = "Histograma de cuentas por yacimiento")  
#11
boxplot(num_cuentas,
        main = "Diagrama de Cajas de Cuentas por Yacimiento",
        ylab = "Número de cuentas por yacimiento")
#12
densidad <- density(num_cuentas)
plot(densidad, main = "Gráfico de Densidad de Cuentas por Yacimiento",
     xlab = "Número de cuentas por yacimiento", ylab = "Densidad")

#13
barplot(table(num_cuentas), 
        main = "Gráfico de Barras de Cuentas por Yacimiento",
        xlab = "Número de cuentas por yacimiento",
        ylab = "Frecuencia")
#14
tipo_artefacto <- c("piedra", "metal", "cerámica", "madera", "vidrio")
material <- c("oro", "plata", "bronce", "arcilla", "madera", "piedra", "hueso")
periodo_cultural <- c("prehistórico", "antiguo", "medieval", "protohistorico", "moderno")
estado_conservacion <- c("excelente", "bueno", "regular", "deteriorado")
ubicacion_artefacto <- c("museo", "colección privada", "sitio arqueológico")

set.seed(123)
num_cuentas <- lapply(list(tipo_artefacto, material, periodo_cultural, estado_conservacion, ubicacion_artefacto), 
                   function(x) sample(x, 10, replace = TRUE))

tablas_frecuencia <- lapply(num_cuentas, table)

names(tablas_frecuencia) <- c("Tipo de Artefacto", "Material", "Periodo Cultural", "Estado de Conservación", "Ubicación del Artefacto")
for (i in 1:length(tablas_frecuencia)) {
  cat("Tabla de Frecuencias para", names(tablas_frecuencia)[i], ":\n")
  print(tablas_frecuencia[[i]])
  write.table(tablas_frecuencia[[i]], file = paste("tabla_", names(tablas_frecuencia)[i], ".txt", sep = ""), sep = "\t")
}
