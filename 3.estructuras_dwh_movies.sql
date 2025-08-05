CREATE TABLE dim_film (
    film_id integer PRIMARY KEY,
    title character varying(255),
    release_year integer,
    rental_rate numeric(4,2),
    length smallint,
    rating character varying,
    category character varying,
    language character varying,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_actor (
    actor_id integer PRIMARY KEY,
    film_id integer,
    full_name character varying,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES dim_film(film_id)
);

CREATE TABLE dim_geography (
    geography_id integer PRIMARY KEY,
    country character varying,
    city character varying,
    postal_code character varying,
    address character varying,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_customer (
    customer_id integer PRIMARY KEY,
    full_name character varying,
    active boolean,
    geography_id integer,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (geography_id) REFERENCES dim_geography(geography_id)
);

CREATE TABLE dim_staff (
    staff_id integer PRIMARY KEY,
    full_name character varying,
    store_id integer,
    active boolean,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
);

CREATE TABLE dim_store (
    store_id integer PRIMARY KEY,
    manager character varying,
    geography_id integer,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (geography_id) REFERENCES dim_geography(geography_id)
);

CREATE TABLE dim_tiempo (
    tiempo_id integer PRIMARY KEY,
    fecha date NOT NULL,
    anio integer,
    trimestre integer,
    mes integer,
    nombre_mes character varying(20),
    dia integer,
    nombre_dia character varying(20),
    dia_semana integer,
    es_fin_de_semana boolean
);
-- Generar fechas desde el 2000-01-01 hasta el 2030-12-31
DO $$
DECLARE
    fecha_actual DATE := DATE '2000-01-01';
    fecha_fin DATE := DATE '2030-12-31';
BEGIN
    WHILE fecha_actual <= fecha_fin LOOP
        INSERT INTO dim_tiempo (
            tiempo_id,
            fecha,
            anio,
            trimestre,
            mes,
            nombre_mes,
            dia,
            nombre_dia,
            dia_semana,
            es_fin_de_semana
        )
        VALUES (
            TO_CHAR(fecha_actual, 'YYYYMMDD')::INTEGER,
            fecha_actual,
            EXTRACT(YEAR FROM fecha_actual)::INTEGER,
            EXTRACT(QUARTER FROM fecha_actual)::INTEGER,
            EXTRACT(MONTH FROM fecha_actual)::INTEGER,
            TO_CHAR(fecha_actual, 'TMMonth'),
            EXTRACT(DAY FROM fecha_actual)::INTEGER,
            TO_CHAR(fecha_actual, 'TMDay'),
            EXTRACT(DOW FROM fecha_actual)::INTEGER,
            CASE WHEN EXTRACT(DOW FROM fecha_actual) IN (0,6) THEN TRUE ELSE FALSE END
        );

        fecha_actual := fecha_actual + INTERVAL '1 day';
    END LOOP;
END $$;

CREATE TABLE fact_inventory (
    store_id integer,
    film_id integer,
    rental_date_id integer NOT NULL,
    return_date_id integer,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rental_date_id) REFERENCES dim_tiempo(tiempo_id),
    FOREIGN KEY (return_date_id) REFERENCES dim_tiempo(tiempo_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (film_id) REFERENCES dim_film(film_id)
);

CREATE TABLE fact_rental (
    customer_id integer,
    staff_id integer,
    film_id integer,
    payment_date_id integer,
    payment_amount numeric(5,2),
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (staff_id) REFERENCES dim_staff(staff_id),
    FOREIGN KEY (film_id) REFERENCES dim_film(film_id),
    FOREIGN KEY (payment_date_id) REFERENCES dim_tiempo(tiempo_id)
);