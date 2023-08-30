CREATE DATABASE BRIKSS;

USE BRIKSS;

CREATE TABLE `CLIENTE` (
	`id_Cliente` INT(10) NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Apellidos` varchar(50) NOT NULL,
	`Correo` varchar(60) NOT NULL,
	`Telefono` varchar(20) NOT NULL,
	PRIMARY KEY (`id_Cliente`)
);

CREATE TABLE `INMUEBLE` (
	`id_Inmueble` INT NOT NULL AUTO_INCREMENT,
	`Barrio` varchar(50) NOT NULL,
	`Tipo_inm` varchar(30) NOT NULL,
	`Dirección` varchar(60) NOT NULL,
	`Gestión` varchar(30) NOT NULL,
	`Precio` FLOAT(20) NOT NULL,
	`Metraje` FLOAT(10) NOT NULL,
	`Habitaciones` INT(10) NOT NULL,
	`Baños` INT(10) NOT NULL,
	`Garajes` INT(10) NOT NULL,
	`Piso` INT(10) NOT NULL,
	`Administración` FLOAT(20) NOT NULL,
	PRIMARY KEY (`id_Inmueble`)
);

CREATE TABLE `CORREDOR` (
	`Cédula` INT(20) NOT NULL,
	`Nombre` varchar(60) NOT NULL,
	`Apellido` varchar(60) NOT NULL,
	`Correo` varchar(60) NOT NULL,
	`Teléfono` varchar(30) NOT NULL,
	`id_inmueble_fk` INT NOT NULL,
	`id_cliente_fk` INT NOT NULL,
	PRIMARY KEY (`Cédula`)
);

CREATE TABLE `CITA` (
	`id_Cita` INT NOT NULL AUTO_INCREMENT,
    `Fecha`DATE NOT NULL,
	`Hora` TIME(6) NOT NULL,
	`Id_inmueble_fk` INT NOT NULL,
	`id_cliente_fk` INT NOT NULL,
	`Id_corredor_fk` INT NOT NULL,
	PRIMARY KEY (`id_Cita`)
);

ALTER TABLE `CORREDOR` ADD CONSTRAINT `CORREDOR_fk0` FOREIGN KEY (`id_inmueble_fk`) REFERENCES `INMUEBLE`(`id_Inmueble`);

ALTER TABLE `CORREDOR` ADD CONSTRAINT `CORREDOR_fk1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `CLIENTE`(`id_Cliente`);

ALTER TABLE `CITA` ADD CONSTRAINT `CITA_fk0` FOREIGN KEY (`Id_inmueble_fk`) REFERENCES `INMUEBLE`(`id_Inmueble`);

ALTER TABLE `CITA` ADD CONSTRAINT `CITA_fk1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `CLIENTE`(`id_Cliente`);

ALTER TABLE `CITA` ADD CONSTRAINT `CITA_fk2` FOREIGN KEY (`Id_corredor_fk`) REFERENCES `CORREDOR`(`Cédula`);



