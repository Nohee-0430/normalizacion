CREATE DATABASE if NOT EXISTS fs2026_normalizacion_telefonia;
USE fs2026_normalizacion_telefonia;

CREATE TABLE clientes(
		cliente_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		apellidos VARCHAR(50) NOT NULL,
		nombres VARCHAR(50) NOT NULL,
		correo_electronico VARCHAR(150) NOT NULL,
		no_calle_avenida VARCHAR(50) NOT NULL,
		no_casa VARCHAR(20) NOT NULL,
		zona INT NOT NULL
);

CREATE TABLE planes(
		plan_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		plan VARCHAR(50) NOT NULL,
		pago_mensual DECIMAL(10,2) NOT NULL,
		no_minutos INT NOT NULL,
		no_mensajes INT NOT NULL
);

CREATE TABLE lineas_telefonicas(
		linea_telefonica_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		cliente_id INT UNSIGNED,
		no_telefono VARCHAR(20) NOT NULL,
		dia_pago INT NOT NULL,
		meses_atraso INT NOT NULL DEFAULT 0,
		plan_id INT UNSIGNED NOT NULL,
		
		CONSTRAINT linea_cliente_id_fk FOREIGN KEY (cliente_id)
		REFERENCES clientes(cliente_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT linea_plan_id_fk FOREIGN KEY (plan_id)
		REFERENCES planes(plan_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);