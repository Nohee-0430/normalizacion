CREATE DATABASE if NOT EXISTS fs2026_normalizacion_estudiantes;
USE fs2026_normalizacion_estudiantes;

CREATE TABLE grados (
		grado_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		grado VARCHAR(100) NOT NULL
);

CREATE TABLE estudiantes(
	   carnet INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
		apellidos VARCHAR(50) NOT NULL,
		nombres VARCHAR(50) NOT NULL,
		grado_id INT UNSIGNED,
		
		CONSTRAINT estudiantes_grado_fk FOREIGN KEY (grado_id)
      REFERENCES grados(grado_id)
      ON DELETE RESTRICT
		ON UPDATE CASCADE
);