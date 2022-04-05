/*
TA_GEOTECH_ETUDE_LOG : Création de la table TA_GEOTECH_ETUDE_LOG regroupant toutes les actions faites sur études faites à partir de sites géotechniques.
*/

-- 1. La table
CREATE TABLE G_GEOTECH.TA_GEOTECH_ETUDE_LOG (
	"OBJECTID" NUMBER(38,0) GENERATED BY DEFAULT AS IDENTITY,
	"ID_ETUDE" NUMBER(38,0),
	"REFERENCE_INTERNE" VARCHAR2(4000),
	"DATE_DEBUT" NUMBER(4,0),
	"DATE_FIN" NUMBER(4,0),
	"DESCRIPTION" VARCHAR2(4000),
	"ID_TYPE_ETUDE" NUMBER(38,0),
	"ID_SITE" NUMBER(38,0),
	"DATE_ACTION" DATE,
	"FID_TYPE_ACTION" NUMBER(38,0),
	"PNOM" VARCHAR2(100)
 );

-- 2. Les commentaires
COMMENT ON TABLE G_GEOTECH.TA_GEOTECH_ETUDE_LOG IS 'Table de log enregistrant toutes les actions faites sur la table TA_GEOTECH_ETUDE regroupant toutes les études faites à partir de sites géotechniques.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.OBJECTID IS 'Clé primaire auto-incrémentée de la table.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.ID_ETUDE IS 'Identifiant de cahque étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.REFERENCE_INTERNE IS 'Référence interne de chaque étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.DATE_DEBUT IS 'Champ contenant l''année de début de l''étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.DATE_FIN IS 'Champ contenant l''année de fin de l''étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.ID_TYPE_ETUDE IS 'Identifiant de la table TA_GEOTECH_libelle permettant d''associer un type à une étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.ID_SITE IS 'Identifiant de la table TA_GEOTECH_SITE permettant d''affecter un site à une étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.DATE_ACTION IS 'Date d''insertion, modification ou suppression de l''étude géotechnique.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.FID_TYPE_ACTION IS 'Clé étrangère vers la table TA_LIBELLE permettant de savoir quelle action a été effectuée sur l''étude.';
COMMENT ON COLUMN G_GEOTECH.TA_GEOTECH_ETUDE_LOG.PNOM IS 'Pnom de l''agent ayant effectué l''action.';

-- 3. Les contraintes
-- Contrainte de clé primaire
ALTER TABLE G_GEOTECH.TA_GEOTECH_ETUDE_LOG
ADD CONSTRAINT TA_GEOTECH_ETUDE_LOG_PK
PRIMARY KEY("OBJECTID")
USING INDEX TABLESPACE G_ADT_INDX;

-- Contrainte de clé étrangère
ALTER TABLE G_GEOTECH.TA_GEOTECH_ETUDE_LOG
ADD CONSTRAINT TA_GEOTECH_ETUDE_LOG_FID_TYPE_ACTION_FK
FOREIGN KEY("FID_TYPE_ACTION")
REFERENCES G_GEOTECH.TA_GEOTECH_LIBELLE("OBJECTID");

-- 4. Les index
CREATE INDEX TA_GEOTECH_ETUDE_LOG_ID_ETUDE_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("ID_ETUDE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_DATE_DEBUT_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("DATE_DEBUT")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_DATE_FIN_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("DATE_FIN")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_ID_TYPE_ETUDE_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("ID_TYPE_ETUDE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_REFERENCE_INTERNE_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("REFERENCE_INTERNE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_ID_SITE_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("ID_SITE")
    TABLESPACE G_ADT_INDX;

CREATE INDEX TA_GEOTECH_ETUDE_LOG_ACTION_IDX ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG("FID_TYPE_ACTION", "PNOM", "DATE_ACTION")
    TABLESPACE G_ADT_INDX;

-- 5. Les droits de lecture, écriture, suppression
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_ETUDE_LOG TO G_ADMIN_SIG;

/

