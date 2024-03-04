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
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years integer,
    type text,
    number_of_stars_in_billions numeric(5,1)
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
    description text,
    distance_from_planet_in_au numeric(8,3),
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
    description text,
    planet_type_id integer,
    is_spherical boolean,
    has_life boolean,
    star_id integer,
    distance_from_star_in_au numeric(5,1)
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years integer,
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 13000, 'Barred Spiral', 100.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 13000, 'Spiral', 100.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy that is a member of the Local Group of galaxies.', 13000, 'Spiral', 40.0);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo.', 6000, 'Elliptical', 200.0);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'A peculiar galaxy in the constellation of Centaurus.', 12000, 'Lenticular', 50.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A spiral galaxy located in the constellation Canes Venatici.', 13000, 'Spiral', 20.0);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'A spiral galaxy in the constellation Virgo.', 13000, 'Spiral', 20.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The Earth''s only natural satellite.', 0.003, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two natural satellites of Mars.', 0.000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outer of the two natural satellites of Mars.', 0.000, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'The innermost and third-largest of the four Galilean moons of Jupiter.', 0.003, 11);
INSERT INTO public.moon VALUES (5, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter.', 0.005, 11);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon of Jupiter and in the Solar System, and the only moon known to have its own magnetic field.', 0.007, 11);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter, after Ganymede.', 0.012, 11);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn and the second-largest natural satellite in the Solar System.', 0.008, 12);
INSERT INTO public.moon VALUES (9, 'Rhea', 'The second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 0.004, 12);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'The third-largest natural satellite of Saturn.', 0.023, 12);
INSERT INTO public.moon VALUES (11, 'Dione', 'The fourth-largest moon of Saturn, named after the titaness Dione of Greek mythology.', 0.002, 12);
INSERT INTO public.moon VALUES (12, 'Triton', 'The largest natural satellite of the planet Neptune.', 0.004, 13);
INSERT INTO public.moon VALUES (13, 'Proteus', 'The second-largest moon of Neptune, and Neptune''s largest inner satellite.', 0.003, 13);
INSERT INTO public.moon VALUES (14, 'Nereid', 'The third-largest moon of Neptune, and the farthest from Neptune among its large moons.', 0.036, 13);
INSERT INTO public.moon VALUES (15, 'Charon', 'The largest of the five known natural satellites of Pluto.', 0.020, 9);
INSERT INTO public.moon VALUES (16, 'Styx', 'One of the five known natural satellites of Pluto.', 0.008, 9);
INSERT INTO public.moon VALUES (17, 'Nix', 'One of the five known natural satellites of Pluto.', 0.005, 9);
INSERT INTO public.moon VALUES (18, 'Kerberos', 'One of the five known natural satellites of Pluto.', 0.003, 9);
INSERT INTO public.moon VALUES (19, 'Hydra', 'One of the five known natural satellites of Pluto.', 0.006, 9);
INSERT INTO public.moon VALUES (20, 'Amalthea', 'The third moon of Jupiter in order of distance from the planet.', 0.003, 11);
INSERT INTO public.moon VALUES (21, 'Metis', 'The innermost moon of Jupiter in terms of orbital distance from the planet.', 0.001, 11);
INSERT INTO public.moon VALUES (22, 'Thebe', 'The fourth moon of Jupiter by distance from the planet.', 0.004, 11);
INSERT INTO public.moon VALUES (23, 'Puck', 'A moon of Uranus.', 0.003, 8);
INSERT INTO public.moon VALUES (24, 'Miranda', 'A moon of Uranus.', 0.001, 8);
INSERT INTO public.moon VALUES (25, 'Ariel', 'A moon of Uranus.', 0.003, 8);
INSERT INTO public.moon VALUES (26, 'Umbriel', 'A moon of Uranus.', 0.003, 8);
INSERT INTO public.moon VALUES (27, 'Titania', 'A moon of Uranus.', 0.004, 8);
INSERT INTO public.moon VALUES (28, 'Oberon', 'A moon of Uranus.', 0.004, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet to support life.', 1, true, true, 1, 1.0);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun and the second smallest planet in the Solar System.', 1, true, false, 1, 1.5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System, named after the Roman god Jupiter.', 2, false, false, 2, 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'The sixth planet from the Sun and the second largest in the Solar System.', 2, false, false, 2, 9.5);
INSERT INTO public.planet VALUES (5, 'Uranus', 'The seventh planet from the Sun and the third-largest in the Solar System.', 3, true, false, 3, 19.2);
INSERT INTO public.planet VALUES (6, 'Neptune', 'The eighth and farthest known Solar planet from the Sun.', 3, true, false, 3, 30.1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'The smallest and innermost planet in the Solar System.', 1, true, false, 4, 0.4);
INSERT INTO public.planet VALUES (8, 'Venus', 'The second planet from the Sun. It is named after the Roman goddess of love and beauty.', 1, true, false, 4, 0.7);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.', 4, true, false, 5, 39.5);
INSERT INTO public.planet VALUES (10, 'Ceres', 'The largest object in the asteroid belt between the orbits of Mars and Jupiter.', 4, true, false, 6, 2.8);
INSERT INTO public.planet VALUES (11, 'Ganymede', 'The largest moon of Jupiter and in the Solar System, and the only moon known to have its own magnetic field.', 4, true, false, 2, 6.2);
INSERT INTO public.planet VALUES (12, 'Titan', 'The largest moon of Saturn and the second-largest natural satellite in the Solar System.', 4, true, false, 3, 9.6);
INSERT INTO public.planet VALUES (13, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter.', 4, true, false, 2, 5.7);
INSERT INTO public.planet VALUES (14, 'Io', 'The innermost and third-largest of the four Galilean moons of Jupiter.', 4, true, false, 2, 4.2);
INSERT INTO public.planet VALUES (15, 'Callisto', 'The second-largest moon of Jupiter, after Ganymede.', 4, true, false, 2, 7.4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, similar to Earth.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets primarily composed of gases like hydrogen and helium.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with thick atmospheres and icy compositions, similar to Uranus and Neptune.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Celestial bodies that orbit the sun and have sufficient mass for their self-gravity to assume a nearly round shape, but have not cleared their neighboring region of other objects.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The primary star of the Alpha Centauri system.', 6000, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'The secondary star of the Alpha Centauri system.', 6000, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'The brightest star in the night sky.', 250, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant star in the constellation of Orion.', 8000, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'The brightest star in the constellation of Lyra.', 450, 1);
INSERT INTO public.star VALUES (7, 'Arcturus', 'The brightest star in the northern celestial hemisphere.', 7000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

