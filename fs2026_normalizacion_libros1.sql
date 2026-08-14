CREATE DATABASE if NOT EXISTS fs2026_normalizacion_libros1;
USE fs2026_normalizacion_libros1;

CREATE TABLE nacionalidades(
		nacionalidad_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE tipos_libro(
		tipo_libro_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		tipo VARCHAR(100) NOT NULL
);

CREATE TABLE lugares_venta(
		lugar_venta_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		lugar_venta VARCHAR(100) NOT NULL,
      	direccion VARCHAR(150) NOT NULL
);

CREATE TABLE autores(
		autor_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		autor VARCHAR(100) NOT NULL,
		nacionalidad_id INT UNSIGNED NOT NULL,
		
		CONSTRAINT autor_nacionalidad_id_fk FOREIGN KEY (nacionalidad_id)
		REFERENCES nacionalidades(nacionalidad_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE libros(
		libro_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		nombre_libro VARCHAR(200) NOT NULL,
      	autor_id INT UNSIGNED NOT NULL,
      	tipo_libro_id INT UNSIGNED NOT NULL,
		precio DECIMAL(10,2) NOT NULL,
		iva DECIMAL(10,2) NOT NULL,
		precio_total DECIMAL(10,2) NOT NULL,
      
      	CONSTRAINT libro_autor_id_fk FOREIGN KEY (autor_id)
		REFERENCES autores(autor_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT libro_tipo_libro_id_fk FOREIGN KEY (tipo_libro_id)
		REFERENCES tipos_libro(tipo_libro_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

CREATE TABLE libros_lugares_venta(
		libro_lugar_venta_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		libro_id INT UNSIGNED NOT NULL,
      	lugar_venta_id INT UNSIGNED NOT NULL,
      	precio DECIMAL(10,2) NOT NULL,
      
      	CONSTRAINT libro_lugar_libro_id_fk FOREIGN KEY (libro_id)
		REFERENCES libros(libro_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT libro_lugar_lugar_id_fk FOREIGN KEY (lugar_venta_id)
		REFERENCES lugares_venta(lugar_venta_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);
