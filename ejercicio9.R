# Cargar las librerías necesarias
library(readr)   # Para leer el archivo CSV
library(ggplot2) # Para la visualización gráfica
library(dplyr)   # Para manipulación de datos

# Leer el archivo CSV
covid_data <- read.csv("D:\\maestria\\Estadistica\\autoevaluacion2grupal\\Covid19Casos.csv")

# Verificar los nombres de las columnas
colnames(covid_data)

# Filtrar las primeras 1,000 filas (o puedes usar una muestra aleatoria de 1,000)
covid_data_sample <- covid_data[1:1000, ]  # Primeras 1,000 filas
# Alternativamente, para una muestra aleatoria:
# set.seed(123)  # Para asegurar que la muestra sea reproducible
# covid_data_sample <- covid_data[sample(1:nrow(covid_data), 1000), ]

# Asegurarse de que las columnas están en el formato adecuado
covid_data_sample <- covid_data_sample %>%
  mutate(fecha_diagnostico = as.Date(fecha_diagnostico, format="%Y-%m-%d")) # Asegurarse de que la fecha está en formato Date

# Graficar con las 1,000 filas
ggplot(covid_data_sample, aes(x = fecha_diagnostico, y = edad)) +
  geom_point(color = "blue") +  # Usamos puntos azules para representar los datos
  labs(title = "Evolución de la Edad de Pacientes con COVID-19 en Argentina",  # Título del gráfico
       x = "Fecha de Diagnóstico",    # Etiqueta del eje X
       y = "Edad de los Pacientes") +  # Etiqueta del eje Y
  theme_minimal()  # Estilo de gráfico minimalista

