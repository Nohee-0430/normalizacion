CREATE DATABASE if NOT EXISTS fs2026_normalizacion_notas;
USE fs2026_normalizacion_notas;

CREATE TABLE grados(
      grado_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      grado VARCHAR(150) NOT NULL
);

CREATE TABLE secciones(
      seccion_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      seccion VARCHAR(5) NOT NULL
);

CREATE TABLE unidades(
      unidad_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      unidad VARCHAR(50) NOT NULL
);

CREATE TABLE cursos(
      curso_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      curso VARCHAR(150) NOT NULL
);

CREATE TABLE estudiantes(
      carnet INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      apellidos VARCHAR(60) NOT NULL,
      nombres VARCHAR(60) NOT NULL,
      grado_id INT UNSIGNED,
      seccion_id INT UNSIGNED,

      CONSTRAINT estudiante_grado_id_fk FOREIGN KEY (grado_id)
  		REFERENCES grados(grado_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,

      CONSTRAINT estudiante_seccion_id_fk FOREIGN KEY (seccion_id)
  		REFERENCES secciones(seccion_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE
);

CREATE TABLE notas(
      nota_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      carnet INT UNSIGNED,
      unidad_id INT UNSIGNED,
      nota DECIMAL(5,2) NOT NULL,
      ciclo INT NOT NULL,
      curso_id INT UNSIGNED,  

      CONSTRAINT nota_estudiante_id_fk FOREIGN KEY (carnet)
  		REFERENCES estudiantes(carnet)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,

      CONSTRAINT nota_unidad_id_fk FOREIGN KEY (unidad_id)
  		REFERENCES unidades(unidad_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,

      CONSTRAINT nota_curso_id_fk FOREIGN KEY (curso_id)
  		REFERENCES cursos(curso_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE
);

CREATE TABLE asignaciones_grados(
      asignacion_grado_id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
      carnet INT UNSIGNED,
      grado_id INT UNSIGNED,
      seccion_id INT UNSIGNED,
      ciclo INT NOT NULL, 

      CONSTRAINT asignacion_carnet_id_fk FOREIGN KEY (carnet)
  		REFERENCES estudiantes(carnet)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,

      CONSTRAINT asignacion_grado_id_fk FOREIGN KEY (grado_id)
  		REFERENCES grados(grado_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE,

      CONSTRAINT asignacion_seccion_id_fk FOREIGN KEY (seccion_id)
  		REFERENCES secciones(seccion_id)
  		ON DELETE RESTRICT
  		ON UPDATE CASCADE
);