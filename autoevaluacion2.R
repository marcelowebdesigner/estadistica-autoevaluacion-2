#Construye un vector llamado x con los elementos: 4, NA, 2 y 1.

x=c(2,4,NA,6)
#Calcule la media del vector anterior (del paso 1).
mean(x,na.rm=TRUE)
#Selecciona los elementos mayores a 3 del vector anterior (del paso 2).
x=x[x>3& !is.na(x)]
x
#Cargue los datos “trees” del dataset (el conjunto de datos que viene instalado por defecto en R) y observe su encabezado.
data(trees)
head(trees)
#Instala el la biblioteca "vegan", actívalo y carga la base de datos "eurodist". Solicita ayuda en el entorno R para conocerlo y cuéntanos de que trata dicha base de datos. 
install.packages("vegan")
library("vegan")
data("eurodist")
?eurodist
?vegan
#mporta el archivo movie.txt y guárdalo en un objeto que se llame "data_movie_txt"
data_movie <- read.table("movies.txt", 
                   header = TRUE,         # Indica que la primera fila contiene nombres de columnas
                   sep = "\t",            # Usa tabulaciones como separadores
                   dec = ".",             # Los decimales están representados con un punto
                   quote = "\"",          # Las comillas dobles en el texto son manejadas
                   comment.char = "",     # No interpreta ninguna cadena como comentarios
                   na.strings = "Na"      # Trata "Na" como valores faltantes
)
data_movie
#mporta el archivo movie.xlsx y guárdalo en un objeto que se llame "data_movie_xlsx"
library(readxl)

# Leer el archivo Excel
data_movie_xlsx <- read_excel("movie.xlsx")

# Ver los primeros datos
head(data_movie_xlsx)
#importa el archivo 2004_temperatura del suelo.csv y guárdalo en un objeto llamado "temperatura_suelo". 
temperatura_suelo<-read.csv("temperatura_suelo.csv")
head(temperatura_suelo)
