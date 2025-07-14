-- PostgreSQL database stg_movies

CREATE TABLE actor (
    actor_id integer,
    first_name character varying(45),
    last_name character varying(45),
    full_name character varying(91),
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category (
    category_id integer,
    name character varying(25),
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TYPE mpaa_rating AS ENUM (
    'G',
    'PG',
    'PG-13',
    'R',
    'NC-17'
);

CREATE TABLE film (
    film_id integer,
    title character varying(255),
    description text,
    release_year integer,
    language_id integer,
    original_language_id integer,
    rental_duration smallint,
    rental_rate numeric(4,2),
    length smallint,
    replacement_cost numeric(5,2),
    rating varchar,
    last_update timestamp without time zone DEFAULT now(),
    special_features varchar,
    fulltext varchar,
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_actor (
    actor_id integer,
    film_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE film_category (
    film_id integer,
    category_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE address (
    address_id integer,
    address character varying(50),
    address2 character varying(50),
    district character varying(20),
    city_id integer,
    postal_code character varying(10),
    phone character varying(20),
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE city (
    city_id integer,
    city character varying(50),
    country_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE country (
    country_id integer,
    country character varying(50),
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customer (
    customer_id integer,
    store_id integer,
    first_name character varying(45),
    last_name character varying(45),
    full_name character varchar,
    email character varying(50),
    address_id integer,
    activebool boolean,
    create_date date,
    last_update timestamp without time zone DEFAULT now(),
    active integer,
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inventory (
    inventory_id integer,
    film_id integer,
    store_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE language (
    language_id integer,
    name character(20),
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment (
    payment_id integer,
    customer_id integer,
    staff_id integer,
    rental_id integer,
    amount numeric(5,2),
    payment_date timestamp without time zone,
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rental (
    rental_id integer,
    rental_date timestamp without time zone,
    inventory_id integer,
    customer_id integer,
    return_date timestamp without time zone,
    staff_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE staff (
    staff_id integer,
    first_name character varying(45),
    last_name character varying(45),
    full_name character varchar,
    address_id integer,
    email character varying(50),
    store_id integer,
    active boolean,
    username character varying(16),
    password character varying(40),
    last_update timestamp without time zone DEFAULT now(),
    picture bytea,
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE store (
    store_id integer,
    manager_staff_id integer,
    address_id integer,
    last_update timestamp without time zone DEFAULT now(),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);