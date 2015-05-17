DROP DATABASE IF EXISTS app;
CREATE DATABASE app;
\connect app

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;

CREATE TABLE TIPO_VIA(
	ID INTEGER NULL,
	NOMBRE TEXT NULL
);

CREATE TABLE VIA(
	ID INTEGER NULL,
	NOMBRE TEXT NULL,
	TIPO_VIA_ID INTEGER NULL
);

CREATE TABLE NODO(
	ID INTEGER NULL,
	LONGITUD FLOAT NULL,
	LATITUD FLOAT NULL,
	GEOM GEOMETRY(POINT ,4326)
);

CREATE TABLE PISTA(
	ID INTEGER NULL,
	ID_NODO_ORIGEN INTEGER NULL,
	ID_NODO_DESTINO INTEGER NULL,
	VIA_ID INTEGER NULL,
	DISTANCIA FLOAT NULL,
	GEOM GEOMETRY(LINESTRING, 4326)
);

CREATE TABLE TIPO_ESTRUCTURA(
	ID INTEGER NULL,
	NOMBRE TEXT NULL,
	DESCRIPCION TEXT NULL	
);

CREATE TABLE ESTRUCTURAS(
	ID INTEGER NULL,
	TIPO_ESTRUCTURA_ID INTEGER NULL,
	NOMBRE TEXT NULL,
	DIRECCION TEXT NULL,
	GEOM GEOMETRY(POLYGON, 4326)
);

CREATE TABLE TIPO_INCIDENTE(
	ID INTEGER NULL,
	NOMBRE TEXT NULL,
	DESCRIPCION TEXT NULL
);

CREATE TABLE INCIDENTE(
	ID SERIAL PRIMARY KEY,
	TIPO_INCIDENTE INTEGER NULL,
	ARISTA_ID INTEGER NULL,
	FECHA_REGISTRO TIMESTAMP,
	FECHA_SOLUCION TIMESTAMP,
	ESTADO_INCIDENTE_ID INTEGER NULL,
	LIKES INTEGER NULL,
	GEOM GEOMETRY(POINT, 4326)
);

CREATE TABLE ESTADO_INCIDENTE(
	ID INTEGER NULL,
	NOMBRE TEXT NULL,
	DESCRIPCION TEXT NULL
);

CREATE TABLE POST(
	ID INTEGER NULL,
	FOTO TEXT NULL,
	COMENTARIO TEXT NULL,
	USUARIO_ID INTEGER
);

CREATE TABLE USUARIO(
	ID INTEGER NULL,
	NOMBRE TEXT NULL
);

CREATE TABLE TIPO_OBRA(
	ID INTEGER NULL,
	NOMBRE TEXT NULL,
	DESCRIPCION TEXT NULL
);

CREATE TABLE OBRA(
	ID SERIAL PRIMARY KEY,
	TIPO_OBRA_ID INTEGER NULL,
	NOMBRE TEXT INTEGER NULL,
	DESCRIPCION TEXT NULL,
	TIPO INTEGER NULL,
	GEOM GEOMETRY(POINT, 4326)
);

CREATE TABLE OBRA_PISTA(
	OBRA_ID INTEGER NULL,
	PISTA_ID INTEGER NULL
);











