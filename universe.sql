--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    estimated_asteroid_count integer,
    average_distance_from_star_in_au numeric,
    contains_dwarf_planets boolean,
    is_stable boolean NOT NULL,
    description text
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_billions_of_years numeric,
    galaxy_type text NOT NULL,
    diameter_in_light_years integer,
    has_black_hole boolean NOT NULL,
    is_visible_to_naked_eye boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer,
    distance_from_planet_in_km integer,
    is_spherical boolean,
    has_water boolean NOT NULL,
    surface_temperature_in_celsius numeric
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius_in_km integer,
    distance_from_star_in_au numeric,
    has_atmosphere boolean,
    is_habitable boolean NOT NULL,
    planet_type text,
    orbital_period_in_days integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_in_kelvin integer,
    mass_solar_units numeric,
    is_binary boolean,
    has_planets boolean NOT NULL,
    color text
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Asteroid Belt', 1, 1500000, 2.7, true, true, 'Located between Mars and Jupiter');
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 1, 100000, 40.0, true, true, 'Beyond Neptune, contains Pluto and other dwarf planets');
INSERT INTO public.asteroid_belt VALUES (3, 'Scattered Disc', 1, 10000, 100.0, true, false, 'Overlaps with the Kuiper belt but extends much further');
INSERT INTO public.asteroid_belt VALUES (4, 'HR 8799 Debris Disk', 6, 75000, 90.0, false, true, 'Young star with a massive debris disk and exoplanets');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 'Spiral', 100000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.1, 'Spiral', 220000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13.0, 'Spiral', 60000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1.1, 'Irregular', 14000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 6.5, 'Irregular', 7000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13.3, 'Elliptical', 60000, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737, 384400, true, true, -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 9376, false, false, -40);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 23463, false, false, -40);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, 421700, true, false, -130);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, 671034, true, true, -160);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 1070412, true, true, -163);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 1882709, true, true, -139);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, 181300, false, false, -155);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 2575, 1221870, true, true, -179);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 764, 527108, true, false, -174);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 736, 3560820, true, false, -143);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 562, 377396, true, false, -186);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 533, 294619, true, false, -187);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 252, 238037, true, true, -198);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 236, 129390, true, false, -187);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 579, 190900, true, false, -213);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 585, 266000, true, false, -198);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788, 435910, true, false, -203);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 761, 583520, true, false, -193);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353, 354759, true, true, -235);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, 0.39, false, false, 'Terrestrial', 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, 0.72, true, false, 'Terrestrial', 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 1.0, true, true, 'Terrestrial', 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, 1.52, true, false, 'Terrestrial', 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, 5.2, true, false, 'Gas Giant', 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, 9.5, true, false, 'Gas Giant', 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, 19.8, true, false, 'Ice Giant', 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, 30.1, true, false, 'Ice Giant', 60190);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 7160, 0.05, true, true, 'Super Earth', 11);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 6, 6977, 0.35, true, true, 'Super Earth', 130);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 6, 94430, 0.05, true, false, 'Hot Jupiter', 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, 5840, 0.03, true, true, 'Terrestrial', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.0, false, true, 'Yellow');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 0.12, false, true, 'Red');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, 1.1, true, true, 'Yellow');
INSERT INTO public.star VALUES (4, 'Sirius', 1, 9940, 2.02, true, false, 'White');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 3500, 11.6, false, false, 'Red');
INSERT INTO public.star VALUES (6, 'Vega', 1, 9602, 2.1, false, true, 'Blue-white');


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 4, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

