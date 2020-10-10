-- enable uuid module
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- create database structure
CREATE TABLE person (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

	firstname TEXT,
	lastname TEXT
);

CREATE TABLE book (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	
	title TEXT,
	published_at DATE,
	page_visits INTEGER,

	author_id UUID CONSTRAINT author__books REFERENCES person (id) 
);

-- create some authors
INSERT INTO person (firstname, lastname) VALUES ('Anna', 'Arabel');
INSERT INTO person (firstname, lastname) VALUES ('Bob', 'Builder');
INSERT INTO person (firstname, lastname) VALUES ('Clair', 'Castle');

-- and books
INSERT INTO book (title, published_at, page_visits, author_id) VALUES (
	'A Book',
	'2020-11-10',
	0,
	(
		SELECT id FROM person WHERE firstname = 'Anna'
	)
);

INSERT INTO book (title, published_at, page_visits, author_id) VALUES (
	'The story of another book',
	'2002-01-25',
	0,
	(
		SELECT id FROM person WHERE firstname = 'Bob'
	)
);

INSERT INTO book (title, published_at, page_visits, author_id) VALUES (
	'Bobs book about bobs',
	'2001-03-19',
	0,
	(
		SELECT id FROM person WHERE firstname = 'Bob'
	)
);

INSERT INTO book (title, published_at, page_visits, author_id) VALUES (
	'How to code',
	'2011-08-24',
	0,
	(
		SELECT id FROM person WHERE firstname = 'Clair'
	)
);