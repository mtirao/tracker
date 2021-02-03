-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE issues (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    number TEXT NOT NULL,
    summary TEXT NOT NULL,
    status TEXT NOT NULL,
    score INT NOT NULL,
    days INT NOT NULL,
    description TEXT NOT NULL,
    customer_id UUID NOT NULL
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
    config TEXT NOT NULL
);
ALTER TABLE issues ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE NO ACTION;
