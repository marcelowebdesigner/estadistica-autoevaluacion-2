library(dplyr)
library(ggplot2)
library(lubridate)


ruta_csv_local <- "D:/Documentos/Jessica III/Maestría Ciencas de Datos/Curso_Estadistica/Ejercicios_R/Covid19Casos.csv"
print(paste("Leyendo archivo desde:", ruta_csv_local))
datos_covid <- read.csv(ruta_csv_local, header = TRUE)


#Revisar que los datos están bien
if(!is.null(datos_covid))
  print("Procesando los datos...")


#Revisar nombres de columnas
print("Nombres de columnas:")
print(colnames(datos_covid))

tryCatch({
#Filtro de casos confirmados y fallecidos
fallecidos_confirmados <- datos_covid %>%
  filter(clasificacion_resumen == "Confirmado", fallecido == "SI")

#Agrupamiento por semana y contar
fallecidos_por_semana <- fallecidos_confirmados %>%
  group_by(sepi_apertura) %>%
  summarise(total_fallecidos = n()) %>%
  filter(!is.na(sepi_apertura), sepi_apertura > 0)

print("Primeras filas de datos procesados (fallecidos por Semana Epi):")
print(head(fallecidos_por_semana))
procesamiento_exitoso <- TRUE

},
error = function(e) {
  print(paste("Error durante el procesamiento:", e$message))
  print("Verifica los nombres de columnas y valores.")
  procesamiento_exitoso <- FALSE
})

if(exists("fallecidos_por_semana") && nrow(fallecidos_por_semana) > 0) {
  print("Generando gráfico:")
  
  grafico_fallecidos <- ggplot(fallecidos_por_semana, aes(x= sepi_apertura, y= total_fallecidos))+
    geom_line(color = "red")+
    geom_point(color = "darkred", size= 0.5)+
    labs(
      title = "Fallecidos confirmados por Covid-19 por Semana Epidemiológica",
      subtitle = "República Argentina",
      x = "Semana Epidemiológica (apertura de caso)",
      y = "Número de fallecidos",
      caption = "https://sisa.msal.gov.ar/datos/descargas/covid-19/files/Covid19Casos.zip"
    )+
    theme_minimal()+
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) #Mejora legibilidad eje x si hay muchas semanas
  
  print(grafico_fallecidos)
} else {
  print("No se pudo procesar el gráfico.")
}





