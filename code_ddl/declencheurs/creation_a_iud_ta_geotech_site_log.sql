/*
Déclencheur permettant de remplir la table de logs TA_GEOTECH_SITE_LOG dans laquelle sont enregistrés chaque insertion, 
modification et suppression des données de la table TA_GEOTECH_SITE avec leur date et le pnom de l'agent les ayant effectuées.
*/

CREATE OR REPLACE TRIGGER G_GEOTECH.A_IUD_TA_GEOTECH_SITE_LOG
AFTER INSERT OR UPDATE OR DELETE ON G_GEOTECH.TA_GEOTECH_SITE
FOR EACH ROW
DECLARE
    username VARCHAR2(100);
    v_id_insertion NUMBER(38,0);
    v_id_modification NUMBER(38,0);
    v_id_suppression NUMBER(38,0);
BEGIN
    -- Sélection du pnom
    SELECT sys_context('USERENV','OS_USER') into username from dual;

    -- Sélection des id des actions présentes dans la table TA_GEOTECH_LIBELLE
    SELECT 
        objectid INTO v_id_insertion 
    FROM 
        G_GEOTECH.TA_GEOTECH_LIBELLE
    WHERE 
        libelle_court = 'INSERTION';

    SELECT 
        objectid INTO v_id_modification 
    FROM 
        G_GEOTECH.TA_GEOTECH_LIBELLE
    WHERE 
        libelle_court = 'EDITION';
            
    SELECT 
        objectid INTO v_id_suppression 
    FROM 
        G_GEOTECH.TA_GEOTECH_LIBELLE
    WHERE 
        libelle_court = 'SUPPRESSION';

    IF INSERTING THEN -- En cas d'insertion on insère les libelle_courts de la table TA_GEOTECH_SITE_LOG, le pnom de l'utilisateur, la date de insertion et le type de modification.
        INSERT INTO G_GEOTECH.TA_GEOTECH_SITE_LOG(id_site, geom, code_insee, x_epsg2154, y_epsg2154, description, adresse, date_action, fid_type_action, pnom)
            VALUES(
                    :new.objectid, 
                    :new.geom,
                    :new.code_insee,
                    :new.x_epsg2154,
                    :new.y_epsg2154,
                    :new.description,
                    :new.adresse,
                    sysdate, 
                    v_id_insertion, 
                    username
                );                    
    ELSE
        IF UPDATING THEN -- En cas de modification on insère les libelle_courts de la table TA_GEOTECH_SITE_LOG, le pnom de l'utilisateur, la date de modification et le type de modification.
            INSERT INTO G_GEOTECH.TA_GEOTECH_SITE_LOG(id_site, geom, code_insee, x_epsg2154, y_epsg2154, description, adresse, date_action, fid_type_action, pnom)
            VALUES(
                    :old.objectid, 
                    :old.geom,
                    :old.code_insee,
                    :old.x_epsg2154,
                    :old.y_epsg2154,
                    :old.description,
                    :old.adresse, 
                    sysdate,
                    v_id_modification,
                    username
                );
        END IF;
    END IF;
    IF DELETING THEN -- En cas de suppression on insère les libelle_courts de la table TA_GEOTECH_SITE_LOG, le pnom de l'utilisateur, la date de suppression et le type de modification.
        INSERT INTO G_GEOTECH.TA_GEOTECH_SITE_LOG(id_site, geom, code_insee, x_epsg2154, y_epsg2154, description, adresse, date_action, fid_type_action, pnom)
        VALUES(
                :old.objectid, 
                :old.geom,
                :old.code_insee,
                :old.x_epsg2154,
                :old.y_epsg2154,
                :old.description,
                :old.adresse, 
                sysdate,
                v_id_suppression,
                username
            );
    END IF;

    EXCEPTION
        WHEN OTHERS THEN
            mail.sendmail('bjacq@lillemetropole.fr',SQLERRM || ' générée par l''utilisateur '|| username || ' - identifiant site : ' || :old.objectid ,'ERREUR TRIGGER - G_GEOTECH.A_IUD_TA_GEOTECH_SITE_LOG','bjacq@lillemetropole.fr');
END;

/

