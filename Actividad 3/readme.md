## Informe del proyecto
# Análisis de Consumo Energético Integrado con Python y R

## Descripción

Este proyecto aborda el análisis del consumo teórico de energía mediante un enfoque integrado que combina Python y R para maximizar la eficiencia y profundidad del análisis.

# En la primera etapa, realizada en Python:
se ejecutó la carga, validación y limpieza de datos, eliminando duplicados y valores faltantes, y convirtiendo formatos de fecha para asegurar la calidad del dataset. Se generó un archivo limpio `energy_clean.csv` como base para el análisis posterior.

# La segunda etapa, en R, se utilizó `dplyr`:
para la transformación y resumen estadístico, y `ggplot2` para visualización de tendencias temporales, permitiendo identificar patrones y comportamientos en el consumo energético a lo largo del tiempo.

## Estructura del Proyecto

- `energy_consumption.csv`  
  Dataset original con registros de consumo energético.

- `energy_clean.csv`  
  Dataset limpio y preprocesado generado en Python.

- Actividad 3. Integración Python + R.ipynb 
  Notebook Python para carga y limpieza de datos.

- Codigo R del proyecto Ciencia de datos.R  
  Script en R para análisis y visualización con `dplyr` y `ggplot2`.

## Tecnologías y Librerías

- **Python:** pandas, matplotlib  
- **R:** dplyr, ggplot2, readr

## Objetivo del Proyecto

Implementar un flujo de trabajo integral para analizar el consumo energético, utilizando las capacidades de Python para preprocesamiento y R para análisis estadístico y visualización, con el fin de generar información confiable para la toma de decisiones estratégicas.

## Hallazgos y Análisis General

- Se identificó que el dataset original contenía registros duplicados y valores faltantes, los cuales fueron limpiados para asegurar un análisis robusto.
- La conversión adecuada de formatos de fecha permitió agrupar el consumo energético por día, facilitando un análisis temporal significativo.
- El análisis en R reveló tendencias en el consumo promedio diario, mostrando patrones que podrían estar relacionados con variables externas como velocidad del viento y condiciones ambientales (esto abre oportunidades para análisis más profundos o modelado predictivo).
- La visualización mediante gráficos de líneas permitió identificar fluctuaciones y estacionalidades en el consumo, clave para estrategias de optimización energética.

## Conclusiones

- La combinación de Python y R en el proceso analítico facilita una gestión eficiente del ciclo de datos, desde la limpieza hasta la visualización avanzada.
- La limpieza previa en Python garantiza la integridad de los datos para análisis posteriores en R, minimizando errores y optimizando tiempo.
- La aplicación de `dplyr` y `ggplot2` en R permite realizar análisis descriptivos y gráficos claros que apoyan la interpretación de tendencias y patrones en datos temporales.
- Este enfoque metodológico puede ser replicado y escalado para otros datasets de energía o contextos similares donde se requiera análisis integral y confiable.

## Instrucciones para Ejecutar

1. Ejecutar el notebook `Actividad 3. Integración Python + R.ipynb` para limpiar y preparar los datos.
2. Ejecutar el script `Codigo R del proyecto Ciencia de datos.R` en un entorno R para realizar el análisis y generar visualizaciones.

## Notas

- Asegúrese de tener instalados los paquetes necesarios en Python y R.
- Para entornos Jupyter que mezclan Python y R, se recomienda usar `rpy2`.

---

## Contacto

Para consultas o sugerencias, contactar a [tu correo o perfil].

