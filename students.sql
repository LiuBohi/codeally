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

DROP DATABASE students;
--
-- Name: students; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE students WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE students OWNER TO freecodecamp;

\connect students

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
-- Name: courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO freecodecamp;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO freecodecamp;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO freecodecamp;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO freecodecamp;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.courses VALUES (1, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (2, 'Web Programming');
INSERT INTO public.courses VALUES (3, 'Database Systems');
INSERT INTO public.courses VALUES (4, 'Computer Networks');
INSERT INTO public.courses VALUES (5, 'SQL');
INSERT INTO public.courses VALUES (6, 'Machine Learning');
INSERT INTO public.courses VALUES (7, 'Computer Systems');
INSERT INTO public.courses VALUES (8, 'Web Applications');
INSERT INTO public.courses VALUES (9, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (10, 'Python');
INSERT INTO public.courses VALUES (11, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (12, 'Calculus');
INSERT INTO public.courses VALUES (13, 'Game Architecture');
INSERT INTO public.courses VALUES (14, 'Algorithms');
INSERT INTO public.courses VALUES (15, 'UNIX');
INSERT INTO public.courses VALUES (16, 'Server Administration');
INSERT INTO public.courses VALUES (17, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors VALUES (64, 'Database Administration');
INSERT INTO public.majors VALUES (65, 'Web Development');
INSERT INTO public.majors VALUES (66, 'Data Science');
INSERT INTO public.majors VALUES (67, 'Network Engineering');
INSERT INTO public.majors VALUES (68, 'Computer Programming');
INSERT INTO public.majors VALUES (69, 'Game Design');
INSERT INTO public.majors VALUES (70, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.majors_courses VALUES (64, 1);
INSERT INTO public.majors_courses VALUES (65, 2);
INSERT INTO public.majors_courses VALUES (64, 3);
INSERT INTO public.majors_courses VALUES (66, 1);
INSERT INTO public.majors_courses VALUES (67, 4);
INSERT INTO public.majors_courses VALUES (64, 5);
INSERT INTO public.majors_courses VALUES (66, 6);
INSERT INTO public.majors_courses VALUES (67, 7);
INSERT INTO public.majors_courses VALUES (68, 4);
INSERT INTO public.majors_courses VALUES (64, 8);
INSERT INTO public.majors_courses VALUES (69, 9);
INSERT INTO public.majors_courses VALUES (66, 10);
INSERT INTO public.majors_courses VALUES (68, 11);
INSERT INTO public.majors_courses VALUES (70, 7);
INSERT INTO public.majors_courses VALUES (69, 12);
INSERT INTO public.majors_courses VALUES (65, 1);
INSERT INTO public.majors_courses VALUES (66, 12);
INSERT INTO public.majors_courses VALUES (65, 11);
INSERT INTO public.majors_courses VALUES (69, 13);
INSERT INTO public.majors_courses VALUES (70, 4);
INSERT INTO public.majors_courses VALUES (69, 14);
INSERT INTO public.majors_courses VALUES (70, 15);
INSERT INTO public.majors_courses VALUES (70, 16);
INSERT INTO public.majors_courses VALUES (68, 7);
INSERT INTO public.majors_courses VALUES (68, 10);
INSERT INTO public.majors_courses VALUES (67, 17);
INSERT INTO public.majors_courses VALUES (65, 8);
INSERT INTO public.majors_courses VALUES (67, 14);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.students VALUES (130, 'Rhea', 'Kellems', 64, 2.5);
INSERT INTO public.students VALUES (131, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (132, 'Kimberly', 'Whitley', 65, 3.8);
INSERT INTO public.students VALUES (133, 'Jimmy', 'Felipe', 64, 3.7);
INSERT INTO public.students VALUES (134, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (135, 'Casares', 'Hijo', 69, 4.0);
INSERT INTO public.students VALUES (136, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (137, 'Sterling', 'Boss', 69, 3.9);
INSERT INTO public.students VALUES (138, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (139, 'Kaija', 'Uronen', 69, 3.7);
INSERT INTO public.students VALUES (140, 'Faye', 'Conn', 69, 2.1);
INSERT INTO public.students VALUES (141, 'Efren', 'Reilly', 65, 3.9);
INSERT INTO public.students VALUES (142, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (143, 'Maxine', 'Hagenes', 64, 2.9);
INSERT INTO public.students VALUES (144, 'Larry', 'Saunders', 66, 2.2);
INSERT INTO public.students VALUES (145, 'Karl', 'Kuhar', 65, NULL);
INSERT INTO public.students VALUES (146, 'Lieke', 'Hazenveld', 69, 3.5);
INSERT INTO public.students VALUES (147, 'Obie', 'Hilpert', 65, NULL);
INSERT INTO public.students VALUES (148, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (149, 'Nathan', 'Turner', 64, 3.3);
INSERT INTO public.students VALUES (150, 'Gerald', 'Osiki', 66, 2.2);
INSERT INTO public.students VALUES (151, 'Vanya', 'Hassanah', 69, 4.0);
INSERT INTO public.students VALUES (152, 'Roxelana', 'Florescu', 64, 3.2);
INSERT INTO public.students VALUES (153, 'Helene', 'Parker', 66, 3.4);
INSERT INTO public.students VALUES (154, 'Mariana', 'Russel', 65, 1.8);
INSERT INTO public.students VALUES (155, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (156, 'Mehdi', 'Vandenberghe', 64, 1.9);
INSERT INTO public.students VALUES (157, 'Dejon', 'Howell', 65, 4.0);
INSERT INTO public.students VALUES (158, 'Aliya', 'Gulgowski', 70, 2.6);
INSERT INTO public.students VALUES (159, 'Ana', 'Tupajic', 66, 3.1);
INSERT INTO public.students VALUES (160, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 17, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 70, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.students_student_id_seq', 160, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

