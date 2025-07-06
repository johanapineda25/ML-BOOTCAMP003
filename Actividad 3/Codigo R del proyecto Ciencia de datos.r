{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "ff63078a-3dbe-4f77-87f1-20207406badc",
   "metadata": {},
   "source": [
    "## Codigo R del proyecto \n",
    "## Proyecto de Ciencia de Datos: Integración Python + R¶"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b9634a17-1063-475f-82bd-cc95e0fe0a31",
   "metadata": {},
   "source": [
    "## Transferir datos a R y análisis con dplyr y ggplot2"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "2769bd73-75bd-4932-9711-32515370b679",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Librerias R (instalar en consola R)\n",
    "install.packages(\"ggplot2\")   # Crear gráficos profesionales (barras, líneas, cajas, dispersión, mapas, etc.).\n",
    "install.packages(\"dplyr\")    # Filtrar, seleccionar columnas, agrupar, resumir, ordenar datos fácilmente.\n",
    "install.packages(\"readr\")   # Cargar datasets rápidamente para análisis. Más rápido y limpio que funciones base de R.\n",
    "install.packages(\"lubridate\") # Extraer año, mes, día, comparar fechas, convertir strings a fechas, operaciones con fechas."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "ac5bc5bc-28b8-4e16-ab97-9aff6b0a9e58",
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Adjuntando el paquete: 'dplyr'\n",
      "\n",
      "\n",
      "The following objects are masked from 'package:stats':\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from 'package:base':\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# R. Carga de librerías en R\n",
    "library(dplyr)\n",
    "library(ggplot2)\n",
    "library(readr)  # Para leer archivos CSV de forma eficiente"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "b1267b16-6e04-4608-b0e9-6de039719d70",
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m50530\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m5\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[32mdbl\u001b[39m  (4): LV ActivePower (kW), Wind Speed (m/s), Theoretical_Power_Curve (KW...\n",
      "\u001b[34mdttm\u001b[39m (1): Date/Time\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 50,530\n",
      "Columns: 5\n",
      "$ `Date/Time`                     \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2018-01-01 00:00:00\u001b[90m, \u001b[39m2018-01-01 00:10…\n",
      "$ `LV ActivePower (kW)`           \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 380.0478\u001b[90m, \u001b[39m453.7692\u001b[90m, \u001b[39m306.3766\u001b[90m, \u001b[39m419.6459…\n",
      "$ `Wind Speed (m/s)`              \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 5.311336\u001b[90m, \u001b[39m5.672167\u001b[90m, \u001b[39m5.216037\u001b[90m, \u001b[39m5.659674…\n",
      "$ `Theoretical_Power_Curve (KWh)` \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 416.3289\u001b[90m, \u001b[39m519.9175\u001b[90m, \u001b[39m390.9000\u001b[90m, \u001b[39m516.1276…\n",
      "$ `Wind Direction (°)`            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 259.9949\u001b[90m, \u001b[39m268.6411\u001b[90m, \u001b[39m272.5648\u001b[90m, \u001b[39m271.2581…\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Date/Time</th><th scope=col>LV ActivePower (kW)</th><th scope=col>Wind Speed (m/s)</th><th scope=col>Theoretical_Power_Curve (KWh)</th><th scope=col>Wind Direction (°)</th></tr>\n",
       "\t<tr><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2018-01-01 00:00:00</td><td>380.0478</td><td>5.311336</td><td>416.3289</td><td>259.9949</td></tr>\n",
       "\t<tr><td>2018-01-01 00:10:00</td><td>453.7692</td><td>5.672167</td><td>519.9175</td><td>268.6411</td></tr>\n",
       "\t<tr><td>2018-01-01 00:20:00</td><td>306.3766</td><td>5.216037</td><td>390.9000</td><td>272.5648</td></tr>\n",
       "\t<tr><td>2018-01-01 00:30:00</td><td>419.6459</td><td>5.659674</td><td>516.1276</td><td>271.2581</td></tr>\n",
       "\t<tr><td>2018-01-01 00:40:00</td><td>380.6507</td><td>5.577941</td><td>491.7030</td><td>265.6743</td></tr>\n",
       "\t<tr><td>2018-01-01 00:50:00</td><td>402.3920</td><td>5.604052</td><td>499.4364</td><td>264.5786</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Date/Time & LV ActivePower (kW) & Wind Speed (m/s) & Theoretical\\_Power\\_Curve (KWh) & Wind Direction (°)\\\\\n",
       " <dttm> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 2018-01-01 00:00:00 & 380.0478 & 5.311336 & 416.3289 & 259.9949\\\\\n",
       "\t 2018-01-01 00:10:00 & 453.7692 & 5.672167 & 519.9175 & 268.6411\\\\\n",
       "\t 2018-01-01 00:20:00 & 306.3766 & 5.216037 & 390.9000 & 272.5648\\\\\n",
       "\t 2018-01-01 00:30:00 & 419.6459 & 5.659674 & 516.1276 & 271.2581\\\\\n",
       "\t 2018-01-01 00:40:00 & 380.6507 & 5.577941 & 491.7030 & 265.6743\\\\\n",
       "\t 2018-01-01 00:50:00 & 402.3920 & 5.604052 & 499.4364 & 264.5786\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 5\n",
       "\n",
       "| Date/Time &lt;dttm&gt; | LV ActivePower (kW) &lt;dbl&gt; | Wind Speed (m/s) &lt;dbl&gt; | Theoretical_Power_Curve (KWh) &lt;dbl&gt; | Wind Direction (°) &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 2018-01-01 00:00:00 | 380.0478 | 5.311336 | 416.3289 | 259.9949 |\n",
       "| 2018-01-01 00:10:00 | 453.7692 | 5.672167 | 519.9175 | 268.6411 |\n",
       "| 2018-01-01 00:20:00 | 306.3766 | 5.216037 | 390.9000 | 272.5648 |\n",
       "| 2018-01-01 00:30:00 | 419.6459 | 5.659674 | 516.1276 | 271.2581 |\n",
       "| 2018-01-01 00:40:00 | 380.6507 | 5.577941 | 491.7030 | 265.6743 |\n",
       "| 2018-01-01 00:50:00 | 402.3920 | 5.604052 | 499.4364 | 264.5786 |\n",
       "\n"
      ],
      "text/plain": [
       "  Date/Time           LV ActivePower (kW) Wind Speed (m/s)\n",
       "1 2018-01-01 00:00:00 380.0478            5.311336        \n",
       "2 2018-01-01 00:10:00 453.7692            5.672167        \n",
       "3 2018-01-01 00:20:00 306.3766            5.216037        \n",
       "4 2018-01-01 00:30:00 419.6459            5.659674        \n",
       "5 2018-01-01 00:40:00 380.6507            5.577941        \n",
       "6 2018-01-01 00:50:00 402.3920            5.604052        \n",
       "  Theoretical_Power_Curve (KWh) Wind Direction (°)\n",
       "1 416.3289                      259.9949          \n",
       "2 519.9175                      268.6411          \n",
       "3 390.9000                      272.5648          \n",
       "4 516.1276                      271.2581          \n",
       "5 491.7030                      265.6743          \n",
       "6 499.4364                      264.5786          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# R. Carga del archivo limpio generado desde Python\n",
    "# Leer archivo limpio\n",
    "energy_data <- read_csv(\"energy_clean.csv\")\n",
    "\n",
    "# Ver estructura y primeras filas\n",
    "glimpse(energy_data)\n",
    "head(energy_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ad53705c-a18e-44a7-a5ac-e381c0abf676",
   "metadata": {},
   "source": [
    "# R. Validación rápida en R (opcional)\n",
    "Aunque ya se limpió en Python, siempre se procede a validar desde R para asegurar integridad"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "1c9d0614-06f5-42f6-8fac-fa860469228c",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>Date/Time</dt><dd>30544</dd><dt>LV ActivePower (kW)</dt><dd>0</dd><dt>Wind Speed (m/s)</dt><dd>0</dd><dt>Theoretical_Power_Curve (KWh)</dt><dd>0</dd><dt>Wind Direction (°)</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[Date/Time] 30544\n",
       "\\item[LV ActivePower (kW)] 0\n",
       "\\item[Wind Speed (m/s)] 0\n",
       "\\item[Theoretical\\textbackslash{}\\_Power\\textbackslash{}\\_Curve (KWh)] 0\n",
       "\\item[Wind Direction (°)] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "Date/Time\n",
       ":   30544LV ActivePower (kW)\n",
       ":   0Wind Speed (m/s)\n",
       ":   0Theoretical_Power_Curve (KWh)\n",
       ":   0Wind Direction (°)\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "                    Date/Time           LV ActivePower (kW) \n",
       "                        30544                             0 \n",
       "             Wind Speed (m/s) Theoretical_Power_Curve (KWh) \n",
       "                            0                             0 \n",
       "           Wind Direction (°) \n",
       "                            0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# R. Comprobar si hay valores NA\n",
    "colSums(is.na(energy_data))\n",
    "\n",
    "# Comprobar duplicados\n",
    "nrow(energy_data) == nrow(distinct(energy_data))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0e6a231a-5bb0-4f13-bf12-9638d474639d",
   "metadata": {},
   "source": [
    "# R. Análisis exploratorio con dplyr + ggplot2\n",
    "## Agrupación por fecha y promedio de consumo teórico"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "4719da46-bb6e-4013-a41d-75082f5994f3",
   "metadata": {},
   "outputs": [],
   "source": [
    "# R. Agrupar por fecha y calcular promedio de consumo\n",
    "consumo_diario <- energy_data %>%\n",
    "  group_by(`Date/Time` = as.Date(`Date/Time`)) %>%\n",
    "  summarise(promedio_consumo = mean(`Theoretical_Power_Curve (KWh)`, na.rm = TRUE))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "399df119-7115-4cd0-bfc7-9f3b59860e6c",
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\nCMsUAAAAAElFTkSuQmCC",
      "text/plain": [
       "plot without title"
      ]
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# R. Gráfica de línea del consumo energético\n",
    "#limpiar las filas con NA para que la grafica considere a todas.\n",
    "consumo_diario <- consumo_diario %>%\n",
    "  filter(!is.na(`Date/Time`) & !is.na(promedio_consumo))\n",
    "\n",
    "# Graficando\n",
    "ggplot(consumo_diario, aes(x = `Date/Time`, y = promedio_consumo)) +\n",
    "  geom_line(color = \"steelblue\") +\n",
    "  labs(title = \"Promedio Diario de Consumo Energético\",\n",
    "       x = \"Fecha\", y = \"Consumo Teórico (KWh)\") +\n",
    "  theme_minimal()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "11ecf21a-2b2d-4705-9318-9219a39bcf5a",
   "metadata": {},
   "source": [
    "## Resultados y conclusión\n",
    "Este bloque realiza la transferencia efectiva de datos desde Python hacia R mediante el archivo energy_clean.csv, y permite:\n",
    "* Continuar el análisis en R.\n",
    "* Aplicar transformación de datos con dplyr.\n",
    "* Visualizar patrones temporales con ggplot2."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "357a4359-988b-4961-9b90-49fc6ffa2c9f",
   "metadata": {},
   "source": [
    "## Conclusión de toda la solución del proyecto\n",
    "El objetivo principal de este análisis fué realizar una exploración, limpieza, transformación y visualización integral del consumo teórico de energía a partir de datos recolectados en tiempo, mediante el uso combinado de Python y R, aprovechando las fortalezas específicas de cada lenguaje en el ciclo de ciencia de datos. En la primera etapa, implementada en Python, se ejecutó un proceso sistemático de:\n",
    "\n",
    "* Carga y validación estructural del dataset (energy_consumption.csv),\n",
    "* Limpieza de datos, eliminando duplicados y valores nulos,\n",
    "* Conversión de formatos de fecha y\n",
    "* Exportación de un dataset depurado (energy_clean.csv) como punto de entrada confiable para etapas posteriores.\n",
    "La segunda etapa, desarrollada en R, tuvo como propósito:\n",
    "\n",
    "* Importar el dataset limpio,\n",
    "* Realizar una transformación temporal y estadística con dplyr,\n",
    "* Generar una visualización significativa con ggplot2 que permita identificar tendencias y patrones de consumo energético a lo largo del tiempo.\n",
    "\n",
    "Esta estrategia cruzada entre Python y R maximiza la eficiencia analítica, permitiendo una separación clara entre la limpieza estructural de datos (Python) y el análisis visual y descriptivo más avanzado (R), orientado a la toma de decisiones en entornos donde se monitorea el rendimiento energético."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.5.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
