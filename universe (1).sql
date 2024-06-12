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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying,
    number_of_stars_in_billions integer,
    age_in_billions_of_years numeric(8,2),
    constellation character varying
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying NOT NULL,
    destination character varying,
    length_in_days integer,
    object character varying
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.missions_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    planet_id integer,
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    habitable boolean,
    orbit_type character varying,
    planet text,
    length_of_orbit_in_earth_days numeric(8,2)
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
    star_id integer,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    type text NOT NULL,
    habitable boolean NOT NULL,
    number_of_moons integer NOT NULL,
    distance_from_earth_in_au numeric(10,2),
    number_of_earth_days_in_a_year numeric(8,2)
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
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL,
    number_of_planets integer,
    distance_from_earth_in_au numeric(6,2),
    constellation character varying
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.missions_mission_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 300, 13.60, NULL);
INSERT INTO public.galaxy VALUES (2, 'NGC 4622 AKA Backward Galaxy', 'Unbarred Spiral', 1, NULL, 'Centaurus');
INSERT INTO public.galaxy VALUES (3, 'NGC 3034 AKA Cigar Galaxy', 'Starburst', 30, 13.30, 'Ursa Major');
INSERT INTO public.galaxy VALUES (4, 'NGC 4151 AKA Eye of Sauron', 'intermediate spiral Seyfert', NULL, NULL, 'Canes Venatici');
INSERT INTO public.galaxy VALUES (5, 'UGC 10214 AKA Tadpole Galaxy', 'Barred Spiral', NULL, 0.10, 'Draco');
INSERT INTO public.galaxy VALUES (6, 'PGC 5060432 AKA Peekaboo Galaxy', 'Irregular compact blue dwarf galaxy', NULL, NULL, 'Hydra');


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Juno', 'Jupiter', 4675, 'Understand the origin and evolution of Jupiter');
INSERT INTO public.mission VALUES (2, 'Parker Solar Probe', 'Sun', 2555, 'Trace the flow of energy that heats and accelerates the solar corona and solar wind. Determine the structure and dynamics of the plasma and magnetic fields at the sources of the solar wind. Explore mechanisms that accelerate and transport energetic particles.
');
INSERT INTO public.mission VALUES (3, 'Mariner 3', 'Mars', 243, 'Mars Flyby');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 2, 'Phobos', false, 'Equatorial', 'Mars', 0.33);
INSERT INTO public.moon VALUES (4, 3, 'Deimos', false, 'Equatorial', 'Mars', 1.26);
INSERT INTO public.moon VALUES (5, 4, 'Io', false, 'Elliptical', 'Jupiter', 1.77);
INSERT INTO public.moon VALUES (5, 5, 'Europa', false, 'Eliptical', 'Jupiter', 3.50);
INSERT INTO public.moon VALUES (5, 7, 'Callisto', false, 'Elliptical', 'Jupiter', 17.00);
INSERT INTO public.moon VALUES (5, 8, 'Thebe', false, 'Elliptical', 'Jupiter', 0.67);
INSERT INTO public.moon VALUES (5, 9, 'Euporie', false, 'Elliptical', 'Jupiter', 550.00);
INSERT INTO public.moon VALUES (5, 6, 'Ganymede', false, 'Eliptical', 'Jupiter', 7.00);
INSERT INTO public.moon VALUES (6, 10, 'Titan', true, 'Elliptical', 'Saturn', 16.00);
INSERT INTO public.moon VALUES (6, 11, 'Enceladus', true, 'Elliptical', 'Saturn', 1.37);
INSERT INTO public.moon VALUES (6, 12, 'Hyperion', false, 'Eccentric', 'Saturn', 21.00);
INSERT INTO public.moon VALUES (6, 13, 'Prometheus', false, 'Elliptical', 'Saturn', 0.61);
INSERT INTO public.moon VALUES (6, 14, 'Pandora', true, 'Elliptical', 'Saturn', 0.63);
INSERT INTO public.moon VALUES (7, 15, 'Ariel', false, 'Regular', 'Uranus', 2.52);
INSERT INTO public.moon VALUES (7, 16, 'Titania', true, 'Regular', 'Uranus', 8.70);
INSERT INTO public.moon VALUES (7, 17, 'Oberon', true, 'Regular', 'Uranus', 13.50);
INSERT INTO public.moon VALUES (7, 18, 'Ophelia', false, 'Synchronous', 'Uranus', 0.38);
INSERT INTO public.moon VALUES (7, 19, 'Desdemona', false, 'Elliptical', 'Uranus', 0.47);
INSERT INTO public.moon VALUES (7, 20, 'Puck', false, 'Elliptical', 'Uranus', 0.76);
INSERT INTO public.moon VALUES (3, 1, 'Moon', false, 'Elliptical', 'Earth', 27.00);
INSERT INTO public.moon VALUES (8, 21, 'Thalassa', false, 'Prograde', 'Neptune', 0.30);
INSERT INTO public.moon VALUES (8, 22, 'Triton', false, 'Retrograde', 'Neptune', 5.85);
INSERT INTO public.moon VALUES (8, 23, 'Halimede', true, 'Retrograde', 'Neptune', 1879.00);
INSERT INTO public.moon VALUES (8, 24, 'Sao', false, 'Prograde', 'Neptune', 2913.00);
INSERT INTO public.moon VALUES (8, 25, 'Neso', false, 'Retrograde', 'Neptune', 9734.55);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', false, 0, 1.04, 88.00);
INSERT INTO public.planet VALUES (1, 2, 'Venus', 'Terrestrial', false, 0, 1.73, 225.00);
INSERT INTO public.planet VALUES (1, 3, 'Earth', 'Terrestrial', true, 1, 0.00, 365.00);
INSERT INTO public.planet VALUES (1, 4, 'Mars', 'Terrestrial', false, 2, 2.67, 687.00);
INSERT INTO public.planet VALUES (1, 5, 'Jupiter', 'Gas Giant', false, 95, 6.55, 4333.00);
INSERT INTO public.planet VALUES (1, 6, 'Saturn', 'Gas Giant', false, 146, 11.05, 10759.00);
INSERT INTO public.planet VALUES (1, 7, 'Uranus', 'Ice Giant', false, 27, 21.09, 30687.00);
INSERT INTO public.planet VALUES (1, 8, 'Neptune', 'Ice Giant', false, 14, 31.32, 60190.00);
INSERT INTO public.planet VALUES (2, 9, 'Trappist-1 E', 'Terrestrial', true, 0, 2573912.00, 6.10);
INSERT INTO public.planet VALUES (2, 10, 'Trappist-1 F', 'Terrestrial', false, 0, 2024000.00, 9.20);
INSERT INTO public.planet VALUES (2, 11, 'Trappist-1 G', 'Terrestrial', true, 0, 2573912.00, 12.40);
INSERT INTO public.planet VALUES (3, 12, 'Proxima Centauri B', 'Super Earth Exoplanet', true, 0, 268770.00, 11.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Yellow Dwarf', 8, 1.00, NULL);
INSERT INTO public.star VALUES (1, 2, 'Trappist-1', 'cool red dwarf', 7, 41.00, 'Aquarius');
INSERT INTO public.star VALUES (1, 3, 'Proxima Centauri', 'Red Dwarf', 2, 4.25, 'Centaurus');
INSERT INTO public.star VALUES (1, 4, '61 Virginis', 'G-type main-sequence star', 2, 29.00, 'Virgo');
INSERT INTO public.star VALUES (1, 6, 'Upsilon Andromedae', 'F-Type', 3, 44.00, 'Andromeda');
INSERT INTO public.star VALUES (1, 7, 'Wolf 1061', 'Red Dwarf', 3, 14.10, 'Ophiuchus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.missions_mission_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: mission missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_name_key UNIQUE (name);


--
-- Name: mission missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT missions_pkey PRIMARY KEY (mission_id);


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

