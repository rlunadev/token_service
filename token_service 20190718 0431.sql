﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.1.45.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 7/18/2019 4:31:34 AM
-- Server version: 5.5.5-10.3.16-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE token_service;

--
-- Drop table `configuracion`
--
DROP TABLE IF EXISTS configuracion;

--
-- Drop table `empresas`
--
DROP TABLE IF EXISTS empresas;

--
-- Drop table `grupos`
--
DROP TABLE IF EXISTS grupos;

--
-- Drop table `migrations`
--
DROP TABLE IF EXISTS migrations;

--
-- Drop table `password_resets`
--
DROP TABLE IF EXISTS password_resets;

--
-- Drop table `roles`
--
DROP TABLE IF EXISTS roles;

--
-- Drop table `sistema_registros`
--
DROP TABLE IF EXISTS sistema_registros;

--
-- Drop table `acceso_detalles`
--
DROP TABLE IF EXISTS acceso_detalles;

--
-- Drop table `sistemas`
--
DROP TABLE IF EXISTS sistemas;

--
-- Drop table `user_verifications`
--
DROP TABLE IF EXISTS user_verifications;

--
-- Drop table `users`
--
DROP TABLE IF EXISTS users;

--
-- Set default database
--
USE token_service;

--
-- Create table `users`
--
CREATE TABLE users (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(191) NOT NULL,
  email varchar(191) NOT NULL,
  password varchar(191) NOT NULL,
  remember_token varchar(100) DEFAULT NULL,
  grupo_id varchar(100) DEFAULT NULL,
  is_verified tinyint(1) NOT NULL DEFAULT 1,
  type enum ('member', 'admin', 'current') NOT NULL DEFAULT 'current',
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 125,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create index `users_email_unique` on table `users`
--
ALTER TABLE users
ADD UNIQUE INDEX users_email_unique (email);

--
-- Create table `user_verifications`
--
CREATE TABLE user_verifications (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id int(10) UNSIGNED NOT NULL,
  token varchar(191) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE user_verifications
ADD CONSTRAINT user_verifications_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Create table `sistemas`
--
CREATE TABLE sistemas (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre varchar(191) NOT NULL,
  ruta varchar(191) NOT NULL,
  token blob NOT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `acceso_detalles`
--
CREATE TABLE acceso_detalles (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id int(10) UNSIGNED NOT NULL,
  sistema_id int(10) UNSIGNED NOT NULL,
  descripcion varchar(191) NOT NULL,
  type enum ('superAdmin', 'admin', 'user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create foreign key
--
ALTER TABLE acceso_detalles
ADD CONSTRAINT acceso_detalles_sistema_id_foreign FOREIGN KEY (sistema_id)
REFERENCES sistemas (id) ON DELETE CASCADE;

--
-- Create foreign key
--
ALTER TABLE acceso_detalles
ADD CONSTRAINT acceso_detalles_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Create table `sistema_registros`
--
CREATE TABLE sistema_registros (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(255) DEFAULT NULL,
  sistema_id varchar(100) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `roles`
--
CREATE TABLE roles (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(255) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create table `password_resets`
--
CREATE TABLE password_resets (
  email varchar(191) NOT NULL,
  token varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create index `password_resets_email_index` on table `password_resets`
--
ALTER TABLE password_resets
ADD INDEX password_resets_email_index (email);

--
-- Create table `migrations`
--
CREATE TABLE migrations (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  migration varchar(191) NOT NULL,
  batch int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Create table `grupos`
--
CREATE TABLE grupos (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(255) DEFAULT NULL,
  rol_id int(11) DEFAULT NULL,
  empresa_id int(11) DEFAULT 4,
  sistema_id int(11) DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 27,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `FK_grupos_empresas_id` on table `grupos`
--
ALTER TABLE grupos
ADD INDEX FK_grupos_empresas_id (empresa_id);

--
-- Create index `FK_grupos_roles_id` on table `grupos`
--
ALTER TABLE grupos
ADD INDEX FK_grupos_roles_id (rol_id);

--
-- Create table `empresas`
--
CREATE TABLE empresas (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(255) NOT NULL,
  direccion varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  telefono varchar(255) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  user_id int(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_unicode_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `configuracion`
--
CREATE TABLE configuracion (
  Id int(11) NOT NULL AUTO_INCREMENT,
  servidor_logueo varchar(255) DEFAULT NULL,
  ruta_inicial varchar(255) DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (Id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
ROW_FORMAT = COMPACT;

-- 
-- Dumping data for table users
--
INSERT INTO users VALUES
(50, 'ronald', 'ronaldwin79@hotmail.com', '$2y$10$4patN/BHI8eh0bZhNPHjSuyV5AWDw4unMDO4ozY4DUy1zTaRGQemS', NULL, '20,21,22,23', 1, 'admin', NULL, '2017-11-15 11:44:56'),
(98, 'rluna', 'rluna@luna.com', '$2y$10$4patN/BHI8eh0bZhNPHjSuyV5AWDw4unMDO4ozY4DUy1zTaRGQemS', NULL, '18', 1, 'member', '2017-10-29 03:46:34', '2017-10-29 03:46:34'),
(100, 'test', 'test@mail.com', '$2y$10$/kgRty5djYH/Gxwot9EfdO8L8tcMgj9hTA/WCiwq/7pQ/WWaOM7tW', NULL, '19', 1, 'member', '2017-10-29 14:34:22', '2017-11-14 21:17:12'),
(124, 'test2', 'test2@mail.com', '$2y$10$7jsNTQjG4d0w/yEh4SCX5edtmDhGwQ1loXAIlyfq6IpoYn7Q2ZlW2', NULL, NULL, 1, 'current', '2019-07-17 23:03:48', '2019-07-17 23:03:48');

-- 
-- Dumping data for table sistemas
--
INSERT INTO sistemas VALUES
(4, 'usuarios', 'http://localhost:9000', x'', '2017-10-29 09:26:53', NULL),
(5, 'fases', 'http://localhost:8000/fases/public/home', x'', '2017-10-29 09:26:39', NULL),
(6, 'stock', 'http://localhost:8000/inventario/public/home', x'', '2017-10-31 15:14:40', NULL),
(7, 'calculo', 'http://localhost:8000/calculo/public/home', x'', '2017-10-29 11:56:59', NULL),
(8, 'pagos', 'http://localhost:8000/pagos/public', x'', '2017-11-22 11:18:14', NULL);

-- 
-- Dumping data for table user_verifications
--
-- Table token_service.user_verifications does not contain any data (it is empty)

-- 
-- Dumping data for table sistema_registros
--
INSERT INTO sistema_registros VALUES
(1, 'La Joya', '5,7', NULL, '0000-00-00 00:00:00'),
(3, 'JBBL', '6', '2017-10-29 02:10:17', '2017-10-29 14:33:06'),
(4, 'ferreteria juan', '6', '2017-10-29 22:30:10', '2017-10-29 22:30:10'),
(5, 'test', '4,5,6,7', '2017-10-29 22:47:59', '2017-10-29 22:47:59'),
(6, 'inv', '6', '2017-10-29 22:59:18', '2017-10-29 22:59:32'),
(7, 'test 10', '6', '2017-10-30 07:33:15', '2017-10-30 07:33:15'),
(8, 'test', '4,5', '2017-10-30 11:59:50', '2017-10-30 11:59:50');

-- 
-- Dumping data for table roles
--
INSERT INTO roles VALUES
(1, 'admin', '2017-10-31 14:19:04', '2017-11-02 19:15:57'),
(2, 'member', '2017-10-31 14:19:25', '2017-11-02 19:16:03'),
(3, 'tester', '2019-07-17 23:56:16', '2019-07-17 23:56:16');

-- 
-- Dumping data for table password_resets
--
-- Table token_service.password_resets does not contain any data (it is empty)

-- 
-- Dumping data for table migrations
--
INSERT INTO migrations VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_30_231758_create_user_verifications_table', 1),
(4, '2017_09_19_103858_sistemas', 1),
(5, '2017_09_19_105247_Acceso_detalle', 1);

-- 
-- Dumping data for table grupos
--
INSERT INTO grupos VALUES
(20, 'Administrador  Usuarios', 1, 4, 4, '2017-11-15 08:40:31', '2017-11-15 08:39:53'),
(21, 'Administrador Stock', 1, 4, 6, '2017-11-15 08:45:56', '2017-11-15 08:45:56'),
(22, 'Administrador calculo', 1, 4, 7, '2017-11-15 08:54:39', '2017-11-15 08:54:39'),
(23, 'Administrador Fases', 1, 4, 5, '2017-11-15 08:55:05', '2017-11-15 08:55:05'),
(25, 'Administrador Pagos', 1, 4, 8, '2017-11-15 08:56:19', '2017-11-15 08:56:19'),
(26, 'miembro Stock', 2, 4, 6, '2017-11-22 11:17:06', '2017-11-22 11:17:06');

-- 
-- Dumping data for table empresas
--
INSERT INTO empresas VALUES
(4, 'JBBL', 'rer', 'rere', 'rer', '2017-10-21 23:38:47', '2017-11-15 08:41:43', NULL),
(5, 'ferreteria2', 'calle 2 ceja  el Alto', 'ferreteria@email.com', '2840414', '2017-10-21 23:39:53', '2017-10-21 23:40:27', NULL);

-- 
-- Dumping data for table configuracion
--
INSERT INTO configuracion VALUES
(1, 'http://localhost:9000/login', 'http://localhost:9000/home', NULL, NULL);

-- 
-- Dumping data for table acceso_detalles
--
-- Table token_service.acceso_detalles does not contain any data (it is empty)

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;