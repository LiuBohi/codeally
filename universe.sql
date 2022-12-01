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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    types_id integer
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    types_id integer,
    galaxy_id integer,
    volumn integer,
    mass integer
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
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    types_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.types_id;


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
-- Name: types types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN types_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of the Earth', true, false, 13800.00, 26966.00, 3);
INSERT INTO public.galaxy VALUES (2, 'Segue 1', 'Satellite of Milky Way', false, false, NULL, 75000.00, 4);
INSERT INTO public.galaxy VALUES (3, 'Segue 2', 'Satellite of Milky Way', false, false, NULL, 110000.00, 4);
INSERT INTO public.galaxy VALUES (4, 'Willman 1', 'Satellite of Milky Way', false, false, NULL, 120000.00, 5);
INSERT INTO public.galaxy VALUES (5, 'Ursa Minor Dwarf', 'Satellite of Milky Way', false, false, NULL, 225000.00, 2);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Dwarf', 'Satellite of Milky Way', false, false, NULL, 290000.00, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The brightest and largest object in night sky', false, true, 50.00, 384400.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The innermost natural satellite of Mars', false, true, 20000.00, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Io', 'The innermost moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Europa', 'The smallest moon orbiting Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in solar system', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'The second largest moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Amelthea', 'The third moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', 'The largest irregular satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Elara', 'A prograde irregular moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Pasiphae', 'A retrograde irregular satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Sinope', 'A retrograde irregular satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Lysithea', 'A prograde irregular statellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'Carme', 'A retrograde satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Ananke', 'A retrograde satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'Leda', 'A prograde irregular satellite of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Thebe', 'The fourth moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Adrastea', 'The second moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Metis', 'The innermost moon of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'Callirrhoe', 'Outer moon  of Jupiter', false, true, NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Themisto', 'A prograde irregular satellite of Jupiter', false, true, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The closest planet to the Sun', false, true, NULL, 0.61, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun', false, true, NULL, 0.28, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only astronomical object to harbor life', true, true, NULL, 0.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun', false, true, NULL, 0.52, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The fifth planet from the Sun', false, true, NULL, 4.20, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun', false, true, NULL, 8.52, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun', false, true, NULL, 18.21, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun', false, true, NULL, 129.37, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'An exoplanet orbiting start Proxima Centeri', false, true, 5000.00, 4.20, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauei b', 'An exoplanet orbiting Alpah Centauri C', false, true, NULL, 4.20, 7);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'An exoplanet orbiting Alpha Centauri C', false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri d', 'An exoplanet orbiting Alpha Centair C', false, true, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'One of the triple star system in Centaurus', false, true, 5000.00, 4.37, 10, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'One of the triple star system in Centaurus', false, true, 2700.00, 4.37, 10, 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius A', 'The brightest star in the night sky', false, true, 242.00, 8.60, 8, 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Sirius B', 'The brightest star in the night sky', false, true, 228.00, 8.70, 8, 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Procyon A', 'The brightest star in Cains Minor', false, true, 1870.00, 11.50, 9, 1, NULL, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'Star at the center of the solar system', false, true, 4600.00, 0.00, 10, 1, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Alpha Centauri C', 'One of the triple star system in Centaurus', false, true, NULL, NULL, 10, 1, NULL, NULL);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'dE3', NULL);
INSERT INTO public.types VALUES (2, 'dE4', NULL);
INSERT INTO public.types VALUES (3, 'SBbc', NULL);
INSERT INTO public.types VALUES (4, 'dSph', NULL);
INSERT INTO public.types VALUES (5, 'Star Clus', NULL);
INSERT INTO public.types VALUES (6, 'O', NULL);
INSERT INTO public.types VALUES (7, 'B', NULL);
INSERT INTO public.types VALUES (8, 'A', NULL);
INSERT INTO public.types VALUES (9, 'F', NULL);
INSERT INTO public.types VALUES (10, 'G', NULL);
INSERT INTO public.types VALUES (11, 'K', NULL);
INSERT INTO public.types VALUES (12, 'M', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 12, true);


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
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (types_id);


--
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (types_id) REFERENCES public.types(types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

