

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.customers DISABLE TRIGGER ALL;

INSERT INTO public.customers (id, name) VALUES ('66a5a733-19d0-4e3c-9204-38b47d48eab1', 'SPSA');


ALTER TABLE public.customers ENABLE TRIGGER ALL;


ALTER TABLE public.issues DISABLE TRIGGER ALL;



ALTER TABLE public.issues ENABLE TRIGGER ALL;


ALTER TABLE public.test_cases DISABLE TRIGGER ALL;



ALTER TABLE public.test_cases ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


