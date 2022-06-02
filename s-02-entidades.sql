--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      Air Flights.DM1
-- Author :       axelnunez1@hotmail.com
--
-- Date Created : Thursday, June 02, 2022 16:48:56
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: AEROPUERTO 
--

CREATE TABLE AEROPUERTO(
    AEROPUERTO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE           VARCHAR2(50)     NOT NULL,
    CLAVE            VARCHAR2(13)     NOT NULL,
    LATITUD          NUMBER(3, 0)     NOT NULL,
    LONGITUD         NUMBER(3, 0)     NOT NULL,
    ACTIVO           NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY (AEROPUERTO_ID)
)
;



-- 
-- TABLE: AVION 
--

CREATE TABLE AVION(
    AVION_ID            NUMBER(10, 0)    NOT NULL,
    MATRICULA           VARCHAR2(10)     NOT NULL,
    MODELO              VARCHAR2(50)     NOT NULL,
    ESPECIFICACIONES    BLOB             NOT NULL,
    ES_COMERCIAL        NUMBER(1, 0)     NOT NULL,
    ES_CARGA            NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (AVION_ID)
)
;



-- 
-- TABLE: AVION_CARGA 
--

CREATE TABLE AVION_CARGA(
    AVION_ID              NUMBER(10, 0)    NOT NULL,
    BODEGA_PROFUNDIDAD    NUMBER(5, 2)     NOT NULL,
    BODEGA_ALTO           NUMBER(5, 2)     NOT NULL,
    BODEGA_ANCHO          NUMBER(5, 2)     NOT NULL,
    NUM_BODEGAS           NUMBER(2, 0)     NOT NULL,
    CAPACIDAD             NUMBER(2, 0)     NOT NULL,
    AEROPUERTO_ID         NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (AVION_ID)
)
;



-- 
-- TABLE: AVION_COMERCIAL 
--

CREATE TABLE AVION_COMERCIAL(
    AVION_ID                   NUMBER(10, 0)    NOT NULL,
    CAPACIDAD_ORDINARIO        NUMBER(3, 0)     NOT NULL,
    CAPACIDAD_DISCAPACITADO    NUMBER(3, 0)     NOT NULL,
    CAPACIDAD_VIP              NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (AVION_ID)
)
;



-- 
-- TABLE: EMAIL_PASAJERO 
--

CREATE TABLE EMAIL_PASAJERO(
    NUM_EMAIL      NUMBER(1, 0)     NOT NULL,
    PASAJERO_ID    NUMBER(10, 0)    NOT NULL,
    EMAIL          VARCHAR2(50)     NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (NUM_EMAIL, PASAJERO_ID)
)
;



-- 
-- TABLE: EMPLEADO 
--

CREATE TABLE EMPLEADO(
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE         VARCHAR2(50)     NOT NULL,
    AP_PATERNO     VARCHAR2(50)     NOT NULL,
    AP_MATERNO     VARCHAR2(50)     NOT NULL,
    RFC            VARCHAR2(13)     NOT NULL,
    CURP           VARCHAR2(18)     NOT NULL,
    FOTO           BLOB             NOT NULL,
    JEFE_ID        NUMBER(10, 0),
    PUESTO_ID      NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY (EMPLEADO_ID)
)
;



-- 
-- TABLE: EMPLEADO_VUELO 
--

CREATE TABLE EMPLEADO_VUELO(
    EMPLEADO_VUELO_ID    NUMBER(10, 0)    NOT NULL,
    VUELO_ID             NUMBER(10, 0)    NOT NULL,
    EMPLEADO_ID          NUMBER(10, 0)    NOT NULL,
    ROL                  VARCHAR2(20)     NOT NULL,
    DESEMPENIO           NUMBER(3, 0)     NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY (EMPLEADO_VUELO_ID)
)
;



-- 
-- TABLE: HISTORICO_VUELO 
--

CREATE TABLE HISTORICO_VUELO(
    HISTORICO_VUELO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS          DATE             NOT NULL,
    STATUS_VUELO_ID       NUMBER(2, 0)     NOT NULL,
    VUELO_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY (HISTORICO_VUELO_ID)
)
;



-- 
-- TABLE: LINK_EMPLEADO 
--

CREATE TABLE LINK_EMPLEADO(
    NUM_LINK       NUMBER(2, 0)     NOT NULL,
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    LINK           VARCHAR2(100)    NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (NUM_LINK, EMPLEADO_ID)
)
;



-- 
-- TABLE: MALETA 
--

CREATE TABLE MALETA(
    NUM_MALETA         NUMBER(2, 0)     NOT NULL,
    PASE_ABORDAR_ID    NUMBER(10, 0)    NOT NULL,
    PESO               NUMBER(5, 2)     NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (NUM_MALETA, PASE_ABORDAR_ID)
)
;



-- 
-- TABLE: PAQUETE 
--

CREATE TABLE PAQUETE(
    PAQUETE_ID         NUMBER(10, 0)    NOT NULL,
    FOLIO              VARCHAR2(18)     NOT NULL,
    PESO               NUMBER(5, 2)     NOT NULL,
    TIPO_PAQUETE_ID    NUMBER(2, 0)     NOT NULL,
    VUELO_ID           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK15 PRIMARY KEY (PAQUETE_ID)
)
;



-- 
-- TABLE: PASAJERO 
--

CREATE TABLE PASAJERO(
    PASAJERO_ID         NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(50)     NOT NULL,
    AP_PATERNO          VARCHAR2(50)     NOT NULL,
    AP_MATERNO          VARCHAR2(50),
    CURP                VARCHAR2(18)     NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (PASAJERO_ID)
)
;



-- 
-- TABLE: PASAJERO_VUELO 
--

CREATE TABLE PASAJERO_VUELO(
    PASAJERO_VUELO_ID    NUMBER(10, 0)     NOT NULL,
    NUM_ASIENTO          NUMBER(3, 0)      NOT NULL,
    ATENCIONES           VARCHAR2(2000)    NOT NULL,
    TOMADO               NUMBER(1, 0)      NOT NULL,
    PASAJERO_ID          NUMBER(10, 0)     NOT NULL,
    VUELO_ID             NUMBER(10, 0)     NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY (PASAJERO_VUELO_ID)
)
;



-- 
-- TABLE: PASE_ABORDAR 
--

CREATE TABLE PASE_ABORDAR(
    PASE_ABORDAR_ID      NUMBER(10, 0)    NOT NULL,
    FOLIO                VARCHAR2(8)      NOT NULL,
    FECHA_IMPRESION      DATE             NOT NULL,
    HORA_LLEGADA         DATE             NOT NULL,
    HORA_SALIDA          DATE             NOT NULL,
    NUM_ASIENTO          NUMBER(3, 0)     NOT NULL,
    SALA_ABORDAR         VARCHAR2(5),
    PASAJERO_VUELO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (PASE_ABORDAR_ID)
)
;



-- 
-- TABLE: PUESTO 
--

CREATE TABLE PUESTO(
    PUESTO_ID      NUMBER(2, 0)     NOT NULL,
    CLAVE          VARCHAR2(20)     NOT NULL,
    NOMBRE         VARCHAR2(50)     NOT NULL,
    DESCRIPCION    VARCHAR2(200)    NOT NULL,
    SUELDO         NUMBER(7, 2)     NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (PUESTO_ID)
)
;



-- 
-- TABLE: STATUS_VUELO 
--

CREATE TABLE STATUS_VUELO(
    STATUS_VUELO_ID    NUMBER(2, 0)    NOT NULL,
    STATUS_VUELO       VARCHAR2(40)    NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY (STATUS_VUELO_ID)
)
;



-- 
-- TABLE: TIPO_PAQUETE 
--

CREATE TABLE TIPO_PAQUETE(
    TIPO_PAQUETE_ID    NUMBER(2, 0)     NOT NULL,
    CLAVE              VARCHAR2(5)      NOT NULL,
    DESCRIPCION        VARCHAR2(200)    NOT NULL,
    INDICACIONES       VARCHAR2(500)    NOT NULL,
    CONSTRAINT PK16 PRIMARY KEY (TIPO_PAQUETE_ID)
)
;



-- 
-- TABLE: UBICACION_VUELO 
--

CREATE TABLE UBICACION_VUELO(
    NUM_UBICACION    NUMBER(4, 0)     NOT NULL,
    VUELO_ID         NUMBER(10, 0)    NOT NULL,
    LATITUD          NUMBER(3, 0)     NOT NULL,
    LONGITUD         NUMBER(3, 0)     NOT NULL,
    FECHA            DATE             NOT NULL,
    CONSTRAINT PK22 PRIMARY KEY (NUM_UBICACION, VUELO_ID)
)
;



-- 
-- TABLE: VUELO 
--

CREATE TABLE VUELO(
    VUELO_ID              NUMBER(10, 0)    NOT NULL,
    NUM_VUELO             NUMBER(5, 0)     NOT NULL,
    FECHA_LLEGADA         DATE             NOT NULL,
    FECHA_SALIDA          DATE             NOT NULL,
    SALA_ABORDAR          VARCHAR2(5),
    FECHA_STATUS          DATE             NOT NULL,
    AVION_ID              NUMBER(10, 0)    NOT NULL,
    AEROPUERTO_SALIDA     NUMBER(10, 0)    NOT NULL,
    AEROPUERTO_LLEGADA    NUMBER(10, 0)    NOT NULL,
    STATUS_VUELO_ID       NUMBER(2, 0)     NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (VUELO_ID)
)
;



-- 
-- TABLE: AVION_CARGA 
--

ALTER TABLE AVION_CARGA ADD CONSTRAINT RefAVION2 
    FOREIGN KEY (AVION_ID)
    REFERENCES AVION(AVION_ID)
;

ALTER TABLE AVION_CARGA ADD CONSTRAINT RefAEROPUERTO13 
    FOREIGN KEY (AEROPUERTO_ID)
    REFERENCES AEROPUERTO(AEROPUERTO_ID)
;


-- 
-- TABLE: AVION_COMERCIAL 
--

ALTER TABLE AVION_COMERCIAL ADD CONSTRAINT RefAVION1 
    FOREIGN KEY (AVION_ID)
    REFERENCES AVION(AVION_ID)
;


-- 
-- TABLE: EMAIL_PASAJERO 
--

ALTER TABLE EMAIL_PASAJERO ADD CONSTRAINT RefPASAJERO3 
    FOREIGN KEY (PASAJERO_ID)
    REFERENCES PASAJERO(PASAJERO_ID)
;


-- 
-- TABLE: EMPLEADO 
--

ALTER TABLE EMPLEADO ADD CONSTRAINT RefEMPLEADO7 
    FOREIGN KEY (JEFE_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;

ALTER TABLE EMPLEADO ADD CONSTRAINT RefPUESTO24 
    FOREIGN KEY (PUESTO_ID)
    REFERENCES PUESTO(PUESTO_ID)
;


-- 
-- TABLE: EMPLEADO_VUELO 
--

ALTER TABLE EMPLEADO_VUELO ADD CONSTRAINT RefEMPLEADO25 
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;

ALTER TABLE EMPLEADO_VUELO ADD CONSTRAINT RefVUELO26 
    FOREIGN KEY (VUELO_ID)
    REFERENCES VUELO(VUELO_ID)
;


-- 
-- TABLE: HISTORICO_VUELO 
--

ALTER TABLE HISTORICO_VUELO ADD CONSTRAINT RefSTATUS_VUELO28 
    FOREIGN KEY (STATUS_VUELO_ID)
    REFERENCES STATUS_VUELO(STATUS_VUELO_ID)
;

ALTER TABLE HISTORICO_VUELO ADD CONSTRAINT RefVUELO29 
    FOREIGN KEY (VUELO_ID)
    REFERENCES VUELO(VUELO_ID)
;


-- 
-- TABLE: LINK_EMPLEADO 
--

ALTER TABLE LINK_EMPLEADO ADD CONSTRAINT RefEMPLEADO9 
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;


-- 
-- TABLE: MALETA 
--

ALTER TABLE MALETA ADD CONSTRAINT RefPASE_ABORDAR11 
    FOREIGN KEY (PASE_ABORDAR_ID)
    REFERENCES PASE_ABORDAR(PASE_ABORDAR_ID)
;


-- 
-- TABLE: PAQUETE 
--

ALTER TABLE PAQUETE ADD CONSTRAINT RefTIPO_PAQUETE10 
    FOREIGN KEY (TIPO_PAQUETE_ID)
    REFERENCES TIPO_PAQUETE(TIPO_PAQUETE_ID)
;

ALTER TABLE PAQUETE ADD CONSTRAINT RefVUELO30 
    FOREIGN KEY (VUELO_ID)
    REFERENCES VUELO(VUELO_ID)
;


-- 
-- TABLE: PASAJERO_VUELO 
--

ALTER TABLE PASAJERO_VUELO ADD CONSTRAINT RefPASAJERO20 
    FOREIGN KEY (PASAJERO_ID)
    REFERENCES PASAJERO(PASAJERO_ID)
;

ALTER TABLE PASAJERO_VUELO ADD CONSTRAINT RefVUELO21 
    FOREIGN KEY (VUELO_ID)
    REFERENCES VUELO(VUELO_ID)
;


-- 
-- TABLE: PASE_ABORDAR 
--

ALTER TABLE PASE_ABORDAR ADD CONSTRAINT RefPASAJERO_VUELO22 
    FOREIGN KEY (PASAJERO_VUELO_ID)
    REFERENCES PASAJERO_VUELO(PASAJERO_VUELO_ID)
;


-- 
-- TABLE: UBICACION_VUELO 
--

ALTER TABLE UBICACION_VUELO ADD CONSTRAINT RefVUELO12 
    FOREIGN KEY (VUELO_ID)
    REFERENCES VUELO(VUELO_ID)
;


-- 
-- TABLE: VUELO 
--

ALTER TABLE VUELO ADD CONSTRAINT RefAVION14 
    FOREIGN KEY (AVION_ID)
    REFERENCES AVION(AVION_ID)
;

ALTER TABLE VUELO ADD CONSTRAINT RefAEROPUERTO15 
    FOREIGN KEY (AEROPUERTO_SALIDA)
    REFERENCES AEROPUERTO(AEROPUERTO_ID)
;

ALTER TABLE VUELO ADD CONSTRAINT RefAEROPUERTO16 
    FOREIGN KEY (AEROPUERTO_LLEGADA)
    REFERENCES AEROPUERTO(AEROPUERTO_ID)
;

ALTER TABLE VUELO ADD CONSTRAINT RefSTATUS_VUELO27 
    FOREIGN KEY (STATUS_VUELO_ID)
    REFERENCES STATUS_VUELO(STATUS_VUELO_ID)
;


