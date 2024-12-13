-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2024 a las 04:39:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigesaes_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add sala', 6, 'add_sala'),
(22, 'Can change sala', 6, 'change_sala'),
(23, 'Can delete sala', 6, 'delete_sala'),
(24, 'Can view sala', 6, 'view_sala'),
(25, 'Can add horario', 7, 'add_horario'),
(26, 'Can change horario', 7, 'change_horario'),
(27, 'Can delete horario', 7, 'delete_horario'),
(28, 'Can view horario', 7, 'view_horario'),
(29, 'Can add user', 8, 'add_customuser'),
(30, 'Can change user', 8, 'change_customuser'),
(31, 'Can delete user', 8, 'delete_customuser'),
(32, 'Can view user', 8, 'view_customuser'),
(33, 'Can add notificacion', 9, 'add_notificacion'),
(34, 'Can change notificacion', 9, 'change_notificacion'),
(35, 'Can delete notificacion', 9, 'delete_notificacion'),
(36, 'Can view notificacion', 9, 'view_notificacion'),
(37, 'Can add reserva', 10, 'add_reserva'),
(38, 'Can change reserva', 10, 'change_reserva'),
(39, 'Can delete reserva', 10, 'delete_reserva'),
(40, 'Can view reserva', 10, 'view_reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(8, 'SIGE', 'customuser'),
(7, 'SIGE', 'horario'),
(9, 'SIGE', 'notificacion'),
(10, 'SIGE', 'reserva'),
(6, 'SIGE', 'sala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-12-13 01:10:50.377162'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-12-13 01:10:50.447800'),
(3, 'auth', '0001_initial', '2024-12-13 01:10:50.606765'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-12-13 01:10:50.644522'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-12-13 01:10:50.648537'),
(6, 'auth', '0004_alter_user_username_opts', '2024-12-13 01:10:50.653497'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-12-13 01:10:50.657486'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-12-13 01:10:50.659522'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-12-13 01:10:50.663517'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-12-13 01:10:50.667507'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-12-13 01:10:50.672492'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-12-13 01:10:50.681495'),
(13, 'auth', '0011_update_proxy_permissions', '2024-12-13 01:10:50.685482'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-12-13 01:10:50.689472'),
(15, 'SIGE', '0001_initial', '2024-12-13 01:10:51.125984'),
(16, 'SIGE', '0002_rename_horario_id_reserva_horario', '2024-12-13 01:10:51.304165'),
(17, 'SIGE', '0003_horario_fecha', '2024-12-13 01:10:51.312144'),
(18, 'admin', '0001_initial', '2024-12-13 01:10:51.387475'),
(19, 'admin', '0002_logentry_remove_auto_add', '2024-12-13 01:10:51.395456'),
(20, 'admin', '0003_logentry_add_action_flag_choices', '2024-12-13 01:10:51.402370'),
(21, 'sessions', '0001_initial', '2024-12-13 01:10:51.436566');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2mocscor9vfjiqjk4pumn6jh3qp4zz6e', '.eJxVjEEOwiAQRe_C2hCBgoxL9z0DGWZAqgaS0q6Md7dNutDte-__twi4LiWsPc1hYnEVWpx-WUR6proLfmC9N0mtLvMU5Z7Iw3Y5Nk6v29H-HRTsZVsbY6IDjBHcZWBFOTGcwVlksOCTTw5osBvyERhMJs1egVNZk9UWQXy-4vg3qg:1tLwIm:zljuk0hzsAW6UIJO9mmHFgsjFOvIZqtSb-i39A_0Z6o', '2024-12-27 03:25:16.995853');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_customuser`
--

CREATE TABLE `sige_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sige_customuser`
--

INSERT INTO `sige_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`) VALUES
(1, 'pbkdf2_sha256$720000$GhiFVKs7bc4lOLSisGeigp$n0D/ufoxIka9yxKkFt7PutudU9OMewvFrV45nL/b6Po=', '2024-12-13 03:08:43.053290', 0, 'Gonzalo', '', '', 'qwerty@gmail.com', 0, 1, '2024-12-13 01:11:31.759871', 'admin'),
(2, 'pbkdf2_sha256$720000$akfQMkd8BEy4b0f7rAq5S2$OGrd6o9Xv1/amum+SOGDVpeJ30L4V0Wbxs9XUg7Xl90=', '2024-12-13 03:25:16.992791', 0, 'Xaloh', '', '', 'qwerty@gmail.com', 0, 1, '2024-12-13 01:12:25.983987', 'regular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_customuser_groups`
--

CREATE TABLE `sige_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_customuser_user_permissions`
--

CREATE TABLE `sige_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_horario`
--

CREATE TABLE `sige_horario` (
  `id` bigint(20) NOT NULL,
  `dia_semana` varchar(15) NOT NULL,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `sala_id` bigint(20) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sige_horario`
--

INSERT INTO `sige_horario` (`id`, `dia_semana`, `hora_inicio`, `hora_fin`, `disponible`, `sala_id`, `fecha`) VALUES
(1, 'sabado', '09:00:00.000000', '10:00:00.000000', 1, 1, '2024-12-14'),
(2, 'martes', '09:00:00.000000', '10:00:00.000000', 1, 2, '2024-12-17'),
(3, 'viernes', '13:00:00.000000', '14:00:00.000000', 1, 3, '2024-12-13'),
(4, 'lunes', '09:00:00.000000', '10:00:00.000000', 1, 1, '2024-12-16'),
(5, 'lunes', '10:00:00.000000', '11:00:00.000000', 1, 1, '2024-12-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_notificacion`
--

CREATE TABLE `sige_notificacion` (
  `id` bigint(20) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `leida` tinyint(1) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_reserva`
--

CREATE TABLE `sige_reserva` (
  `id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `horario_id` bigint(20) DEFAULT NULL,
  `sala_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sige_sala`
--

CREATE TABLE `sige_sala` (
  `id` bigint(20) NOT NULL,
  `numero_sala` varchar(10) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sige_sala`
--

INSERT INTO `sige_sala` (`id`, `numero_sala`, `disponible`) VALUES
(1, '1', 1),
(2, '2', 1),
(3, '3', 1),
(4, '4', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_SIGE_customuser_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `sige_customuser`
--
ALTER TABLE `sige_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `sige_customuser_groups`
--
ALTER TABLE `sige_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SIGE_customuser_groups_customuser_id_group_id_fd5ebd39_uniq` (`customuser_id`,`group_id`),
  ADD KEY `SIGE_customuser_groups_group_id_6fa535f6_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `sige_customuser_user_permissions`
--
ALTER TABLE `sige_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SIGE_customuser_user_per_customuser_id_permission_650c7da5_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `SIGE_customuser_user_permission_id_888c7e8d_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `sige_horario`
--
ALTER TABLE `sige_horario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SIGE_horario_dia_semana_hora_inicio_h_5cf84d8c_uniq` (`dia_semana`,`hora_inicio`,`hora_fin`,`sala_id`),
  ADD KEY `SIGE_horario_sala_id_4ebc4a68_fk_SIGE_sala_id` (`sala_id`);

--
-- Indices de la tabla `sige_notificacion`
--
ALTER TABLE `sige_notificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SIGE_notificacion_usuario_id_83441616_fk_SIGE_customuser_id` (`usuario_id`);

--
-- Indices de la tabla `sige_reserva`
--
ALTER TABLE `sige_reserva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SIGE_reserva_usuario_id_sala_id_horar_f7385e1a_uniq` (`usuario_id`,`sala_id`,`horario_id`,`fecha`),
  ADD KEY `SIGE_reserva_sala_id_c06466b7_fk_SIGE_sala_id` (`sala_id`),
  ADD KEY `SIGE_reserva_horario_id_d03350a5_fk_SIGE_horario_id` (`horario_id`);

--
-- Indices de la tabla `sige_sala`
--
ALTER TABLE `sige_sala`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_sala` (`numero_sala`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `sige_customuser`
--
ALTER TABLE `sige_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sige_customuser_groups`
--
ALTER TABLE `sige_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sige_customuser_user_permissions`
--
ALTER TABLE `sige_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sige_horario`
--
ALTER TABLE `sige_horario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sige_notificacion`
--
ALTER TABLE `sige_notificacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sige_reserva`
--
ALTER TABLE `sige_reserva`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sige_sala`
--
ALTER TABLE `sige_sala`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_SIGE_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `sige_customuser` (`id`);

--
-- Filtros para la tabla `sige_customuser_groups`
--
ALTER TABLE `sige_customuser_groups`
  ADD CONSTRAINT `SIGE_customuser_grou_customuser_id_52be57e9_fk_SIGE_cust` FOREIGN KEY (`customuser_id`) REFERENCES `sige_customuser` (`id`),
  ADD CONSTRAINT `SIGE_customuser_groups_group_id_6fa535f6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `sige_customuser_user_permissions`
--
ALTER TABLE `sige_customuser_user_permissions`
  ADD CONSTRAINT `SIGE_customuser_user_customuser_id_9858f28b_fk_SIGE_cust` FOREIGN KEY (`customuser_id`) REFERENCES `sige_customuser` (`id`),
  ADD CONSTRAINT `SIGE_customuser_user_permission_id_888c7e8d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `sige_horario`
--
ALTER TABLE `sige_horario`
  ADD CONSTRAINT `SIGE_horario_sala_id_4ebc4a68_fk_SIGE_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sige_sala` (`id`);

--
-- Filtros para la tabla `sige_notificacion`
--
ALTER TABLE `sige_notificacion`
  ADD CONSTRAINT `SIGE_notificacion_usuario_id_83441616_fk_SIGE_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `sige_customuser` (`id`);

--
-- Filtros para la tabla `sige_reserva`
--
ALTER TABLE `sige_reserva`
  ADD CONSTRAINT `SIGE_reserva_horario_id_d03350a5_fk_SIGE_horario_id` FOREIGN KEY (`horario_id`) REFERENCES `sige_horario` (`id`),
  ADD CONSTRAINT `SIGE_reserva_sala_id_c06466b7_fk_SIGE_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sige_sala` (`id`),
  ADD CONSTRAINT `SIGE_reserva_usuario_id_efdfa340_fk_SIGE_customuser_id` FOREIGN KEY (`usuario_id`) REFERENCES `sige_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
