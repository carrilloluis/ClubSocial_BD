/*
@description Gestión de un Club de Socios
@author Luis Carrillo Gutiérrez
@date Julio, 2016
@version 0.0.1
*/

DROP TABLE IF EXISTS [Socio];
CREATE TABLE IF NOT EXISTS [Socio]
(
	[id] CHAR(36) NOT NULL PRIMARY KEY,
	[documento de identidad] VARCHAR(16) NOT NULL, -- dni/passaporto
	[apellidos] VARCHAR(64) NOT NULL, -- cognome
	[nombres] VARCHAR(64) NOT NULL, -- nomi
	[nacionalidad] CHAR(3) NOT NULL, -- paese
	[lugar de nacimiento] CHAR(16) NOT NULL, -- luogo nascemento
	[fecha de nacimiento] DATE NULL, -- dati nascemento
	[género] CHAR(1) NOT NULL, -- sesso : 0 masquile 1 feminile 2 altro
	-- TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
	[estado] CHAR(1) NOT NULL DEFAULT '1'
) WITHOUT RowId;

DROP TABLE IF EXISTS [Condición del Socio];
CREATE TABLE IF NOT EXISTS [Condición del Socio]
(
	[id] INTEGER UNSIGNED NOT NULL PRIMARY KEY,
	[id del socio] CHAR(36) NOT NULL REFERENCES [Socio](id),
	[condición] INTEGER UNSIGNED NOT NULL, -- idCondicion
	-- CHECK mes in [1..12]
	[mes] INTEGER UNSIGNED NOT NULL, -- messe scambi
	[año] CHAR(4) NOT NULL,
	[observación] TEXT NULL,
	[estado] CHAR(1) NOT NULL DEFAULT '1' -- abilitatto??
) WITHOUT RowId;

DROP TABLE IF EXISTS [Imágenes del Socio];
CREATE TABLE IF NOT EXISTS [Imágenes del Socio]
(
	[id] CHAR(36) NOT NULL, -- de quien
	[nombre del archivo codificado] TEXT NOT NULL,
	[nombre del archivo original] TEXT NOT NULL,
	UNIQUE ('nombre del archivo codificado'),
	PRIMARY KEY ('id', 'nombre del archivo codificado')
) WITHOUT RowId;

-- Relación entre Socios y familiares
DROP TABLE IF EXISTS [Relación entre Socios];
CREATE TABLE IF NOT EXISTS [Relación entre Socios]
(
	[titular] CHAR(36) NOT NULL REFERENCES [Socio](id), -- idTitolare
	[familiar] CHAR(36) NOT NULL REFERENCES [Socio](id), -- idConsangiene
	[tipo de relación] INTEGER UNSIGNED NOT NULL, -- relazione
	[estado] CHAR(1) NOT NULL DEFAULT '1', -- abilitatto??
	PRIMARY KEY ('titular', 'familiar')
) WITHOUT RowId;