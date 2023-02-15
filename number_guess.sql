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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES ('user_1676391475906', 2, 5);
INSERT INTO public.info VALUES ('user_1676391475907', 5, 38);
INSERT INTO public.info VALUES ('user_1676391514845', 2, 158);
INSERT INTO public.info VALUES ('user_1676391514846', 5, 189);
INSERT INTO public.info VALUES ('user_1676391565819', 2, 763);
INSERT INTO public.info VALUES ('user_1676391565820', 5, 321);
INSERT INTO public.info VALUES ('user_1676391589265', 2, 939);
INSERT INTO public.info VALUES ('user_1676391589266', 5, 140);
INSERT INTO public.info VALUES ('user_1676456900038', 2, 356);
INSERT INTO public.info VALUES ('user_1676456900039', 5, 15);
INSERT INTO public.info VALUES ('Pedro', 2, 1);
INSERT INTO public.info VALUES ('user_1676458277472', 2, 26);
INSERT INTO public.info VALUES ('user_1676458277473', 5, 110);


--
-- PostgreSQL database dump complete
--

