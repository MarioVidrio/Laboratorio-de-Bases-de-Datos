--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      Practica5_MV.DM1
-- Author :       alumno
--
-- Date Created : Tuesday, March 31, 2026 18:31:45
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: categoria 
--

CREATE TABLE categoria(
    nombre                      char(10)    NOT NULL,
    descripcion                 char(10),
    CONSTRAINT "PK7" PRIMARY KEY (nombre)
)
;



-- 
-- TABLE: comite_votacion 
--

CREATE TABLE comite_votacion(
    nombre_miembro    char(10)    NOT NULL,
    experiencia       char(10),
    nombre            char(10),
    CONSTRAINT "PK6" PRIMARY KEY (nombre_miembro)
)
;



-- 
-- TABLE: "Equipo_clasificado" 
--

CREATE TABLE "Equipo_clasificado"(
    nombre                 char(10)    NOT NULL,
    fecha_fundacion        char(10),
    valor_millones         char(10),
    division               char(10),
    año_ingreso            char(10),
    fecha_clasificacion    char(10),
    gano_campeonato        bit(10),
    trofeo_aspirado        char(10),
    reseña_historica       char(10),
    CONSTRAINT "PK1" PRIMARY KEY (nombre)
)
;



-- 
-- TABLE: "Grupo_Propietario" 
--

CREATE TABLE "Grupo_Propietario"(
    nombre                 char(10)    NOT NULL,
    año_celebracion        char(10)    NOT NULL,
    ultimo_año_victoria    char(10),
    dueño_principal        char(10),
    estado_origen          char(10),
    nombre_equipo          char(10),
    CONSTRAINT "PK2" PRIMARY KEY (nombre, año_celebracion)
)
;



-- 
-- TABLE: "Jugador" 
--

CREATE TABLE "Jugador"(
    "SSN"                char(10)    NOT NULL,
    nombre_equipo        char(10)    NOT NULL,
    fecha_naciemiento    char(10),
    edad                 char(10),
    apodo_deportivo      char(10),
    nombre_completo      char(10),
    nacionalidad         char(10),
    CONSTRAINT "PK5" PRIMARY KEY ("SSN", nombre_equipo)
)
;



-- 
-- TABLE: premio 
--

CREATE TABLE premio(
    año_obtencion      char(10)    NOT NULL,
    "SSN"              char(10)    NOT NULL,
    año_celebracion    char(10)    NOT NULL,
    categoria          char(10),
    CONSTRAINT "PK3" PRIMARY KEY (año_obtencion, "SSN", año_celebracion)
)
;



-- 
-- TABLE: "Super_Bowl" 
--

CREATE TABLE "Super_Bowl"(
    año_celebracion    char(10)    NOT NULL,
    estadio            char(10),
    presupuesto        char(10),
    CONSTRAINT "PK4" PRIMARY KEY (año_celebracion)
)
;



-- 
-- TABLE: comite_votacion 
--

ALTER TABLE comite_votacion ADD CONSTRAINT "Refcategoria35" 
    FOREIGN KEY (nombre)
    REFERENCES categoria(nombre)
;


-- 
-- TABLE: "Grupo_Propietario" 
--

ALTER TABLE "Grupo_Propietario" ADD CONSTRAINT "RefEquipo_clasificado27" 
    FOREIGN KEY (nombre_equipo)
    REFERENCES "Equipo_clasificado"(nombre)
;

ALTER TABLE "Grupo_Propietario" ADD CONSTRAINT "RefSuper_Bowl29" 
    FOREIGN KEY (año_celebracion)
    REFERENCES "Super_Bowl"(año_celebracion)
;


-- 
-- TABLE: "Jugador" 
--

ALTER TABLE "Jugador" ADD CONSTRAINT "RefEquipo_clasificado26" 
    FOREIGN KEY (nombre_equipo)
    REFERENCES "Equipo_clasificado"(nombre)
;


