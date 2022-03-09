/*
Affectation des droits de lecture, édition et suppression des tables et les séquences du schéma GestionGeo.
*/
-- G_GEOTECH_R :
-- Séquences
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_FAMILLE_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_LONG_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_COURT_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_ETUDE_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID TO G_GEO_R;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_SITE_OBJECTID TO G_GEO_R;

-- Tables
GRANT SELECT ON G_GEO.TA_GEOTECH_FAMILLE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_LIBELLE_LONG TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_FAMILLE_LIBELLE_LONG TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_LIBELLE_COURT TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_LIBELLE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_ETUDE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_BUREAU_ETUDE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_REPERTOIRE TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_FICHIER TO G_GEO_R;
GRANT SELECT ON G_GEO.TA_GEOTECH_SITE TO G_GEO_R;

-- G_GEOTECH_RW :
-- Séquences
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_FAMILLE_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_LONG_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_COURT_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_LIBELLE_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_ETUDE_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_BUREAU_ETUDE_OBJECTID TO G_GEO_RW;
GRANT SELECT ON G_GEO.SEQ_TA_GEOTECH_SITE_OBJECTID TO G_GEO_RW;

-- Tables
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_FAMILLE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_LIBELLE_LONG TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_FAMILLE_LIBELLE_LONG TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_LIBELLE_COURT TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_LIBELLE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_RELATION_LIBELLE_LONG_COURT TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_ETUDE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_BUREAU_ETUDE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_RELATION_SITE_ETUDE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_REPERTOIRE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_FICHIER TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_SITE TO G_GEO_RW;
GRANT SELECT, INSERT, UPDATE, DELETE ON G_GEO.TA_GEOTECH_ TO G_GEO_RW;