/*
TA_GEOTECH_REPERTOIRE : Création de la table TA_GEOTECH_REPERTOIRE qui présente les chemins d''accès aux répertoires contenant les fichiers des études géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEOTECH.TA_GEOTECH_REPERTOIRE (
	"OBJECTID" NUMBER(38,0) GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	"REPERTOIRE" VARCHAR2(4000),
    "PROTOCOLE" VARCHAR2(4000 BYTE)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEOTECH.TA_GEOTECH_REPERTOIRE IS 'Table qui présente les chemins d''accès aux répertoires contenant les fichiers des études géotechniques.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_REPERTOIRE.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_REPERTOIRE.REPERTOIRE IS 'Chemin des répertoires contenant les fichiers liés aux études géotechniques.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_REPERTOIRE.PROTOCOLE IS 'Type de protocole du chemin.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEOTECH.TA_GEOTECH_REPERTOIRE
ADD CONSTRAINT TA_GEOTECH_REPERTOIRE_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- 4. Les index
CREATE INDEX TA_GEOTECH_REPERTOIRE_REPERTOIRE_IDX ON G_GEOTECH.TA_GEOTECH_REPERTOIRE("REPERTOIRE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_REPERTOIRE_PROTOCOLE_IDX ON G_GEOTECH.TA_GEOTECH_REPERTOIRE("PROTOCOLE")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_REPERTOIRE TO G_ADMIN_SIG;

/

