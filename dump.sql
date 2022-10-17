--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    user_id integer NOT NULL,
    link_url text NOT NULL,
    short_url text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.views (
    id integer NOT NULL,
    link_id integer NOT NULL,
    visit_count integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: views_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.views_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.views_id_seq OWNED BY public.views.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: views id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views ALTER COLUMN id SET DEFAULT nextval('public.views_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (1, 11, 'https://www.google.com/', 'Jb43cGm1', '2022-10-17 12:49:01.07556');
INSERT INTO public.links VALUES (2, 11, 'https://twitter.com/', 'VRBdJ1gH', '2022-10-17 12:49:17.433859');
INSERT INTO public.links VALUES (3, 11, 'https://www.facebook.com/', 'eTrBZGD5', '2022-10-17 12:49:29.138029');
INSERT INTO public.links VALUES (4, 2, 'www.notion.so/', 'mRS69bD6', '2022-10-17 12:55:43.933393');
INSERT INTO public.links VALUES (5, 2, 'www.notion.so/', '6-wseNGU', '2022-10-17 12:55:47.846038');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 4, '66b032ea-6d06-480a-bf5f-6a2c815a93ec', true, '2022-10-17 12:41:43.166385');
INSERT INTO public.sessions VALUES (2, 11, '07d40c1e-2c92-4fb8-bd78-e98c9fb57330', true, '2022-10-17 12:44:58.669044');
INSERT INTO public.sessions VALUES (3, 3, '542849e5-aa69-41ca-973c-56719466b697', true, '2022-10-17 12:45:34.89473');
INSERT INTO public.sessions VALUES (4, 2, '05cf04f8-7c00-4582-acc3-9ba02315d592', true, '2022-10-17 12:45:40.854217');
INSERT INTO public.sessions VALUES (5, 9, '9ebf65a2-cab9-4dfd-8986-6964cdc2b1d2', true, '2022-10-17 12:45:49.457207');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Maria Laura', 'maria@gmail.com', '$2b$12$o0Wr0Lxtb4Rt.6C.d1eTaOVMzq.8Y7YpwAfsPPmAvZjCKcBCmy2Gm', '2022-10-17 12:40:18.421317');
INSERT INTO public.users VALUES (2, 'Brunna', 'brunna@gmail.com', '$2b$12$2zTY1oHJSNE0Zle/vKxx9OiFn/AsYLL66hX1rZF.62i6t1FGEONB2', '2022-10-17 12:40:38.466629');
INSERT INTO public.users VALUES (3, 'João Luíz', 'joaoluiz@gmail.com', '$2b$12$RPQNIWsK1EPx6jpm9SGwZOEndW6aKr3I713sMrAxGNZXF6otTsicC', '2022-10-17 12:41:02.058757');
INSERT INTO public.users VALUES (4, 'Jeferson Silva', 'jeferson@gmail.com', '$2b$12$wE.HVjLzZSgDew0004fIB.eZUb19AOR3fI6VLmABjq1opL.4grIbS', '2022-10-17 12:41:17.400066');
INSERT INTO public.users VALUES (5, 'Annamaria da Luz', 'annamariadaluz@gmail.com', '$2b$12$A9hZkD8BrIzcw0LcpZ/lpOOsk9u2K4y3tR5mmF2crwV9cS5e7t7Za', '2022-10-17 12:42:17.333864');
INSERT INTO public.users VALUES (6, 'Seu Jorge', 'seujorge@gmail.com', '$2b$12$Ehjua6Z0Uy8rHFr4qZw9s.qSr0Ro3ZaUSF6x7O0p0SUCmTiTEL5Ja', '2022-10-17 12:42:30.448402');
INSERT INTO public.users VALUES (7, 'Angélica da Pinta', 'angelicadapinta@gmail.com', '$2b$12$6EyB/QipbgnsgDpoBBBnce1VbUE8PXVEyjv9jtmjK19yNW538AZs.', '2022-10-17 12:42:46.991872');
INSERT INTO public.users VALUES (8, 'Eleonor', 'eleonorthegoodplace@gmail.com', '$2b$12$TKfNRxf2uqu7OsvwrCpSZu/4ZsKGSYybN.jTHfd.szRY6d.8oOR7C', '2022-10-17 12:43:02.75343');
INSERT INTO public.users VALUES (9, 'Ivete', 'ivetemainha@gmail.com', '$2b$12$bVVtSBH0o8MfnY6DUDbPBOyrlT8xYbNj/OnKDU7l/tdexTdXzKTum', '2022-10-17 12:43:16.237837');
INSERT INTO public.users VALUES (10, 'Amy Santiago', 'amysantiagob99@gmail.com', '$2b$12$2ZQt0jH9FLBWinNI3lYM2OM15IVzODkoADOC/EL.l7vashKYeU9Uu', '2022-10-17 12:44:05.57094');
INSERT INTO public.users VALUES (11, 'Terry Crews', 'terrycrews@gmail.com', '$2b$12$ZWLCTaFwxcDzxhmaghzcEeatJgEqGAekgvAwtNMH.k7xpdYr46H1C', '2022-10-17 12:44:23.0904');


--
-- Data for Name: views; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.views VALUES (1, 1, 1, '2022-10-17 12:53:59.627029');
INSERT INTO public.views VALUES (2, 1, 1, '2022-10-17 12:54:00.516844');
INSERT INTO public.views VALUES (3, 1, 1, '2022-10-17 12:54:01.392091');
INSERT INTO public.views VALUES (4, 1, 1, '2022-10-17 12:54:02.180171');
INSERT INTO public.views VALUES (5, 1, 1, '2022-10-17 12:54:02.64237');
INSERT INTO public.views VALUES (6, 1, 1, '2022-10-17 12:54:03.02941');
INSERT INTO public.views VALUES (7, 1, 1, '2022-10-17 12:54:03.503086');
INSERT INTO public.views VALUES (8, 1, 1, '2022-10-17 12:54:04.017445');
INSERT INTO public.views VALUES (9, 1, 1, '2022-10-17 12:54:04.586841');
INSERT INTO public.views VALUES (10, 1, 1, '2022-10-17 12:54:05.11134');
INSERT INTO public.views VALUES (11, 1, 1, '2022-10-17 12:54:05.677241');
INSERT INTO public.views VALUES (12, 1, 1, '2022-10-17 12:54:06.105125');
INSERT INTO public.views VALUES (13, 1, 1, '2022-10-17 12:54:06.650848');
INSERT INTO public.views VALUES (14, 1, 1, '2022-10-17 12:54:07.225964');
INSERT INTO public.views VALUES (15, 1, 1, '2022-10-17 12:54:07.797755');
INSERT INTO public.views VALUES (16, 2, 1, '2022-10-17 12:54:31.623789');
INSERT INTO public.views VALUES (17, 2, 1, '2022-10-17 12:54:32.301176');
INSERT INTO public.views VALUES (18, 2, 1, '2022-10-17 12:54:32.891229');
INSERT INTO public.views VALUES (19, 2, 1, '2022-10-17 12:54:33.564394');
INSERT INTO public.views VALUES (20, 5, 1, '2022-10-17 12:55:57.4845');
INSERT INTO public.views VALUES (21, 5, 1, '2022-10-17 12:55:57.97987');
INSERT INTO public.views VALUES (22, 5, 1, '2022-10-17 12:56:02.647663');
INSERT INTO public.views VALUES (23, 5, 1, '2022-10-17 12:56:15.61791');
INSERT INTO public.views VALUES (24, 4, 1, '2022-10-17 12:56:30.995813');
INSERT INTO public.views VALUES (25, 4, 1, '2022-10-17 12:57:05.106008');
INSERT INTO public.views VALUES (26, 4, 1, '2022-10-17 12:57:31.141802');
INSERT INTO public.views VALUES (27, 4, 1, '2022-10-17 12:58:29.694396');
INSERT INTO public.views VALUES (28, 4, 1, '2022-10-17 12:59:33.99449');
INSERT INTO public.views VALUES (29, 1, 1, '2022-10-17 12:59:42.799861');
INSERT INTO public.views VALUES (30, 1, 1, '2022-10-17 12:59:57.00946');
INSERT INTO public.views VALUES (31, 5, 1, '2022-10-17 13:00:07.431554');
INSERT INTO public.views VALUES (32, 5, 1, '2022-10-17 13:00:47.99245');
INSERT INTO public.views VALUES (33, 5, 1, '2022-10-17 13:02:57.643424');
INSERT INTO public.views VALUES (34, 5, 1, '2022-10-17 13:03:02.533201');
INSERT INTO public.views VALUES (35, 5, 1, '2022-10-17 13:03:03.60117');
INSERT INTO public.views VALUES (36, 5, 1, '2022-10-17 13:03:26.665621');
INSERT INTO public.views VALUES (38, 5, 1, '2022-10-17 13:04:25.14103');
INSERT INTO public.views VALUES (39, 5, 1, '2022-10-17 13:05:05.41523');
INSERT INTO public.views VALUES (40, 5, 1, '2022-10-17 13:05:10.90237');
INSERT INTO public.views VALUES (41, 3, 1, '2022-10-17 13:06:11.434911');
INSERT INTO public.views VALUES (42, 3, 1, '2022-10-17 13:06:27.762364');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 5, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.views_id_seq', 42, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: links links_short_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_short_url_key UNIQUE (short_url);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: views views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_pkey PRIMARY KEY (id);


--
-- Name: links links_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: views views_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.views
    ADD CONSTRAINT views_link_id_fkey FOREIGN KEY (link_id) REFERENCES public.links(id);


--
-- PostgreSQL database dump complete
--

