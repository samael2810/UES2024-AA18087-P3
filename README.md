# Proyecto de Data Warehouse para "Para Volar" - Sistema de Vuelos "Gamatron" - Made by: Samael Arnulfo Agustín Alvayero - AA18087

## Descripción General
Este proyecto consiste en el diseño e implementación de un Data Warehouse (DW) para la empresa aeronáutica **Para Volar**, con el objetivo de analizar y optimizar sus operaciones de vuelos a través del sistema **Gamatron**. El DW permitirá obtener información sobre vuelos cancelados, retrasados y desviados, así como analizar las causas de estas incidencias, proporcionando a la empresa una visión clara y rápida de su rendimiento y eficiencia operativa.
> **Nota Importante**: Por favor, revisa el archivo PDF **DW2024-AA18087** ubicado en la raíz del proyecto. Este documento contiene información esencial sobre la estructura y el propósito del Data Warehouse, así como detalles adicionales importantes para comprender el proyecto en su totalidad.

## Estructura del Proyecto
El modelo dimensional del DW se basa en la granularidad de un vuelo específico, con dimensiones relacionadas con el tiempo y aeropuertos de origen y destino, así como una fact table que almacena datos de vuelos y sus incidencias.

### 1. Tablas Dimensionales
   - **DimFecha**: Contiene la información sobre fechas relevantes para el análisis, incluyendo año, trimestre, mes y día de la semana.
   - **DimAeropuertoOrigen**: Almacena datos del aeropuerto de origen de cada vuelo, como ID del aeropuerto, nombre de la ciudad y estado.
   - **DimAeropuertoDestino**: Almacena datos del aeropuerto de destino de cada vuelo, similar a **DimAeropuertoOrigen**.

### 2. Fact Table (Tabla de Hechos)
   - **Fact_Vuelo**: Contiene los detalles de cada vuelo, incluyendo retrasos, cancelaciones y desvíos, además de los IDs de referencia para las dimensiones **DimFecha**, **DimAeropuertoOrigen** y **DimAeropuertoDestino**.

### 3. Métricas Calculadas
   - **Vuelos Cancelados**: Conteo de vuelos con el campo `Cancelled` marcado.
   - **Vuelos Atrasados**: Conteo de vuelos con valores en `DepDelayMinutes` o `ArrDelayMinutes`.
   - **Vuelos Diferidos**: Conteo de vuelos con el campo `Diverted` marcado.

## Requisitos del Proyecto
- **SQL Server**: El modelo dimensional está implementado en SQL Server, por lo que es necesario un servidor SQL para cargar las tablas y realizar consultas.
- **SSIS**: Se utiliza SSIS para la extracción, transformación y carga de los datos hacia el DW.

## Estructura del Código
El repositorio contiene:
- **Modelo Dimensional**: SQL scripts para crear las tablas de dimensiones y hechos.
- **ETL (SSIS)**: Paquete de SSIS para la carga y transformación de los datos hacia las tablas del DW.
- **PDF**: Documento que explica un poco mas acerca del proceso realizado para el desarrollo del DW.

## Instalación
1. Clona el repositorio:
   ```bash
   https://github.com/samael2810/UES2024-AA18087-P3.git
