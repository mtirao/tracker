

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


ALTER TABLE public.issue_states DISABLE TRIGGER ALL;

INSERT INTO public.issue_states (id, name) VALUES ('f59a5560-95e5-43a4-b724-9359e3158774', 'Assigned');
INSERT INTO public.issue_states (id, name) VALUES ('864c190d-e892-44b2-8d71-10642e34d22c', 'Close');
INSERT INTO public.issue_states (id, name) VALUES ('45468f51-9968-4876-9774-4dacfe90d634', 'New');
INSERT INTO public.issue_states (id, name) VALUES ('896fa007-2344-41d8-b40f-4ca981671459', 'Planned');


ALTER TABLE public.issue_states ENABLE TRIGGER ALL;


ALTER TABLE public.issues DISABLE TRIGGER ALL;



ALTER TABLE public.issues ENABLE TRIGGER ALL;


ALTER TABLE public.test_cases DISABLE TRIGGER ALL;



ALTER TABLE public.test_cases ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, name) VALUES ('19516d57-c10e-4b0e-8335-10e71078dd46', 'matias.plaza@ncr.com', 'Matias Plaza');
INSERT INTO public.users (id, email, name) VALUES ('c51ba308-225b-42ba-813f-de6d97dc9e0a', 'marcos.tirao@ncr.com', 'Marcos Tirao');
INSERT INTO public.users (id, email, name) VALUES ('b1bfc532-26d8-4179-8774-cb3c598af13d', 'roberto.vargas@ncr.com', 'Roberto Vargas');
INSERT INTO public.users (id, email, name) VALUES ('de706910-ae73-48c6-a110-6477d7101a48', 'gonzalo.chamorro@ncr.com', 'Gonzalo Chamorro');
INSERT INTO public.users (id, email, name) VALUES ('ff5ecb7e-d502-40ba-a2e8-31f4c4fca163', 'ivan.campos@ncr.com', 'Ivan Campos');
INSERT INTO public.users (id, email, name) VALUES ('50f953d1-46fe-4ff9-87be-47b430a0c06c', 'luis.martinezcallejas', 'Luis Martinez Callejas');
INSERT INTO public.users (id, email, name) VALUES ('ddccbfdf-4a50-4e1c-bb55-104b9503f0a1', 'manuel.cunha@ncr.com', 'Manuel Cunha Pinto');
INSERT INTO public.users (id, email, name) VALUES ('85f84783-9f20-4820-ae7d-ecebe16376c2', 'patricia.lima@@ncr.com', 'Patricia Lima');
INSERT INTO public.users (id, email, name) VALUES ('4e53b441-3acb-4f6e-93f9-9227772ff3e8', 'daniela.luiz@ncr.com', 'Daniela Luiz');


ALTER TABLE public.users ENABLE TRIGGER ALL;


