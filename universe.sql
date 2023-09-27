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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(25) NOT NULL,
    will_it_crash_with_earth boolean,
    radius_in_km numeric,
    speed_in_km numeric,
    moon_id integer,
    how_old_is_it integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    speed_in_km numeric,
    name character varying(25) NOT NULL,
    color text,
    distance_from_milkyway numeric,
    mass integer
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
    name character varying(25) NOT NULL,
    age_in_million_years numeric,
    radius_in_km numeric,
    weight_in_ton numeric,
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
    name character varying(25) NOT NULL,
    size_in_km numeric,
    does_it_have_a_moon boolean,
    weight_in_ton numeric,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    size text,
    mass numeric,
    color text,
    does_it_have_a_solar_system boolean,
    galaxy_id integer,
    gravity numeric
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Haley', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.asteroid VALUES (2, 'Whatnot', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.asteroid VALUES (3, 'Hen', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, NULL, 'Sombrero-hat', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, NULL, 'Samsung', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, NULL, 'Whirlpool-galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, NULL, 'Black_eye-galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, NULL, 'Cigar-galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Mooncha', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (23, 'Mooncha1', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (24, 'Mooncha12', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (25, 'Mooncha123', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (26, 'Mooncha1234', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (27, 'Mooncha12345', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (28, 'Mooncha123456', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (29, 'Mooncha1234567', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (30, 'Mooncha12345678', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (31, 'Moon', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (32, 'Moon1', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (33, 'Moon12', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (34, 'Moon123', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (35, 'Moon1234', NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES (36, 'Moon12345', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (37, 'Moonish', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (38, 'Moonish1', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (39, 'Moonish2', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (40, 'Moonish23', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (41, 'Moonish234', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (42, 'Moonish2345', NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (43, 'Moonish23456', NULL, NULL, NULL, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (15, 'Earthys', NULL, NULL, NULL, 9);
INSERT INTO public.planet VALUES (17, 'Earthyss', NULL, NULL, NULL, 10);
INSERT INTO public.planet VALUES (18, 'Earthyss1', NULL, NULL, NULL, 10);
INSERT INTO public.planet VALUES (19, 'Earthyss12', NULL, NULL, NULL, 10);
INSERT INTO public.planet VALUES (20, 'Earthys12', NULL, NULL, NULL, 10);
INSERT INTO public.planet VALUES (21, 'Earthysss12', NULL, NULL, NULL, 11);
INSERT INTO public.planet VALUES (22, 'Planet', NULL, NULL, NULL, 11);
INSERT INTO public.planet VALUES (23, 'Planet1', NULL, NULL, NULL, 12);
INSERT INTO public.planet VALUES (24, 'Planet12', NULL, NULL, NULL, 13);
INSERT INTO public.planet VALUES (25, 'Planet11', NULL, NULL, NULL, 14);
INSERT INTO public.planet VALUES (28, 'Planet121', NULL, NULL, NULL, 14);
INSERT INTO public.planet VALUES (29, 'Planet1213', NULL, NULL, NULL, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (9, 'Sun', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.star VALUES (10, 'Sun1', NULL, NULL, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (11, 'Sun2', NULL, NULL, NULL, NULL, 3, NULL);
INSERT INTO public.star VALUES (12, 'Sun3', NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.star VALUES (13, 'Sun4', NULL, NULL, NULL, NULL, 5, NULL);
INSERT INTO public.star VALUES (14, 'Sun5', NULL, NULL, NULL, NULL, 6, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_distance_from_milkyway_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_milkyway_key UNIQUE (distance_from_milkyway);


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
-- Name: star star_gravity_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_gravity_key UNIQUE (gravity);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

