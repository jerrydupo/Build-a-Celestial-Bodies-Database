--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    description text
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
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
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
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planets (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying,
    star_planets_id integer NOT NULL
);


ALTER TABLE public.star_planets OWNER TO freecodecamp;

--
-- Name: star_planets_star_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planets_star_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planets_star_planets_id_seq OWNER TO freecodecamp;

--
-- Name: star_planets_star_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planets_star_planets_id_seq OWNED BY public.star_planets.star_planets_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_planets star_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets ALTER COLUMN star_planets_id SET DEFAULT nextval('public.star_planets_star_planets_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 1610, 0, true, true, 'Our Home Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1924, 2500000, false, true, 'Nearest major spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10200, 1654, 3000000, false, true, 'Third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 9000, 1781, 28000000, false, false, 'Known for its prominent central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 400, 1773, 31000000, false, true, 'Classic interacting spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 25, 1781, 21000000, false, true, 'Highly asymmetrical face-on spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 4500, 1609, 384400, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 1877, 9376, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 1877, 23460, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 1610, 421700, false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 1610, 671100, false, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, 1610, 1070400, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, 1610, 1882700, false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, 1655, 1221870, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 4500, 1672, 527108, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4500, 1671, 3561300, false, true, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 4500, 1684, 377396, false, true, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4500, 1789, 237948, false, true, 6);
INSERT INTO public.moon VALUES (13, 'Titania', 4500, 1787, 435910, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 4500, 1787, 583519, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 4500, 1851, 266300, false, true, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 4500, 1851, 190900, false, true, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', 4500, 1948, 129390, false, true, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 4500, 1846, 354759, false, true, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 4500, 1989, 117647, false, false, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 4500, 1949, 5513400, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4503, -3000, 77000000, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4503, -1600, 38000000, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4540, 0, 0, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4503, 1610, 54600000, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4503, 1610, 588000000, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, 1610, 1200000000, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, 1781, 2600000000, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, 1846, 430000000, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4503, 1930, 4280000000, false, true, 1);
INSERT INTO public.planet VALUES (12, 'Draugr', 1000, 1994, 2300000000, false, true, 5);
INSERT INTO public.planet VALUES (10, 'Poltergeist', 1000, 1992, 2300000000, false, true, 2);
INSERT INTO public.planet VALUES (11, 'Phobetor', 1000, 1992, 2300000000, false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 1543, 0, false, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 240, 1844, 8, false, true, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 860, 1781, 8, false, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 10, 1836, 640, false, false, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4, 1915, 1, false, true, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', 60, 1781, 97, false, false, 2);


--
-- Data for Name: star_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planets VALUES (1, 1, NULL, 1);
INSERT INTO public.star_planets VALUES (1, 2, NULL, 2);
INSERT INTO public.star_planets VALUES (1, 3, NULL, 3);
INSERT INTO public.star_planets VALUES (1, 4, NULL, 4);
INSERT INTO public.star_planets VALUES (1, 5, NULL, 5);
INSERT INTO public.star_planets VALUES (1, 6, NULL, 6);
INSERT INTO public.star_planets VALUES (1, 7, NULL, 7);
INSERT INTO public.star_planets VALUES (1, 8, NULL, 8);
INSERT INTO public.star_planets VALUES (1, 9, NULL, 9);
INSERT INTO public.star_planets VALUES (5, 12, NULL, 10);
INSERT INTO public.star_planets VALUES (2, 10, NULL, 11);
INSERT INTO public.star_planets VALUES (2, 11, NULL, 12);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planets_star_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planets_star_planets_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planets star_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_pkey PRIMARY KEY (star_planets_id);


--
-- Name: star_planets star_planets_star_planets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_star_planets_id_key UNIQUE (star_planets_id);


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
-- Name: star_planets star_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_planets star_planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planets
    ADD CONSTRAINT star_planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

