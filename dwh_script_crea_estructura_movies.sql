-- DIM FILM
CREATE TABLE dim_film
(
    film_id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    release_year integer,
    rental_rate numeric(4,2),
    length smallint,
    rating character varying COLLATE pg_catalog."default",
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category character varying COLLATE pg_catalog."default",
    language character varying COLLATE pg_catalog."default",
    CONSTRAINT dim_film_pkey PRIMARY KEY (film_id)
)

-- DIM ACTOR
CREATE TABLE dim_actor
(
    actor_id INT PRIMARY KEY,
    film VARCHAR,
    full_name varchar,
    fecha_carga timestamp without time zone
)

-- DIM STORE
CREATE TABLE dim_store(
    store_id INT PRIMARY KEY,
    manager VARCHAR,
    country VARCHAR,
    city VARCHAR,
    fecha_carga timestamp without time zone
)

-- DIM STAFF
CREATE TABLE dim_customer(
    customer_id INT PRIMARY KEY,
    full_name VARCHAR,
    active BOOLEAN,
    country VARCHAR,
    city VARCHAR,
    fecha_carga timestamp without time zone
)

-- DIM TIEMPO
CREATE TABLE dim_tiempo (
    tiempo_id INT PRIMARY KEY,
    anio INT,
    mes INT,
    dia INT,
    fecha_carga TIMESTAMP
);

------------------------
--- TABLAS DE HECHOS ---
------------------------
CREATE TABLE fact_inventory (
    inventory_id INTEGER PRIMARY KEY,
	tiempo_id INTEGER,
    film_id INTEGER,
    store_id INTEGER,
    fecha_carga TIMESTAMP,
	FOREIGN KEY (tiempo_id) REFERENCES dim_tiempo(tiempo_id),
    FOREIGN KEY (film_id) REFERENCES dim_film(film_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

CREATE TABLE fact_rental (
    rental_id INTEGER PRIMARY KEY,
	tiempo_id INTEGER,
    inventory_id INTEGER,
    customer_id INTEGER,
    staff_id INTEGER,
    fecha_carga TIMESTAMP,
    FOREIGN KEY (tiempo_id) REFERENCES dim_tiempo(tiempo_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES dim_staff(staff_id),
    FOREIGN KEY (inventory_id) REFERENCES fact_inventory(inventory_id)
);