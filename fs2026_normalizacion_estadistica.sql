CREATE DATABASE if NOT EXISTS fs2026_normalizacion_estadistica;
USE fs2026_normalizacion_estadistica;

CREATE TABLE sexo(
		sexo_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		sexo_persona VARCHAR(20) NOT NULL
);

CREATE TABLE estado_civil(
		estado_civil_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		estado_civil_persona VARCHAR(20) NOT NULL
);

CREATE TABLE lengua_usual(
		lengua_usual_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		lenguaje_usual VARCHAR(20) NOT NULL
);

CREATE TABLE cabello(
		cabello_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		color_cabello VARCHAR(20) NOT NULL
);

CREATE TABLE ojos(
		ojo_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		color_ojos VARCHAR(20) NOT NULL
);

CREATE TABLE salud(
		salud_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		estado_salud VARCHAR(20) NOT NULL
);

CREATE TABLE personas(
		persona_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		apellidos VARCHAR(50) NOT NULL,
		nombres VARCHAR(50) NOT NULL,
		telefono VARCHAR(15) NOT NULL,
		email VARCHAR(150) NOT NULL,
		sexo_id INT UNSIGNED,
		fecha_nac DATE NOT NULL,
		estado_civil_id INT UNSIGNED,
		lengua_usual_id INT UNSIGNED,
		cabello_id INT UNSIGNED,
		ojo_id INT UNSIGNED,
		salud_id INT UNSIGNED,
		
		CONSTRAINT personas_sexo_id_fk FOREIGN KEY (sexo_id)
		REFERENCES sexo(sexo_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT personas_estado_id_fk FOREIGN KEY (estado_civil_id)
		REFERENCES estado_civil(estado_civil_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT personas_lengua_id_fk FOREIGN KEY (lengua_usual_id)
		REFERENCES lengua_usual(lengua_usual_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT personas_cabello_id_fk FOREIGN KEY (cabello_id)
		REFERENCES cabello(cabello_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT personas_ojo_id_fk FOREIGN KEY (ojo_id)
		REFERENCES ojos(ojo_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
		
		CONSTRAINT personas_salud_id_fk FOREIGN KEY (salud_id)
		REFERENCES salud(salud_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
);

