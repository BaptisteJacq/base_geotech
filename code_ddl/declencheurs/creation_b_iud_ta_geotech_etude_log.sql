/*
Déclencheur permettant de remplir la table de logs TA_GEOTECH_ETUDE_LOG dans laquelle sont enregistrés chaque insertion, 
modification et suppression des données de la table TA_GEOTECH_ETUDE avec leur date et le pnom de l'agent les ayant effectuées.
*/

CREATE OR REPLACE TRIGGER G_GEOTECH.A_IUD_TA_GEOTECH_ETUDE_LOG
AFTER INSERT OR UPDATE OR DELETE ON G_GEOTECH.TA_GEOTECH_ETUDE
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

    IF INSERTING THEN -- En cas d'insertion on insère les libelle_courts de la table TA_GEOTECH_ETUDE_LOG, le numéro d'agent correspondant à l'utilisateur, la date de insertion et le type de modification.
        INSERT INTO G_GEOTECH.TA_GEOTECH_ETUDE_LOG(id_etude, reference_interne, date_debut, date_fin, description, id_type_etude, id_site, date_action, fid_type_action, pnom)
            VALUES(
                    :new.objectid, 
                    :new.reference_interne, 
                    :new.date_debut, 
                    :new.date_fin, 
                    :new.description, 
                    :new.fid_type_etude, 
                    :new.fid_site, 
                    sysdate, 
                    v_id_insertion, 
                    username
                );                    
    ELSE
        IF UPDATING THEN -- En cas de modification on insère les libelle_courts de la table TA_GEOTECH_ETUDE_LOG, le numéro d'agent correspondant à l'utilisateur, la date de modification et le type de modification.
            INSERT INTO G_GEOTECH.TA_GEOTECH_ETUDE_LOG(id_etude, reference_interne, date_debut, date_fin, description, id_type_etude, id_site, date_action, fid_type_action, pnom)
            VALUES(
                    :old.objectid, 
                    :old.reference_interne, 
                    :old.date_debut, 
                    :old.date_fin, 
                    :old.description, 
                    :old.fid_type_etude, 
                    :old.fid_site, 
                    sysdate,
                    v_id_modification,
                    username
                );
        END IF;
    END IF;
    IF DELETING THEN -- En cas de suppression on insère les libelle_courts de la table TA_GEOTECH_ETUDE_LOG, le numéro d'agent correspondant à l'utilisateur, la date de suppression et le type de modification.
        INSERT INTO G_GEOTECH.TA_GEOTECH_ETUDE_LOG(id_etude, reference_interne, date_debut, date_fin, description, id_type_etude, id_site, date_action, fid_type_action, pnom)
        VALUES(
                :old.objectid, 
                :old.reference_interne, 
                :old.date_debut, 
                :old.date_fin, 
                :old.description, 
                :old.fid_type_etude, 
                :old.fid_site, 
                sysdate,
                v_id_suppression,
                username
            );
    END IF;

    EXCEPTION
        WHEN OTHERS THEN
            mail.sendmail('bjacq@lillemetropole.fr',SQLERRM || ' générée par l''utilisateur '|| username || ' - identifiant étude : ' || :old.objectid ,'ERREUR TRIGGER - G_GEOTECH.A_IUD_TA_GEOTECH_ETUDE_LOG','bjacq@lillemetropole.fr');
END;

/

