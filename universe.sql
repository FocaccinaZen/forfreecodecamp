--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    n_stars integer,
    age integer,
    surface numeric(5,2),
    classification text NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    n_craters integer,
    age integer,
    surface numeric(5,2),
    classification text NOT NULL,
    has_rover boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    n_species integer,
    age integer,
    surface numeric(5,2),
    classification text NOT NULL,
    gas_giants boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rover; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rover (
    rover_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed integer,
    km_travelled numeric,
    owner text NOT NULL,
    active boolean NOT NULL,
    moon_id integer
);


ALTER TABLE public.rover OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rover_rover_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rover_rover_id_seq OWNER TO freecodecamp;

--
-- Name: rover_rover_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rover_rover_id_seq OWNED BY public.rover.rover_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_age integer,
    orbital_speed integer,
    surface numeric(5,2),
    classification text NOT NULL,
    is_hot boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: rover rover_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover ALTER COLUMN rover_id SET DEFAULT nextval('public.rover_rover_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lattea', 400, 137, 10.50, 'Galassia spirale barrata', true);
INSERT INTO public.galaxy VALUES (2, 'Galassia Nana della Fornace', 350, 140, 5.70, 'Galassia nana sferoidale', false);
INSERT INTO public.galaxy VALUES (3, 'Galassia Nana della Fenice', 240, 126, 6.80, 'Galassia nana irregolare', false);
INSERT INTO public.galaxy VALUES (4, 'Nana del Orsa Maggiore', 360, 254, 7.90, 'Galassia nana sferoidale', true);
INSERT INTO public.galaxy VALUES (5, 'Andromeda II', 354, 695, 9.90, 'Galassia Sferoidale', true);
INSERT INTO public.galaxy VALUES (6, 'Galassia Nana della Carena', 345, 130, 4.70, 'Galassia nana sferoidale', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'cioccolato fondente', 4456, 793, 693.70, 'natural satellite', false, 6);
INSERT INTO public.moon VALUES (2, 'crema', 123, 45600, 450.90, 'natural satellite', false, 2);
INSERT INTO public.moon VALUES (3, 'cioccolato', 2234, 551, 257.80, 'natural satellite', false, 2);
INSERT INTO public.moon VALUES (4, 'vaniglia', 8865, 358, 243.10, 'natural satellite', true, 2);
INSERT INTO public.moon VALUES (5, 'nocciola', 9865, 665, 432.60, 'natural satellite', false, 5);
INSERT INTO public.moon VALUES (6, 'cioccolato bianco', 7554, 675, 785.80, 'natural satellite', true, 9);
INSERT INTO public.moon VALUES (7, 'biscotto', 5567, 459, 865.90, 'natural satellite', false, 6);
INSERT INTO public.moon VALUES (8, 'stracciatella', 4456, 223, 314.00, 'natural satellite', true, 6);
INSERT INTO public.moon VALUES (9, 'liquirizia', 5644, 451, 398.80, 'natural satellte', false, 4);
INSERT INTO public.moon VALUES (10, 'fiordilatte', 7765, 564, 159.70, 'natural satellite', false, 10);
INSERT INTO public.moon VALUES (11, 'zabaione', 5543, 897, 582.50, 'natural satellite', false, 11);
INSERT INTO public.moon VALUES (12, 'pistacchio', 5875, 548, 736.90, 'natural satellite', false, 10);
INSERT INTO public.moon VALUES (13, 'limone', 4432, 723, 443.60, 'natural satellite', false, 5);
INSERT INTO public.moon VALUES (14, 'lampone', 9897, 776, 865.90, 'natural satellite', false, 8);
INSERT INTO public.moon VALUES (15, 'mirtillo', 8865, 765, 729.90, 'natural satellite', true, 5);
INSERT INTO public.moon VALUES (16, 'gianduiotto', 4336, 733, 613.70, 'natural satellite', false, 7);
INSERT INTO public.moon VALUES (17, 'caffe', 5587, 943, 386.90, 'natural satellite', true, 7);
INSERT INTO public.moon VALUES (18, 'cannella', 3335, 217, 678.30, 'natural satellite', false, 7);
INSERT INTO public.moon VALUES (19, 'fragola', 4537, 535, 481.50, 'natural satellite', false, 4);
INSERT INTO public.moon VALUES (20, 'tiramisu', 8843, 648, 842.60, 'natural satellite', false, 5);
INSERT INTO public.moon VALUES (21, 'yogurt', 4876, 883, 285.70, 'natural satellite', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sauron', 0, 123, 34.50, 'Pianta nero', false, 1);
INSERT INTO public.planet VALUES (2, 'Beggins', 565, 763, 24.60, 'Pianeta Gioiso', false, 1);
INSERT INTO public.planet VALUES (3, 'Gandalf', 334, 876, 66.70, 'Pianeta Magico', false, 1);
INSERT INTO public.planet VALUES (4, 'Legolas', 0, 556, 78.90, 'Gigante elfico', true, 1);
INSERT INTO public.planet VALUES (5, 'Thor', 867, 418, 56.80, 'Pianeta biondo', false, 2);
INSERT INTO public.planet VALUES (6, 'Spiderman', 122, 147, 24.50, 'Pianta Yorkese', false, 2);
INSERT INTO public.planet VALUES (7, 'Hulk', 999, 456, 123.60, 'Pianeta Verdastro', false, 2);
INSERT INTO public.planet VALUES (8, 'Vedova Nera', 424, 453, 79.70, 'Pianeta nero', false, 2);
INSERT INTO public.planet VALUES (9, 'Abafar', 45, 789, 134.90, 'Deserto giallo', false, 3);
INSERT INTO public.planet VALUES (10, 'Devoran', 176, 490, 23.80, 'Pianeta colonico', false, 3);
INSERT INTO public.planet VALUES (11, 'Eriadu', 564, 542, 456.70, 'Orlo Esterno', false, 3);
INSERT INTO public.planet VALUES (12, 'Garfield', 1, 363, 14.60, 'Pianeta Lasagna', false, 4);


--
-- Data for Name: rover; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rover VALUES (1, 'R2-D2', 2, 456.8, 'galatic empire', true, 4);
INSERT INTO public.rover VALUES (2, 'lunochod', 1, 10.0, 'URSS', false, 6);
INSERT INTO public.rover VALUES (3, 'spirit', 2, 7.7, 'USA', false, 8);
INSERT INTO public.rover VALUES (4, 'opportunity', 3, 45.2, 'USA', false, 15);
INSERT INTO public.rover VALUES (5, 'zhurong', 2, 2.7, 'CHN', false, 17);
INSERT INTO public.rover VALUES (6, 'curiosity', 2, 15.0, 'USA', false, 21);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Vega', 572, 274, 2.42, 'Stella bianca', false, 2);
INSERT INTO public.star VALUES (2, 'Altair', 1400, 285, 2.02, 'Stella bianca', false, 5);
INSERT INTO public.star VALUES (3, 'Arturo', 7900, 176, 35.60, 'Gigante Arancione', true, 3);
INSERT INTO public.star VALUES (4, 'Aldebaran', 6400, 430, 61.12, 'Gigante Arancione', true, 1);
INSERT INTO public.star VALUES (5, 'Deneb', 11, 20, 203.00, 'Supergigante bianca', false, 4);
INSERT INTO public.star VALUES (6, 'Antares', 1100, 10, 11.50, 'Supregigante rossa', true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: rover_rover_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rover_rover_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rover rover_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_name_key UNIQUE (name);


--
-- Name: rover rover_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_pkey PRIMARY KEY (rover_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: rover rover_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rover
    ADD CONSTRAINT rover_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- PostgreSQL database dump complete
--

