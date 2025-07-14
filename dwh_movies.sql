-- Dimensión Tiempo (sin cambios - ya está normalizada)
CREATE TABLE dim_tiempo (
    fecha_id INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT,
    trimestre INT
);

-- Dimensión Lenguaje (independiente)
CREATE TABLE dim_lenguaje (
    lenguaje_id INT PRIMARY KEY,
    nombre_lenguaje VARCHAR(50)
);

-- Dimensión Categoría (independiente) 
CREATE TABLE dim_categoria (
    categoria_id INT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

-- Dimensión Película (normalizada - referencia a lenguaje y categoría)
CREATE TABLE dim_pelicula (
    pelicula_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    anio_lanzamiento INT,
    duracion INT,
    lenguaje_id INT,
    categoria_id INT,
    FOREIGN KEY (lenguaje_id) REFERENCES dim_lenguaje(lenguaje_id),
    FOREIGN KEY (categoria_id) REFERENCES dim_categoria(categoria_id)
);

-- Dimensión Cliente (sin cambios)
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50),
    create_date DATE,
    active BOOLEAN
);

-- Dimensión Tienda (independiente)
CREATE TABLE dim_tienda (
    tienda_id INT PRIMARY KEY,
    nombre_tienda VARCHAR(100),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

-- Dimensión Staff/Empleado (normalizada - referencia a tienda)
CREATE TABLE dim_staff (
    staff_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    activo BOOLEAN,
    tienda_id INT,
    FOREIGN KEY (tienda_id) REFERENCES dim_tienda(tienda_id)
);

CREATE TABLE dim_actor (
    actor_id INT PRIMARY KEY,
    pelicula_id INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    nombre_completo VARCHAR(100),
    fecha_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pelicula_id) REFERENCES dim_pelicula(pelicula_id)
);

-- ======================
-- TABLAS DE HECHOS
-- ======================

-- Tabla de Hechos: Rentas/Alquileres
CREATE TABLE fac_renta (
    renta_id INT PRIMARY KEY,
    fecha_renta_id INT,
    fecha_devolucion_id INT,
    cliente_id INT,
    pelicula_id INT,
    staff_id INT,
    tienda_id INT,
    monto_pago DECIMAL(10,2),
    dias_retraso INT DEFAULT 0,
    devuelto BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (fecha_renta_id) REFERENCES dim_tiempo(fecha_id),
    FOREIGN KEY (fecha_devolucion_id) REFERENCES dim_tiempo(fecha_id),
    FOREIGN KEY (cliente_id) REFERENCES dim_cliente(cliente_id),
    FOREIGN KEY (pelicula_id) REFERENCES dim_pelicula(pelicula_id),
    FOREIGN KEY (staff_id) REFERENCES dim_staff(staff_id),
    FOREIGN KEY (tienda_id) REFERENCES dim_tienda(tienda_id)
);

-- Tabla de Hechos: Stock/Inventario
CREATE TABLE fac_stock (
    stock_id INT PRIMARY KEY,
    pelicula_id INT,
    tienda_id INT,
    fecha_id INT,
    cantidad_disponible INT,
    cantidad_total INT,
    cantidad_alquilada INT,
    FOREIGN KEY (pelicula_id) REFERENCES dim_pelicula(pelicula_id),
    FOREIGN KEY (tienda_id) REFERENCES dim_tienda(tienda_id),
    FOREIGN KEY (fecha_id) REFERENCES dim_tiempo(fecha_id)
);

-- ======================
-- ÍNDICES PARA OPTIMIZACIÓN
-- ======================

-- Índices en tablas de dimensión
-- CREATE INDEX idx_pelicula_lenguaje ON dim_pelicula(lenguaje_id);
-- CREATE INDEX idx_pelicula_categoria ON dim_pelicula(categoria_id);
-- CREATE INDEX idx_staff_tienda ON dim_staff(tienda_id);

-- Índices en tablas de hechos
-- CREATE INDEX idx_renta_fecha ON fac_renta(fecha_renta_id);
-- CREATE INDEX idx_renta_cliente ON fac_renta(cliente_id);
-- CREATE INDEX idx_renta_pelicula ON fac_renta(pelicula_id);
-- CREATE INDEX idx_renta_tienda ON fac_renta(tienda_id);

-- CREATE INDEX idx_stock_pelicula ON fac_stock(pelicula_id);
-- CREATE INDEX idx_stock_tienda ON fac_stock(tienda_id);
-- CREATE INDEX idx_stock_fecha ON fac_stock(fecha_id);

-- MY WAY 
CREATE TABLE dim_language (
    language_id INT PRIMARY KEY,
    name VARCHAR(20),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Dimensión Categoría (independiente) 
CREATE TABLE dim_category (
    category_id INT PRIMARY KEY,
    name VARCHAR(50),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Dimensión Película (normalizada - referencia a lenguaje y categoría)
CREATE TABLE dim_film (
    film_id integer PRIMARY KEY,
    title VARCHAR(255),
    release_year integer,
    language_id integer,
	category_id integer,
    length smallint,
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (language_id) REFERENCES dim_language(language_id),
	FOREIGN KEY (category_id) REFERENCES dim_category(category_id)
);

CREATE TABLE dim_actor (
    actor_id INT PRIMARY KEY,
	film_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    full_name VARCHAR(91),
    fecha_carga timestamp DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (film_id) REFERENCES dim_film(film_id)
);