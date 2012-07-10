--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appendages; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE appendages (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.appendages OWNER TO stephenprater;

--
-- Name: appendages_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE appendages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appendages_id_seq OWNER TO stephenprater;

--
-- Name: appendages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE appendages_id_seq OWNED BY appendages.id;


--
-- Name: appendages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('appendages_id_seq', 1, false);


--
-- Name: area_techniques; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE area_techniques (
    id integer NOT NULL,
    area_id integer,
    area_type character varying(255),
    techinque_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.area_techniques OWNER TO stephenprater;

--
-- Name: area_techniques_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE area_techniques_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_techniques_id_seq OWNER TO stephenprater;

--
-- Name: area_techniques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE area_techniques_id_seq OWNED BY area_techniques.id;


--
-- Name: area_techniques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('area_techniques_id_seq', 1, false);


--
-- Name: base_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE base_attributes (
    id integer NOT NULL,
    shape character varying(255),
    decoration text,
    diameter_at_top double precision,
    diameter_at_bottom double precision,
    vessell_id integer
);


ALTER TABLE public.base_attributes OWNER TO stephenprater;

--
-- Name: base_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE base_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_attributes_id_seq OWNER TO stephenprater;

--
-- Name: base_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE base_attributes_id_seq OWNED BY base_attributes.id;


--
-- Name: base_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('base_attributes_id_seq', 1, false);


--
-- Name: body_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE body_attributes (
    id integer NOT NULL,
    form character varying(255),
    shape character varying(255),
    mode character varying(255),
    decoration text,
    height double precision,
    diameter double precision,
    thickness double precision,
    vessell_id integer
);


ALTER TABLE public.body_attributes OWNER TO stephenprater;

--
-- Name: body_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE body_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.body_attributes_id_seq OWNER TO stephenprater;

--
-- Name: body_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE body_attributes_id_seq OWNED BY body_attributes.id;


--
-- Name: body_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('body_attributes_id_seq', 1, false);


--
-- Name: citations; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE citations (
    id integer NOT NULL,
    author character varying(255),
    date date,
    publisher character varying(255),
    title character varying(255),
    page character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.citations OWNER TO stephenprater;

--
-- Name: citations_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE citations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citations_id_seq OWNER TO stephenprater;

--
-- Name: citations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE citations_id_seq OWNED BY citations.id;


--
-- Name: citations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('citations_id_seq', 1, false);


--
-- Name: colors; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE colors (
    id integer NOT NULL,
    description character varying(255),
    l integer,
    a integer,
    b integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.colors OWNER TO stephenprater;

--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colors_id_seq OWNER TO stephenprater;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE colors_id_seq OWNED BY colors.id;


--
-- Name: colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('colors_id_seq', 1, false);


--
-- Name: compositions; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE compositions (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.compositions OWNER TO stephenprater;

--
-- Name: compositions_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE compositions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compositions_id_seq OWNER TO stephenprater;

--
-- Name: compositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE compositions_id_seq OWNED BY compositions.id;


--
-- Name: compositions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('compositions_id_seq', 1, false);


--
-- Name: counties; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE counties (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.counties OWNER TO stephenprater;

--
-- Name: counties_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE counties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.counties_id_seq OWNER TO stephenprater;

--
-- Name: counties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE counties_id_seq OWNED BY counties.id;


--
-- Name: counties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('counties_id_seq', 1, false);


--
-- Name: design_structures; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE design_structures (
    id integer NOT NULL,
    description character varying(255),
    vessell_id integer
);


ALTER TABLE public.design_structures OWNER TO stephenprater;

--
-- Name: design_structures_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE design_structures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.design_structures_id_seq OWNER TO stephenprater;

--
-- Name: design_structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE design_structures_id_seq OWNED BY design_structures.id;


--
-- Name: design_structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('design_structures_id_seq', 1, false);


--
-- Name: effigies; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE effigies (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.effigies OWNER TO stephenprater;

--
-- Name: effigies_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE effigies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.effigies_id_seq OWNER TO stephenprater;

--
-- Name: effigies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE effigies_id_seq OWNED BY effigies.id;


--
-- Name: effigies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('effigies_id_seq', 1, false);


--
-- Name: elements; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE elements (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.elements OWNER TO stephenprater;

--
-- Name: elements_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_id_seq OWNER TO stephenprater;

--
-- Name: elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE elements_id_seq OWNED BY elements.id;


--
-- Name: elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('elements_id_seq', 1, false);


--
-- Name: handle_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE handle_attributes (
    id integer NOT NULL,
    shape character varying(255),
    decoration character varying(255),
    appendage character varying(255),
    vessell_id integer
);


ALTER TABLE public.handle_attributes OWNER TO stephenprater;

--
-- Name: handle_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE handle_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.handle_attributes_id_seq OWNER TO stephenprater;

--
-- Name: handle_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE handle_attributes_id_seq OWNED BY handle_attributes.id;


--
-- Name: handle_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('handle_attributes_id_seq', 1, false);


--
-- Name: lip_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE lip_attributes (
    id integer NOT NULL,
    shape character varying(255),
    decoration text,
    thickness double precision,
    vessell_id integer
);


ALTER TABLE public.lip_attributes OWNER TO stephenprater;

--
-- Name: lip_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE lip_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lip_attributes_id_seq OWNER TO stephenprater;

--
-- Name: lip_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE lip_attributes_id_seq OWNED BY lip_attributes.id;


--
-- Name: lip_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('lip_attributes_id_seq', 1, false);


--
-- Name: motifs; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE motifs (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.motifs OWNER TO stephenprater;

--
-- Name: motifs_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE motifs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motifs_id_seq OWNER TO stephenprater;

--
-- Name: motifs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE motifs_id_seq OWNED BY motifs.id;


--
-- Name: motifs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('motifs_id_seq', 1, false);


--
-- Name: neck_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE neck_attributes (
    id integer NOT NULL,
    shape character varying(255),
    decoration text,
    height double precision,
    thickness double precision,
    orifice_diameter double precision,
    mid_exterior_diameter double precision,
    base_exterior_diameter double precision,
    vessell_id integer
);


ALTER TABLE public.neck_attributes OWNER TO stephenprater;

--
-- Name: neck_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE neck_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neck_attributes_id_seq OWNER TO stephenprater;

--
-- Name: neck_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE neck_attributes_id_seq OWNED BY neck_attributes.id;


--
-- Name: neck_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('neck_attributes_id_seq', 1, false);


--
-- Name: pastes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE pastes (
    id integer NOT NULL,
    type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pastes OWNER TO stephenprater;

--
-- Name: pastes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE pastes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pastes_id_seq OWNER TO stephenprater;

--
-- Name: pastes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE pastes_id_seq OWNED BY pastes.id;


--
-- Name: pastes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('pastes_id_seq', 1, false);


--
-- Name: photographs; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE photographs (
    id integer NOT NULL,
    description character varying(255),
    file_name character varying(255),
    photographer character varying(255),
    photo_number character varying(255),
    vessell_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.photographs OWNER TO stephenprater;

--
-- Name: photographs_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE photographs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photographs_id_seq OWNER TO stephenprater;

--
-- Name: photographs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE photographs_id_seq OWNED BY photographs.id;


--
-- Name: photographs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('photographs_id_seq', 1, false);


--
-- Name: rim_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE rim_attributes (
    id integer NOT NULL,
    shape character varying(255),
    mode character varying(255),
    continuous_profile boolean,
    decoration text,
    height double precision,
    diameter double precision,
    thickness double precision,
    angle double precision,
    vessell_id integer
);


ALTER TABLE public.rim_attributes OWNER TO stephenprater;

--
-- Name: rim_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE rim_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rim_attributes_id_seq OWNER TO stephenprater;

--
-- Name: rim_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE rim_attributes_id_seq OWNED BY rim_attributes.id;


--
-- Name: rim_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('rim_attributes_id_seq', 1, false);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO stephenprater;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE sites (
    id integer NOT NULL,
    county_id integer,
    description text,
    site_number character varying(255),
    amasda_record character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sites OWNER TO stephenprater;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO stephenprater;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('sites_id_seq', 1, false);


--
-- Name: surface_treatments; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE surface_treatments (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.surface_treatments OWNER TO stephenprater;

--
-- Name: surface_treatments_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE surface_treatments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surface_treatments_id_seq OWNER TO stephenprater;

--
-- Name: surface_treatments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE surface_treatments_id_seq OWNED BY surface_treatments.id;


--
-- Name: surface_treatments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('surface_treatments_id_seq', 1, false);


--
-- Name: techniques; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE techniques (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.techniques OWNER TO stephenprater;

--
-- Name: techniques_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE techniques_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.techniques_id_seq OWNER TO stephenprater;

--
-- Name: techniques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE techniques_id_seq OWNED BY techniques.id;


--
-- Name: techniques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('techniques_id_seq', 1, false);


--
-- Name: tempers; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE tempers (
    id integer NOT NULL,
    material character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tempers OWNER TO stephenprater;

--
-- Name: tempers_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE tempers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tempers_id_seq OWNER TO stephenprater;

--
-- Name: tempers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE tempers_id_seq OWNED BY tempers.id;


--
-- Name: tempers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('tempers_id_seq', 1, false);


--
-- Name: typologies; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE typologies (
    id integer NOT NULL,
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.typologies OWNER TO stephenprater;

--
-- Name: typologies_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE typologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typologies_id_seq OWNER TO stephenprater;

--
-- Name: typologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE typologies_id_seq OWNED BY typologies.id;


--
-- Name: typologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('typologies_id_seq', 1, false);


--
-- Name: varieties; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE varieties (
    id integer NOT NULL,
    description character varying(255),
    typologies_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.varieties OWNER TO stephenprater;

--
-- Name: varieties_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE varieties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.varieties_id_seq OWNER TO stephenprater;

--
-- Name: varieties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE varieties_id_seq OWNED BY varieties.id;


--
-- Name: varieties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('varieties_id_seq', 1, false);


--
-- Name: vessel_attributes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessel_attributes (
    id integer NOT NULL,
    shape character varying(255),
    carinated_vessell boolean,
    effigy_vessell boolean,
    height double precision,
    max_diameter double precision,
    max_diameter_at character varying(255),
    paste_id integer
);


ALTER TABLE public.vessel_attributes OWNER TO stephenprater;

--
-- Name: vessel_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessel_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessel_attributes_id_seq OWNER TO stephenprater;

--
-- Name: vessel_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessel_attributes_id_seq OWNED BY vessel_attributes.id;


--
-- Name: vessel_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessel_attributes_id_seq', 1, false);


--
-- Name: vessel_attributes_tempers; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessel_attributes_tempers (
    id integer NOT NULL,
    size character varying(255),
    abundance character varying(255),
    grit_type character varying(255),
    observation_method character varying(255),
    vessel_attributes_id integer,
    temper_id integer
);


ALTER TABLE public.vessel_attributes_tempers OWNER TO stephenprater;

--
-- Name: vessel_attributes_tempers_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessel_attributes_tempers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessel_attributes_tempers_id_seq OWNER TO stephenprater;

--
-- Name: vessel_attributes_tempers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessel_attributes_tempers_id_seq OWNED BY vessel_attributes_tempers.id;


--
-- Name: vessel_attributes_tempers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessel_attributes_tempers_id_seq', 1, false);


--
-- Name: vessell_attachments; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_attachments (
    id integer NOT NULL,
    location character varying(255),
    vessell_id integer,
    attachment_id integer,
    attachment_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.vessell_attachments OWNER TO stephenprater;

--
-- Name: vessell_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_attachments_id_seq OWNER TO stephenprater;

--
-- Name: vessell_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_attachments_id_seq OWNED BY vessell_attachments.id;


--
-- Name: vessell_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_attachments_id_seq', 1, false);


--
-- Name: vessell_attributes_pastes; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_attributes_pastes (
    id integer NOT NULL,
    vessell_attributes_id integer,
    paste_id integer,
    compaction character varying(255),
    hardness character varying(255),
    smoothness character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.vessell_attributes_pastes OWNER TO stephenprater;

--
-- Name: vessell_attributes_pastes_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_attributes_pastes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_attributes_pastes_id_seq OWNER TO stephenprater;

--
-- Name: vessell_attributes_pastes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_attributes_pastes_id_seq OWNED BY vessell_attributes_pastes.id;


--
-- Name: vessell_attributes_pastes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_attributes_pastes_id_seq', 1, false);


--
-- Name: vessell_citations; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_citations (
    id integer NOT NULL,
    vessell_id integer,
    citation_id integer,
    "order" integer
);


ALTER TABLE public.vessell_citations OWNER TO stephenprater;

--
-- Name: vessell_citations_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_citations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_citations_id_seq OWNER TO stephenprater;

--
-- Name: vessell_citations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_citations_id_seq OWNED BY vessell_citations.id;


--
-- Name: vessell_citations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_citations_id_seq', 1, false);


--
-- Name: vessell_colors; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_colors (
    id integer NOT NULL,
    location character varying(255),
    color_id integer
);


ALTER TABLE public.vessell_colors OWNER TO stephenprater;

--
-- Name: vessell_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_colors_id_seq OWNER TO stephenprater;

--
-- Name: vessell_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_colors_id_seq OWNED BY vessell_colors.id;


--
-- Name: vessell_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_colors_id_seq', 1, false);


--
-- Name: vessell_designs; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_designs (
    id integer NOT NULL,
    vessell_id integer,
    design_id integer,
    design_type character varying(255)
);


ALTER TABLE public.vessell_designs OWNER TO stephenprater;

--
-- Name: vessell_designs_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_designs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_designs_id_seq OWNER TO stephenprater;

--
-- Name: vessell_designs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_designs_id_seq OWNED BY vessell_designs.id;


--
-- Name: vessell_designs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_designs_id_seq', 1, false);


--
-- Name: vessell_surface_treatments; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_surface_treatments (
    id integer NOT NULL,
    vessell_id integer,
    surface_treatement_id integer,
    location character varying(255)
);


ALTER TABLE public.vessell_surface_treatments OWNER TO stephenprater;

--
-- Name: vessell_surface_treatments_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_surface_treatments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_surface_treatments_id_seq OWNER TO stephenprater;

--
-- Name: vessell_surface_treatments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_surface_treatments_id_seq OWNED BY vessell_surface_treatments.id;


--
-- Name: vessell_surface_treatments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_surface_treatments_id_seq', 1, false);


--
-- Name: vessell_type_variety; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessell_type_variety (
    id integer NOT NULL,
    vessell_id integer,
    type_variety_id integer,
    type_variety_type character varying(255)
);


ALTER TABLE public.vessell_type_variety OWNER TO stephenprater;

--
-- Name: vessell_type_variety_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessell_type_variety_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessell_type_variety_id_seq OWNER TO stephenprater;

--
-- Name: vessell_type_variety_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessell_type_variety_id_seq OWNED BY vessell_type_variety.id;


--
-- Name: vessell_type_variety_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessell_type_variety_id_seq', 1, false);


--
-- Name: vessells; Type: TABLE; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE TABLE vessells (
    id integer NOT NULL,
    form_date date,
    analyst character varying(255),
    project_name character varying(255),
    accession_number character varying(255),
    vessell_number character varying(255),
    other_catalog_information text,
    collection character varying(255),
    feature_number character varying(255),
    burial_number character varying(255),
    unit_of_measurement character varying(255),
    authenticity character varying(255),
    condition character varying(255),
    missing_portions character varying(255),
    use_wear character varying(255),
    cultural_affliation character varying(255),
    weight double precision,
    volume double precision,
    description text,
    comments text,
    photos_in_publication text,
    collegiate_pattern text,
    county_id integer,
    site_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.vessells OWNER TO stephenprater;

--
-- Name: vessells_id_seq; Type: SEQUENCE; Schema: public; Owner: stephenprater
--

CREATE SEQUENCE vessells_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vessells_id_seq OWNER TO stephenprater;

--
-- Name: vessells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephenprater
--

ALTER SEQUENCE vessells_id_seq OWNED BY vessells.id;


--
-- Name: vessells_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephenprater
--

SELECT pg_catalog.setval('vessells_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY appendages ALTER COLUMN id SET DEFAULT nextval('appendages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY area_techniques ALTER COLUMN id SET DEFAULT nextval('area_techniques_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY base_attributes ALTER COLUMN id SET DEFAULT nextval('base_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY body_attributes ALTER COLUMN id SET DEFAULT nextval('body_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY citations ALTER COLUMN id SET DEFAULT nextval('citations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY colors ALTER COLUMN id SET DEFAULT nextval('colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY compositions ALTER COLUMN id SET DEFAULT nextval('compositions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY counties ALTER COLUMN id SET DEFAULT nextval('counties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY design_structures ALTER COLUMN id SET DEFAULT nextval('design_structures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY effigies ALTER COLUMN id SET DEFAULT nextval('effigies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY elements ALTER COLUMN id SET DEFAULT nextval('elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY handle_attributes ALTER COLUMN id SET DEFAULT nextval('handle_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY lip_attributes ALTER COLUMN id SET DEFAULT nextval('lip_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY motifs ALTER COLUMN id SET DEFAULT nextval('motifs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY neck_attributes ALTER COLUMN id SET DEFAULT nextval('neck_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY pastes ALTER COLUMN id SET DEFAULT nextval('pastes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY photographs ALTER COLUMN id SET DEFAULT nextval('photographs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY rim_attributes ALTER COLUMN id SET DEFAULT nextval('rim_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY surface_treatments ALTER COLUMN id SET DEFAULT nextval('surface_treatments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY techniques ALTER COLUMN id SET DEFAULT nextval('techniques_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY tempers ALTER COLUMN id SET DEFAULT nextval('tempers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY typologies ALTER COLUMN id SET DEFAULT nextval('typologies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY varieties ALTER COLUMN id SET DEFAULT nextval('varieties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessel_attributes ALTER COLUMN id SET DEFAULT nextval('vessel_attributes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessel_attributes_tempers ALTER COLUMN id SET DEFAULT nextval('vessel_attributes_tempers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_attachments ALTER COLUMN id SET DEFAULT nextval('vessell_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_attributes_pastes ALTER COLUMN id SET DEFAULT nextval('vessell_attributes_pastes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_citations ALTER COLUMN id SET DEFAULT nextval('vessell_citations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_colors ALTER COLUMN id SET DEFAULT nextval('vessell_colors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_designs ALTER COLUMN id SET DEFAULT nextval('vessell_designs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_surface_treatments ALTER COLUMN id SET DEFAULT nextval('vessell_surface_treatments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessell_type_variety ALTER COLUMN id SET DEFAULT nextval('vessell_type_variety_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stephenprater
--

ALTER TABLE ONLY vessells ALTER COLUMN id SET DEFAULT nextval('vessells_id_seq'::regclass);


--
-- Data for Name: appendages; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY appendages (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: area_techniques; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY area_techniques (id, area_id, area_type, techinque_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: base_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY base_attributes (id, shape, decoration, diameter_at_top, diameter_at_bottom, vessell_id) FROM stdin;
\.


--
-- Data for Name: body_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY body_attributes (id, form, shape, mode, decoration, height, diameter, thickness, vessell_id) FROM stdin;
\.


--
-- Data for Name: citations; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY citations (id, author, date, publisher, title, page, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY colors (id, description, l, a, b, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: compositions; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY compositions (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: counties; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY counties (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: design_structures; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY design_structures (id, description, vessell_id) FROM stdin;
\.


--
-- Data for Name: effigies; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY effigies (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY elements (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: handle_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY handle_attributes (id, shape, decoration, appendage, vessell_id) FROM stdin;
\.


--
-- Data for Name: lip_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY lip_attributes (id, shape, decoration, thickness, vessell_id) FROM stdin;
\.


--
-- Data for Name: motifs; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY motifs (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: neck_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY neck_attributes (id, shape, decoration, height, thickness, orifice_diameter, mid_exterior_diameter, base_exterior_diameter, vessell_id) FROM stdin;
\.


--
-- Data for Name: pastes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY pastes (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: photographs; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY photographs (id, description, file_name, photographer, photo_number, vessell_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: rim_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY rim_attributes (id, shape, mode, continuous_profile, decoration, height, diameter, thickness, angle, vessell_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY schema_migrations (version) FROM stdin;
20120705180526
20120705180556
20120705180621
20120705180636
20120705180702
20120705182847
20120705182931
20120705182959
20120705183647
20120705183730
20120705183829
20120705183922
20120705184050
20120705184142
20120705184204
20120705184328
20120705184336
20120705184347
20120705184745
20120705185005
20120705185959
20120705190013
20120705190252
20120705190941
20120705195514
20120705195520
20120705195609
20120705200321
20120705200419
20120706190505
20120706190727
20120706192928
20120706203114
20120706204032
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY sites (id, county_id, description, site_number, amasda_record, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: surface_treatments; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY surface_treatments (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: techniques; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY techniques (id, name) FROM stdin;
\.


--
-- Data for Name: tempers; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY tempers (id, material, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: typologies; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY typologies (id, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: varieties; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY varieties (id, description, typologies_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vessel_attributes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessel_attributes (id, shape, carinated_vessell, effigy_vessell, height, max_diameter, max_diameter_at, paste_id) FROM stdin;
\.


--
-- Data for Name: vessel_attributes_tempers; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessel_attributes_tempers (id, size, abundance, grit_type, observation_method, vessel_attributes_id, temper_id) FROM stdin;
\.


--
-- Data for Name: vessell_attachments; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_attachments (id, location, vessell_id, attachment_id, attachment_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vessell_attributes_pastes; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_attributes_pastes (id, vessell_attributes_id, paste_id, compaction, hardness, smoothness, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vessell_citations; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_citations (id, vessell_id, citation_id, "order") FROM stdin;
\.


--
-- Data for Name: vessell_colors; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_colors (id, location, color_id) FROM stdin;
\.


--
-- Data for Name: vessell_designs; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_designs (id, vessell_id, design_id, design_type) FROM stdin;
\.


--
-- Data for Name: vessell_surface_treatments; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_surface_treatments (id, vessell_id, surface_treatement_id, location) FROM stdin;
\.


--
-- Data for Name: vessell_type_variety; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessell_type_variety (id, vessell_id, type_variety_id, type_variety_type) FROM stdin;
\.


--
-- Data for Name: vessells; Type: TABLE DATA; Schema: public; Owner: stephenprater
--

COPY vessells (id, form_date, analyst, project_name, accession_number, vessell_number, other_catalog_information, collection, feature_number, burial_number, unit_of_measurement, authenticity, condition, missing_portions, use_wear, cultural_affliation, weight, volume, description, comments, photos_in_publication, collegiate_pattern, county_id, site_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: appendages_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY appendages
    ADD CONSTRAINT appendages_pkey PRIMARY KEY (id);


--
-- Name: area_techniques_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY area_techniques
    ADD CONSTRAINT area_techniques_pkey PRIMARY KEY (id);


--
-- Name: base_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY base_attributes
    ADD CONSTRAINT base_attributes_pkey PRIMARY KEY (id);


--
-- Name: body_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY body_attributes
    ADD CONSTRAINT body_attributes_pkey PRIMARY KEY (id);


--
-- Name: citations_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY citations
    ADD CONSTRAINT citations_pkey PRIMARY KEY (id);


--
-- Name: colors_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: compositions_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY compositions
    ADD CONSTRAINT compositions_pkey PRIMARY KEY (id);


--
-- Name: counties_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY counties
    ADD CONSTRAINT counties_pkey PRIMARY KEY (id);


--
-- Name: design_structures_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY design_structures
    ADD CONSTRAINT design_structures_pkey PRIMARY KEY (id);


--
-- Name: effigies_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY effigies
    ADD CONSTRAINT effigies_pkey PRIMARY KEY (id);


--
-- Name: elements_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (id);


--
-- Name: handle_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY handle_attributes
    ADD CONSTRAINT handle_attributes_pkey PRIMARY KEY (id);


--
-- Name: lip_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY lip_attributes
    ADD CONSTRAINT lip_attributes_pkey PRIMARY KEY (id);


--
-- Name: motifs_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY motifs
    ADD CONSTRAINT motifs_pkey PRIMARY KEY (id);


--
-- Name: neck_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY neck_attributes
    ADD CONSTRAINT neck_attributes_pkey PRIMARY KEY (id);


--
-- Name: pastes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY pastes
    ADD CONSTRAINT pastes_pkey PRIMARY KEY (id);


--
-- Name: photographs_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY photographs
    ADD CONSTRAINT photographs_pkey PRIMARY KEY (id);


--
-- Name: rim_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY rim_attributes
    ADD CONSTRAINT rim_attributes_pkey PRIMARY KEY (id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: surface_treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY surface_treatments
    ADD CONSTRAINT surface_treatments_pkey PRIMARY KEY (id);


--
-- Name: techniques_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY techniques
    ADD CONSTRAINT techniques_pkey PRIMARY KEY (id);


--
-- Name: tempers_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY tempers
    ADD CONSTRAINT tempers_pkey PRIMARY KEY (id);


--
-- Name: typologies_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY typologies
    ADD CONSTRAINT typologies_pkey PRIMARY KEY (id);


--
-- Name: varieties_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY varieties
    ADD CONSTRAINT varieties_pkey PRIMARY KEY (id);


--
-- Name: vessel_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessel_attributes
    ADD CONSTRAINT vessel_attributes_pkey PRIMARY KEY (id);


--
-- Name: vessel_attributes_tempers_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessel_attributes_tempers
    ADD CONSTRAINT vessel_attributes_tempers_pkey PRIMARY KEY (id);


--
-- Name: vessell_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_attachments
    ADD CONSTRAINT vessell_attachments_pkey PRIMARY KEY (id);


--
-- Name: vessell_attributes_pastes_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_attributes_pastes
    ADD CONSTRAINT vessell_attributes_pastes_pkey PRIMARY KEY (id);


--
-- Name: vessell_citations_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_citations
    ADD CONSTRAINT vessell_citations_pkey PRIMARY KEY (id);


--
-- Name: vessell_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_colors
    ADD CONSTRAINT vessell_colors_pkey PRIMARY KEY (id);


--
-- Name: vessell_designs_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_designs
    ADD CONSTRAINT vessell_designs_pkey PRIMARY KEY (id);


--
-- Name: vessell_surface_treatments_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_surface_treatments
    ADD CONSTRAINT vessell_surface_treatments_pkey PRIMARY KEY (id);


--
-- Name: vessell_type_variety_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessell_type_variety
    ADD CONSTRAINT vessell_type_variety_pkey PRIMARY KEY (id);


--
-- Name: vessells_pkey; Type: CONSTRAINT; Schema: public; Owner: stephenprater; Tablespace: 
--

ALTER TABLE ONLY vessells
    ADD CONSTRAINT vessells_pkey PRIMARY KEY (id);


--
-- Name: index_vessell_attributes_pastes_on_vessell_attributes_id; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_attributes_pastes_on_vessell_attributes_id ON vessell_attributes_pastes USING btree (vessell_attributes_id);


--
-- Name: index_vessell_citations_on_citation_id; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_citations_on_citation_id ON vessell_citations USING btree (citation_id);


--
-- Name: index_vessell_citations_on_vessell_id; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_citations_on_vessell_id ON vessell_citations USING btree (vessell_id);


--
-- Name: index_vessell_surface_treatments_on_location; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_surface_treatments_on_location ON vessell_surface_treatments USING btree (location);


--
-- Name: index_vessell_surface_treatments_on_surface_treatement_id; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_surface_treatments_on_surface_treatement_id ON vessell_surface_treatments USING btree (surface_treatement_id);


--
-- Name: index_vessell_surface_treatments_on_vessell_id; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE INDEX index_vessell_surface_treatments_on_vessell_id ON vessell_surface_treatments USING btree (vessell_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: stephenprater; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: stephenprater
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM stephenprater;
GRANT ALL ON SCHEMA public TO stephenprater;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

