-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE issues (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    number TEXT NOT NULL,
    summary TEXT NOT NULL,
    status TEXT NOT NULL,
    is_psa BOOLEAN DEFAULT false NOT NULL,
    days INT NOT NULL,
    description TEXT NOT NULL,
    customer_id UUID NOT NULL,
    start_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL,
    issue_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL,
    is_defect BOOLEAN DEFAULT false NOT NULL,
    assignee TEXT DEFAULT '' NOT NULL
);
CREATE TABLE customers (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    name TEXT NOT NULL
);
CREATE TABLE test_cases (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    number TEXT NOT NULL,
    detail TEXT NOT NULL,
    issue TEXT NOT NULL,
    config TEXT NOT NULL,
    operation TEXT NOT NULL,
    operation_ext TEXT,
    tender TEXT NOT NULL,
    dp TEXT NOT NULL,
    tender_ext TEXT,
    dp_ext TEXT NOT NULL,
    gherking TEXT NOT NULL,
    customer_id UUID
);
CREATE TABLE issue_states (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);
ALTER TABLE issues ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION;
ALTER TABLE test_cases ADD CONSTRAINT test_cases_ref_customer_id FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION;
