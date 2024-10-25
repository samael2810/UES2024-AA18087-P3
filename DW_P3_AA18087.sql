create database DW_AA18087_PARCIAL3
go

use DW_AA18087_PARCIAL3
go


CREATE TABLE Dim_Aeropuerto_Destino (
    AeropuertoDestinoID INT IDENTITY(1,1) PRIMARY KEY,
    DestAirportID INT,
    Dest VARCHAR(50),
    DestCityName VARCHAR(100),
    DestState VARCHAR(50),
    DestStateName VARCHAR(50),
    DestWac INT
);


CREATE TABLE Dim_Aeropuerto_Origen (
    AeropuertoOrigenID INT IDENTITY(1,1) PRIMARY KEY,
    OriginAirportID INT,
    Origin VARCHAR(50),
    OriginCityName VARCHAR(100),
    OriginState VARCHAR(50),
    OriginStateName VARCHAR(50),
    OriginWac INT
);


CREATE TABLE Dim_Tiempo (
    TiempoID INT NOT NULL PRIMARY KEY, --Formato ISO AAAAMMDD
    Year INT,
    Quarter INT,
    Month INT,
    DayofMonth INT,
    DayOfWeek INT,
    FlightDate DATE
);

CREATE TABLE Fact_Vuelo (
    VueloID INT IDENTITY(1,1) PRIMARY KEY,
    Flight_Number_Operating_Airline VARCHAR(50),
    DepDelayMinutes INT,
    ArrDelayMinutes INT,
    Cancelled BIT,
    Diverted BIT,
	Marketing_Airline_Network VARCHAR(50),
    IATA_Code_Marketing_Airline VARCHAR(50),
    Operating_Airline VARCHAR(50),
    IATA_Code_Operating_Airline VARCHAR(50),
	CarrierDelay VARCHAR(50),       -- Minutos de retraso por problemas de la aerolínea
    WeatherDelay VARCHAR(50),       -- Minutos de retraso por condiciones meteorológicas
    NASDelay VARCHAR(50),           -- Minutos de retraso por el Sistema Nacional del Espacio Aéreo (NAS)
    SecurityDelay VARCHAR(50),      -- Minutos de retraso por razones de seguridad
    LateAircraftDelay VARCHAR(50),  -- Minutos de retraso por llegada tardía de la aeronave
    CancellationCode VARCHAR(50),    -- Código de cancelación
    TiempoID INT FOREIGN KEY REFERENCES Dim_Tiempo(TiempoID),
    AeropuertoOrigenID INT FOREIGN KEY REFERENCES Dim_Aeropuerto_Origen(AeropuertoOrigenID),
    AeropuertoDestinoID INT FOREIGN KEY REFERENCES Dim_Aeropuerto_Destino(AeropuertoDestinoID)
);



