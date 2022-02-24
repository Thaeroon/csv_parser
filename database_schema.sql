--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.action (
    action_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.action OWNER TO csv_parser;

--
-- Name: action_action_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.action_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_action_id_seq OWNER TO csv_parser;

--
-- Name: action_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.action_action_id_seq OWNED BY public.action.action_id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.country OWNER TO csv_parser;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO csv_parser;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.country.country_id;


--
-- Name: domain; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.domain (
    domain_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.domain OWNER TO csv_parser;

--
-- Name: domain_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.domain_domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_domain_id_seq OWNER TO csv_parser;

--
-- Name: domain_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.domain_domain_id_seq OWNED BY public.domain.domain_id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.event (
    event_id uuid NOT NULL,
    "timestamp" date NOT NULL,
    user_id integer NOT NULL,
    country_id integer NOT NULL,
    ip text NOT NULL,
    uri_id integer NOT NULL,
    action_id integer NOT NULL
);


ALTER TABLE public.event OWNER TO csv_parser;

--
-- Name: event_tag; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.event_tag (
    event_id uuid NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.event_tag OWNER TO csv_parser;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.tag OWNER TO csv_parser;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_tag_id_seq OWNER TO csv_parser;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;


--
-- Name: uri; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public.uri (
    uri_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.uri OWNER TO csv_parser;

--
-- Name: uri_uri_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.uri_uri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uri_uri_id_seq OWNER TO csv_parser;

--
-- Name: uri_uri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.uri_uri_id_seq OWNED BY public.uri.uri_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: csv_parser
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    mail text NOT NULL,
    domain_id integer
);


ALTER TABLE public."user" OWNER TO csv_parser;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: csv_parser
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO csv_parser;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: csv_parser
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- Name: action action_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.action ALTER COLUMN action_id SET DEFAULT nextval('public.action_action_id_seq'::regclass);


--
-- Name: country country_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Name: domain domain_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.domain ALTER COLUMN domain_id SET DEFAULT nextval('public.domain_domain_id_seq'::regclass);


--
-- Name: tag tag_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- Name: uri uri_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.uri ALTER COLUMN uri_id SET DEFAULT nextval('public.uri_uri_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (action_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: domain domain_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (domain_id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (event_id, tag_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);


--
-- Name: uri uri_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.uri
    ADD CONSTRAINT uri_pkey PRIMARY KEY (uri_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: event event_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_action_fkey FOREIGN KEY (action_id) REFERENCES public.action(action_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: event event_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_country_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: event_tag event_tag_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(event_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_tag event_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event_tag
    ADD CONSTRAINT event_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: event event_uri_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_uri_fkey FOREIGN KEY (uri_id) REFERENCES public.uri(uri_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: event event_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_user_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: user user_domain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: csv_parser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_domain_id_fkey FOREIGN KEY (domain_id) REFERENCES public.domain(domain_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

