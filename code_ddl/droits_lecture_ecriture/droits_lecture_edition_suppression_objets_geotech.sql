/*
Affectation des droits de lecture, édition et suppression des tables et les séquences du schéma GestionGeo.
*/
-- G_GEOTECHTECH_R :
-- Séquences
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_FAMILLE_OBJECTID TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_LIBELLE_OBJECTID TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_ETUDE_OBJECTID TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_SITE_OBJECTID TO G_GEOTECH_R;

-- Tables
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_FAMILLE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_LIBELLE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_ETUDE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_BUREAU_ETUDE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_RELATION_SITE_ETUDE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_REPERTOIRE TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_FICHIER TO G_GEOTECH_R;
GRANT SELECT ON G_GEOTECH.TA_GEOTECH_SITE TO G_GEOTECH_R;

-- Vues
GRANT SELECT ON G_GEOTECH.V_GEOTECH_VISUALISATION_SITE_ETUDE TO G_GEOTECH_R;

-- G_GEOTECHTECH_RW :
-- Séquences
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_FAMILLE_OBJECTID TO G_GEOTECH_RW;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_LIBELLE_OBJECTID TO G_GEOTECH_RW;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_ETUDE_OBJECTID TO G_GEOTECH_RW;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID TO G_GEOTECH_RW;
GRANT SELECT ON G_GEOTECH.SEQ_TA_GEOTECH_SITE_OBJECTID TO G_GEOTECH_RW;

-- Tables
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_FAMILLE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_FAMILLE_LIBELLE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_LIBELLE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_ETUDE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_BUREAU_ETUDE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_RELATION_SITE_ETUDE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_REPERTOIRE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_FICHIER TO G_GEOTECH_RW;
GRANT UPDATE(GEOM) ON G_GEOTECH.TA_GEOTECH_SITE TO G_GEOTECH_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEOTECH.TA_GEOTECH_SITE TO G_GEOTECH_RW;

/

