/*
Création de la vue V_CHEMIN_FICHIER_GEOTECH permettant d'asocier un fichier à une étude géotechnique.
*/

-- 1. Création de la vue
CREATE OR REPLACE FORCE VIEW "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH" ("ID_ETUDE", "REPERTOIRE", "CHEMIN_FICHIER", "PROTOCOLE", 
  CONSTRAINT "V_CHEMIN_FICHIER_GEOTECH_PK" PRIMARY KEY ("ID_ETUDE") DISABLE) AS 
  SELECT
    a.objectid,
    c.repertoire || a.objectid || '/',
    c.repertoire || a.objectid || '/' || b.fichier,
    c.protocole
  FROM
    G_GEOTECH.TA_GEOTECH_ETUDE a
    INNER JOIN G_GEOTECH.TA_GEOTECH_FICHIER b ON b.fid_etude = a.objectid,
    G_GEOTECH.TA_GEOTECH_REPERTOIRE c;

-- 2. Création des commentaires
COMMENT ON COLUMN "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH"."ID_ETUDE" IS 'Clé primaire de la vue, correspondant à l''identifiant de chaque étude géotechnique.';
COMMENT ON COLUMN "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH"."REPERTOIRE" IS 'Chemin d''acès au répertoire contenant les fichiers de chaque étude géotechnique.';
COMMENT ON COLUMN "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH"."CHEMIN_FICHIER" IS 'Chemin d''accès complet des fichiers de chaque étude géotechnique.';
COMMENT ON COLUMN "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH"."PROTOCOLE" IS 'Type de protocole du chemin d''accès.';
COMMENT ON TABLE "G_GEOTECH"."V_CHEMIN_FICHIER_GEOTECH"  IS 'Vue permettant d''associer une URL à un nom de fichier afin de créer le chemin d''accès complet au fichier d''une étude géotechnique.';

-- 3. Création du droit de lecture
GRANT SELECT ON G_GEOTECH.V_CHEMIN_FICHIER_GEOTECH TO G_ADMIN_SIG;

/

