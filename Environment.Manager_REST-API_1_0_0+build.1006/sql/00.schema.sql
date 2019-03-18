SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';


SET default_with_oids = false;


CREATE TABLE public.environment (
    id bigint NOT NULL,
    backend_provider integer,
    name character varying(255),
    template_repository_id bigint NOT NULL,
    folder character varying(255) NOT NULL,
    refs character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255),
    status integer,
    modified_on timestamp without time zone,
    modified_by character varying(255),
    infra_provider_id bigint NOT NULL
);


CREATE TABLE public.environment_lock (
    id bigint NOT NULL,
    created_on timestamp without time zone,
    created_by character varying(255),
    environment_id bigint NOT NULL,
    execution_id bigint
);


CREATE TABLE public.execution (
    id bigint NOT NULL,
    command integer,
    completed_on timestamp without time zone,
    created_on timestamp without time zone,
    created_by character varying(255),
    commit_id character varying(255),
    status integer,
    environment_id bigint NOT NULL,
    override_variables text
);


CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE public.infrastructure_provider (
    id bigint NOT NULL,
    name character varying(255),
    infra_provider_type_id bigint NOT NULL,
    created_on timestamp without time zone,
    created_by character varying(255),
    modified_on timestamp without time zone,
    modified_by character varying(255)
);



CREATE TABLE public.infrastructure_provider_detail (
    id bigint NOT NULL,
    value text,
    infra_provider_type_detail_id bigint NOT NULL,
    infrastructure_provider_id bigint NOT NULL
);



CREATE TABLE public.infrastructure_provider_type (
    id bigint NOT NULL,
    name character varying(255)
);



CREATE TABLE public.infrastructure_provider_type_detail (
    id bigint NOT NULL,
    property character varying(255) NOT NULL,
    property_name character varying(255) NOT NULL,
    property_mandatory boolean NOT NULL,
    property_order integer NOT NULL,
    property_type integer NOT NULL,
    infrastructure_provider_type_id bigint NOT NULL
);


CREATE TABLE public.template_repository (
    id bigint NOT NULL,
    created_on timestamp without time zone,
    created_by character varying(255),
    encrypted_pass_phrase character varying(255),
    encrypted_password character varying(255),
    encrypted_private_key text,
    name character varying(255),
    repository_type integer NOT NULL,
    modified_on timestamp without time zone,
    modified_by character varying(255),
    url character varying(255),
    branch character varying(255),
    username character varying(255),
    status integer,
    refs text
);


ALTER TABLE ONLY public.environment_lock
    ADD CONSTRAINT environment_lock_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.environment
    ADD CONSTRAINT environment_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.execution
    ADD CONSTRAINT execution_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.infrastructure_provider_detail
    ADD CONSTRAINT infrastructure_provider_detail_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.infrastructure_provider
    ADD CONSTRAINT infrastructure_provider_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.infrastructure_provider_type_detail
    ADD CONSTRAINT infrastructure_provider_type_detail_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.infrastructure_provider_type
    ADD CONSTRAINT infrastructure_provider_type_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.template_repository
    ADD CONSTRAINT template_repository_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.environment_lock
    ADD CONSTRAINT uk_1sjv2udmdb5h26rirgfvyeot5 UNIQUE (environment_id);


ALTER TABLE ONLY public.infrastructure_provider_type
    ADD CONSTRAINT uk_eg5mkmqnrcgrivnfmpqar9shc UNIQUE (name);


ALTER TABLE ONLY public.environment
    ADD CONSTRAINT uk_fdb0ohhfysiwxy88s7k80bx90 UNIQUE (name);


ALTER TABLE ONLY public.infrastructure_provider
    ADD CONSTRAINT uk_nxqasi62gydtn9m5qjp1dngcm UNIQUE (name);


ALTER TABLE ONLY public.template_repository
    ADD CONSTRAINT uk_qvtlkf76aalnr95221svoytbd UNIQUE (name);


ALTER TABLE ONLY public.infrastructure_provider_detail
    ADD CONSTRAINT fk2mqbxd6rfy3hfrc8xqjgn010h FOREIGN KEY (infra_provider_type_detail_id) REFERENCES public.infrastructure_provider_type_detail(id);


ALTER TABLE ONLY public.infrastructure_provider_type_detail
    ADD CONSTRAINT fkaye6vrw1gk6950312vk1cbm63 FOREIGN KEY (infrastructure_provider_type_id) REFERENCES public.infrastructure_provider_type(id);


ALTER TABLE ONLY public.environment
    ADD CONSTRAINT fkbsbyrad3kco1rqa2u8ncfelvy FOREIGN KEY (template_repository_id) REFERENCES public.template_repository(id);

ALTER TABLE ONLY public.execution
    ADD CONSTRAINT fkm31t2x0kch4py8ch8qjscio7q FOREIGN KEY (environment_id) REFERENCES public.environment(id);


ALTER TABLE ONLY public.infrastructure_provider
    ADD CONSTRAINT fknoup9oabox7dwtdbilusa55eg FOREIGN KEY (infra_provider_type_id) REFERENCES public.infrastructure_provider_type(id);


ALTER TABLE ONLY public.infrastructure_provider_detail
    ADD CONSTRAINT fkoov9cxtllc13b5ppif6ry21t5 FOREIGN KEY (infrastructure_provider_id) REFERENCES public.infrastructure_provider(id);