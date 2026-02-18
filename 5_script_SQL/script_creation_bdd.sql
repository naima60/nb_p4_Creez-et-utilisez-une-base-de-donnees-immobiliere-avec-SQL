
CREATE TABLE public.Region (
                reg_code VARCHAR(3) NOT NULL,
                reg_nom VARCHAR(50) NOT NULL,
                regrgp_nom VARCHAR(50) NOT NULL,
                CONSTRAINT id_region PRIMARY KEY (reg_code)
);

CREATE TABLE public.Departement (
                dep_code VARCHAR(3) NOT NULL,
                dep_nom VARCHAR(50) NOT NULL,
                reg_code VARCHAR(3) NOT NULL,
                CONSTRAINT departement_pk PRIMARY KEY (dep_code)
);

CREATE TABLE public.Commune (
                code_dep_com VARCHAR(5) NOT NULL,
                Nom_commune VARCHAR(100) NOT NULL,
                Code_postal VARCHAR(5),
                pop_totale INTEGER NOT NULL,
                dep_code VARCHAR(3) NOT NULL,
                CONSTRAINT id_codedep_codecommune PRIMARY KEY (code_dep_com)
);

CREATE SEQUENCE public.bien_id_bien_seq_1;

CREATE TABLE public.Bien (
                id_bien INTEGER NOT NULL DEFAULT nextval('public.bien_id_bien_seq_1'),
                No_voie INTEGER,
                BTQ VARCHAR(3),
                type_voie VARCHAR(50),
                voie VARCHAR(250) NOT NULL,
                Total_piece INTEGER NOT NULL,
                Surface_Carrez NUMERIC(10,2) NOT NULL,
                Surface_local NUMERIC(10,2) NOT NULL,
                Type_local VARCHAR(50) NOT NULL,
                code_dep_com VARCHAR(5) NOT NULL,
                CONSTRAINT id_bien PRIMARY KEY (id_bien)
);

ALTER SEQUENCE public.bien_id_bien_seq_1 OWNED BY public.Bien.id_bien;
CREATE SEQUENCE public.vente_id_vente_seq;
CREATE TABLE public.Vente (
                id_vente INTEGER NOT NULL DEFAULT nextval('public.vente_id_vente_seq'),
                Date_mutation DATE NOT NULL,
                Valeur_mutation NUMERIC(15,2) NOT NULL,
                Nature_mutation VARCHAR(50) NOT NULL,
                id_bien INTEGER NOT NULL,
                CONSTRAINT id_vente PRIMARY KEY (id_vente)
);

ALTER SEQUENCE public.vente_id_vente_seq OWNED BY public.Vente.id_vente;
ALTER TABLE public.Departement ADD CONSTRAINT region_departement_fk
FOREIGN KEY (reg_code)
REFERENCES public.Region (reg_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commune ADD CONSTRAINT departement_commune_fk
FOREIGN KEY (dep_code)
REFERENCES public.Departement (dep_code)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Bien ADD CONSTRAINT commune_bien_fk
FOREIGN KEY (code_dep_com)
REFERENCES public.Commune (code_dep_com)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Vente ADD CONSTRAINT bien_vente_fk
FOREIGN KEY (id_bien)
REFERENCES public.Bien (id_bien)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
