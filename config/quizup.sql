-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 15 juin 2024 à 12:35
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `quizup`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

CREATE TABLE `favorite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `quizId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hostId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `code`, `quizId`, `status`, `created_at`, `updated_at`, `hostId`) VALUES
(19, 'XCD09DMT', 1, 0, '2024-06-14 12:39:28', '2024-06-14 12:39:28', '1');

-- --------------------------------------------------------

--
-- Structure de la table `game_user`
--

CREATE TABLE `game_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gameId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `game_user`
--

INSERT INTO `game_user` (`id`, `gameId`, `status`, `created_at`, `updated_at`, `nickname`) VALUES
(18, 19, 0, '2024-06-14 12:39:28', '2024-06-14 12:39:28', 'naka'),
(19, 19, 0, '2024-06-14 12:39:37', '2024-06-14 12:39:37', 'AnonymeA3RS');

-- --------------------------------------------------------

--
-- Structure de la table `game_user_response`
--

CREATE TABLE `game_user_response` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `responseId` int(11) NOT NULL,
  `gameUserId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

CREATE TABLE `history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `successRate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_06_05_085318_update_users', 1),
(5, '2024_06_05_085402_create_history', 1),
(6, '2024_06_05_090043_create_quiz', 1),
(7, '2024_06_05_090106_create_question', 1),
(8, '2024_06_05_090545_create_response', 1),
(9, '2024_06_06_074158_update_users', 1),
(10, '2024_06_06_124227_delete_history_id_users', 1),
(11, '2024_06_06_124357_delete_name_and_surname_users', 1),
(12, '2024_06_07_083253_update_quiz', 1),
(13, '2024_06_07_122428_update_response', 1),
(14, '2024_06_08_192933_update_quiz', 1),
(15, '2024_06_10_112633_update_question', 1),
(16, '2024_06_10_113028_drop_column_image_quiz', 1),
(17, '2024_06_13_095311_create_favorite', 2),
(18, '2024_06_14_081407_create_game', 3),
(19, '2024_06_14_081433_create_game_user', 3),
(21, '2024_06_14_083847_create_game_user_response', 4),
(22, '2024_06_14_085149_update_game', 5),
(25, '2024_06_14_141714_update_game_user', 6);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quizId` int(11) NOT NULL,
  `label` text NOT NULL,
  `image` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `quizId`, `label`, `image`, `created_at`, `updated_at`, `order`) VALUES
(1, 1, 'Le film Charlie et la chocolaterie est l’adaptation d’un célèbre roman pour enfant, mais qui en est l’auteur ?', 'https://images.pexels.com/photos/3394288/pexels-photo-3394288.jpeg', NULL, NULL, 0),
(2, 1, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 1),
(3, 1, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 2),
(4, 1, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 3),
(5, 1, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 4),
(6, 2, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 0),
(7, 2, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 1),
(8, 2, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 2),
(9, 2, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 3),
(10, 2, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 4),
(11, 3, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 0),
(12, 3, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 1),
(13, 3, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 2),
(14, 3, 'Quel auteur a écrit les romans “L’Étranger” et “La Peste” ?', 'https://images.pexels.com/photos/20664795/pexels-photo-20664795.jpeg', NULL, NULL, 3),
(15, 3, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 4),
(16, 4, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 0),
(17, 4, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 1),
(18, 4, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 2),
(19, 4, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 3),
(20, 4, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 4),
(21, 5, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 0),
(22, 5, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 1),
(23, 5, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 2),
(24, 5, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 3),
(25, 5, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 4),
(26, 6, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 0),
(27, 6, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 1),
(28, 6, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 2),
(29, 6, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 3),
(30, 6, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 4),
(31, 7, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 0),
(32, 7, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 1),
(33, 7, 'Quel auteur a écrit les romans “L’Étranger” et “La Peste” ?', 'https://images.pexels.com/photos/20664795/pexels-photo-20664795.jpeg', NULL, NULL, 2),
(34, 7, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 3),
(35, 7, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 4),
(36, 8, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 0),
(37, 8, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 1),
(38, 8, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 2),
(39, 8, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 3),
(40, 8, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 4),
(41, 9, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 0),
(42, 9, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 1),
(43, 9, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 2),
(44, 9, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 3),
(45, 9, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 4),
(46, 10, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 0),
(47, 10, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 1),
(48, 10, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 2),
(49, 10, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 3),
(50, 10, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 4),
(51, 11, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 0),
(52, 11, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 1),
(53, 11, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 2),
(54, 11, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 3),
(55, 11, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 4),
(56, 12, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 0),
(57, 12, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 1),
(58, 12, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 2),
(59, 12, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 3),
(60, 12, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 4),
(61, 13, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 0),
(62, 13, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 1),
(63, 13, 'Le film Charlie et la chocolaterie est l’adaptation d’un célèbre roman pour enfant, mais qui en est l’auteur ?', 'https://images.pexels.com/photos/3394288/pexels-photo-3394288.jpeg', NULL, NULL, 2),
(64, 13, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 3),
(65, 13, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 4),
(66, 14, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 0),
(67, 14, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 1),
(68, 14, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 2),
(69, 14, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 3),
(70, 14, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 4),
(71, 15, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 0),
(72, 15, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 1),
(73, 15, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 2),
(74, 15, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 3),
(75, 15, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 4),
(76, 16, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 0),
(77, 16, 'Quel auteur a écrit les romans “L’Étranger” et “La Peste” ?', 'https://images.pexels.com/photos/20664795/pexels-photo-20664795.jpeg', NULL, NULL, 1),
(78, 16, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 2),
(79, 16, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 3),
(80, 16, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 4),
(81, 17, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 0),
(82, 17, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 1),
(83, 17, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 2),
(84, 17, 'Le film Charlie et la chocolaterie est l’adaptation d’un célèbre roman pour enfant, mais qui en est l’auteur ?', 'https://images.pexels.com/photos/3394288/pexels-photo-3394288.jpeg', NULL, NULL, 3),
(85, 17, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 4),
(86, 18, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 0),
(87, 18, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 1),
(88, 18, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 2),
(89, 18, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 3),
(90, 18, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 4),
(91, 19, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 0),
(92, 19, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 1),
(93, 19, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 2),
(94, 19, 'Quel auteur a écrit les romans “L’Étranger” et “La Peste” ?', 'https://images.pexels.com/photos/20664795/pexels-photo-20664795.jpeg', NULL, NULL, 3),
(95, 19, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 4),
(96, 20, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 0),
(97, 20, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 1),
(98, 20, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 2),
(99, 20, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 3),
(100, 20, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 4),
(101, 21, 'Le film Charlie et la chocolaterie est l’adaptation d’un célèbre roman pour enfant, mais qui en est l’auteur ?', 'https://images.pexels.com/photos/3394288/pexels-photo-3394288.jpeg', NULL, NULL, 0),
(102, 21, 'Klein a déposé une couleur qui porte son nom ...', 'https://images.pexels.com/photos/3990349/pexels-photo-3990349.jpeg', NULL, NULL, 1),
(103, 21, 'Quel est le premier livre écrit par Françoise Sagan alors qu’elle n’a que 18 ans, en 1954 ?', 'https://images.pexels.com/photos/58461/pexels-photo-58461.jpeg', NULL, NULL, 2),
(104, 21, 'Avec Meg, Jo et Beth, comment s’appelle la 4ème fille du docteur March, dans le roman de Louisa May Alcott ?', 'https://images.pexels.com/photos/6945698/pexels-photo-6945698.jpeg', NULL, NULL, 3),
(105, 21, 'Quel génie italien de la Renaissance a peint en 1512 la fresque intitulée : \'La création d\'Adam\' ?', 'https://images.pexels.com/photos/8536355/pexels-photo-8536355.jpeg', NULL, NULL, 4),
(106, 22, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 0),
(107, 22, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 1),
(108, 22, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 2),
(109, 22, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 3),
(110, 22, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 4),
(111, 23, 'Combien d\'oeuvres a réalisé Jackson Pollock ?', 'https://images.pexels.com/photos/20636933/pexels-photo-20636933.jpeg', NULL, NULL, 0),
(112, 23, 'Qui a écrit la pièce de théâtre Cyrano de Bergerac ?', 'https://images.pexels.com/photos/356065/pexels-photo-356065.jpeg', NULL, NULL, 1),
(113, 23, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 2),
(114, 23, 'Quel auteur a écrit les romans “L’Étranger” et “La Peste” ?', 'https://images.pexels.com/photos/20664795/pexels-photo-20664795.jpeg', NULL, NULL, 3),
(115, 23, 'Qui a écrit le roman à succès “Les fourmis” ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 4),
(116, 24, 'Quel peintre, né en 1844, est également appelé \'le Douanier\' ?', 'https://images.pexels.com/photos/5336350/pexels-photo-5336350.jpeg', NULL, NULL, 0),
(117, 24, 'Quel héros de l\'Antiquité a rencontré Circé, Calypso, Nausicaa et Pénélope ?', 'https://images.pexels.com/photos/3013675/pexels-photo-3013675.jpeg', NULL, NULL, 1),
(118, 24, 'Jeff Koons est surtout connu pour ses ... ?', 'https://images.pexels.com/photos/15273762/pexels-photo-15273762.jpeg', NULL, NULL, 2),
(119, 24, 'Comment s’appelle le capitaine qui veut se venger de Moby-Dick dans le roman d’Hermann Melville ?', 'https://images.pexels.com/photos/2676582/pexels-photo-2676582.jpeg', NULL, NULL, 3),
(120, 24, 'Quel est le mouvement artistique d\'Andy Warhol ?', 'https://images.pexels.com/photos/6480334/pexels-photo-6480334.jpeg', NULL, NULL, 4),
(121, 25, 'Quelle équipe a remporté la toute première Coupe du Monde de Rugby à XV en 1987 ?', 'https://images.pexels.com/photos/3379934/pexels-photo-3379934.jpeg', NULL, NULL, 0),
(122, 25, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://images.pexels.com/photos/4498610/pexels-photo-4498610.jpeg', NULL, NULL, 1),
(123, 25, 'Comment appelle-t-on l\'espace situé entre deux skis placés côte à côte ?', 'https://images.pexels.com/photos/9615387/pexels-photo-9615387.jpeg', NULL, NULL, 2),
(124, 25, 'Quelle est cette danse d’origine espagnole ?', 'https://images.pexels.com/photos/4003355/pexels-photo-4003355.jpeg', NULL, NULL, 3),
(125, 25, 'Comment est également appelée la \'Transat Jacques Vabre\' ?', 'https://images.pexels.com/photos/12169077/pexels-photo-12169077.jpeg', NULL, NULL, 4),
(126, 26, 'Entré aux Jeux olympiques, quel est le sport collectif aquatique « par excellence » ?', 'https://images.pexels.com/photos/25537921/pexels-photo-25537921.jpeg', NULL, NULL, 0),
(127, 26, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://images.pexels.com/photos/4133133/pexels-photo-4133133.jpeg', NULL, NULL, 1),
(128, 26, 'Comment appelle-t-on l\'espace situé entre deux skis placés côte à côte ?', 'https://images.pexels.com/photos/9615387/pexels-photo-9615387.jpeg', NULL, NULL, 2),
(129, 26, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://images.pexels.com/photos/20666241/pexels-photo-20666241.jpeg', NULL, NULL, 3),
(130, 26, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://images.pexels.com/photos/4961017/pexels-photo-4961017.jpeg', NULL, NULL, 4),
(131, 27, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://images.pexels.com/photos/20666241/pexels-photo-20666241.jpeg', NULL, NULL, 0),
(132, 27, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://images.pexels.com/photos/3781312/pexels-photo-3781312.jpeg', NULL, NULL, 1),
(133, 27, 'Comment est également appelée la \'Transat Jacques Vabre\' ?', 'https://images.pexels.com/photos/12169077/pexels-photo-12169077.jpeg', NULL, NULL, 2),
(134, 27, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 3),
(135, 27, 'Quelle est la durée d\'une mi-temps dans un match de rugby à XV ?', 'https://images.pexels.com/photos/2207/red-people-outside-sport.jpg', NULL, NULL, 4),
(136, 28, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://images.pexels.com/photos/20666241/pexels-photo-20666241.jpeg', NULL, NULL, 0),
(137, 28, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://images.pexels.com/photos/800629/pexels-photo-800629.jpeg', NULL, NULL, 1),
(138, 28, 'Quel joueur de rugby détient le record de points marqués en Coupe du Monde de Rugby ?', 'https://images.pexels.com/photos/159728/lacrosse-lacrosse-team-champions-state-champions-159728.jpeg', NULL, NULL, 2),
(139, 28, 'Quelle danse est traditionnelle du carnaval de Rio ?', 'https://images.pexels.com/photos/8879899/pexels-photo-8879899.jpeg', NULL, NULL, 3),
(140, 28, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://images.pexels.com/photos/4133133/pexels-photo-4133133.jpeg', NULL, NULL, 4),
(141, 29, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://images.pexels.com/photos/20666241/pexels-photo-20666241.jpeg', NULL, NULL, 0),
(142, 29, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://images.pexels.com/photos/10117527/pexels-photo-10117527.jpeg', NULL, NULL, 1),
(143, 29, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://images.pexels.com/photos/4498610/pexels-photo-4498610.jpeg', NULL, NULL, 2),
(144, 29, 'Lequel de ces pays n\'a jamais remporté la Coupe du Monde de Rugby à XV ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 3),
(145, 29, 'Comment appelle-t-on l\'espace situé entre deux skis placés côte à côte ?', 'https://images.pexels.com/photos/9615387/pexels-photo-9615387.jpeg', NULL, NULL, 4),
(146, 30, 'Quelle danse est traditionnelle du carnaval de Rio ?', 'https://images.pexels.com/photos/8879899/pexels-photo-8879899.jpeg', NULL, NULL, 0),
(147, 30, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://images.pexels.com/photos/3781312/pexels-photo-3781312.jpeg', NULL, NULL, 1),
(148, 30, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 2),
(149, 30, 'Quel joueur de rugby détient le record de points marqués en Coupe du Monde de Rugby ?', 'https://images.pexels.com/photos/159728/lacrosse-lacrosse-team-champions-state-champions-159728.jpeg', NULL, NULL, 3),
(150, 30, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://images.pexels.com/photos/10117527/pexels-photo-10117527.jpeg', NULL, NULL, 4),
(151, 31, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://images.pexels.com/photos/4961017/pexels-photo-4961017.jpeg', NULL, NULL, 0),
(152, 31, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://images.pexels.com/photos/10117527/pexels-photo-10117527.jpeg', NULL, NULL, 1),
(153, 31, 'Quelle danse est traditionnelle du carnaval de Rio ?', 'https://images.pexels.com/photos/8879899/pexels-photo-8879899.jpeg', NULL, NULL, 2),
(154, 31, 'Quelle est cette danse sensuelle venue d’Argentine ?', 'https://images.pexels.com/photos/20680118/pexels-photo-20680118.jpeg', NULL, NULL, 3),
(155, 31, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://images.pexels.com/photos/3781312/pexels-photo-3781312.jpeg', NULL, NULL, 4),
(156, 32, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 0),
(157, 32, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://images.pexels.com/photos/800629/pexels-photo-800629.jpeg', NULL, NULL, 1),
(158, 32, 'Lequel de ces pays n\'a jamais remporté la Coupe du Monde de Rugby à XV ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 2),
(159, 32, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://images.pexels.com/photos/3781312/pexels-photo-3781312.jpeg', NULL, NULL, 3),
(160, 32, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://images.pexels.com/photos/4386324/pexels-photo-4386324.jpeg', NULL, NULL, 4),
(161, 33, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 0),
(162, 33, 'Lequel de ces pays n\'a jamais remporté la Coupe du Monde de Rugby à XV ?', 'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg', NULL, NULL, 1),
(163, 33, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://images.pexels.com/photos/4386324/pexels-photo-4386324.jpeg', NULL, NULL, 2),
(164, 33, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://images.pexels.com/photos/10117527/pexels-photo-10117527.jpeg', NULL, NULL, 3),
(165, 33, 'Quelle est cette danse d’origine espagnole ?', 'https://images.pexels.com/photos/4003355/pexels-photo-4003355.jpeg', NULL, NULL, 4),
(166, 34, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://images.pexels.com/photos/800629/pexels-photo-800629.jpeg', NULL, NULL, 0),
(167, 34, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://images.pexels.com/photos/4498610/pexels-photo-4498610.jpeg', NULL, NULL, 1),
(168, 34, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://images.pexels.com/photos/20666241/pexels-photo-20666241.jpeg', NULL, NULL, 2),
(169, 34, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://images.pexels.com/photos/4133133/pexels-photo-4133133.jpeg', NULL, NULL, 3),
(170, 34, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(171, 35, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(172, 35, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(173, 35, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(174, 35, 'Quelle est cette danse d’origine espagnole ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(175, 35, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(176, 36, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(177, 36, 'Quelle danse est traditionnelle du carnaval de Rio ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(178, 36, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(179, 36, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(180, 36, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(181, 37, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(182, 37, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(183, 37, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(184, 37, 'Lequel de ces pays n\'a jamais remporté la Coupe du Monde de Rugby à XV ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(185, 37, 'Quelle équipe ayant déjà remporté la Coupe du Monde de Rugby est surnommée \"les Springboks\" ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(186, 38, 'Entré aux Jeux olympiques, quel est le sport collectif aquatique « par excellence » ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(187, 38, 'Quelle équipe a été exclue de la Coupe du Monde de Rugby en 1987 et 1991 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(188, 38, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(189, 38, 'Lequel de ces pays n\'a jamais remporté la Coupe du Monde de Rugby à XV ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(190, 38, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(191, 39, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(192, 39, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(193, 39, 'Quelle est cette danse sensuelle venue d’Argentine ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(194, 39, 'Quelle équipe ayant déjà remporté la Coupe du Monde de Rugby est surnommée \"les Springboks\" ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(195, 39, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(196, 40, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(197, 40, 'Quel joueur de rugby détient le record de points marqués en Coupe du Monde de Rugby ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(198, 40, 'Quelle est la durée d\'une mi-temps dans un match de rugby à XV ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(199, 40, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(200, 40, 'Entré aux Jeux olympiques, quel est le sport collectif aquatique « par excellence » ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(201, 41, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://images.pexels.com/photos/4498610/pexels-photo-4498610.jpeg', NULL, NULL, 0),
(202, 41, 'Quelle danse est traditionnelle du carnaval de Rio ?', 'https://images.pexels.com/photos/8879899/pexels-photo-8879899.jpeg', NULL, NULL, 1),
(203, 41, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(204, 41, 'Quelle équipe a remporté la toute première Coupe du Monde de Rugby à XV en 1987 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(205, 41, 'Entré aux Jeux olympiques, quel est le sport collectif aquatique « par excellence » ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(206, 42, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(207, 42, 'Quelle équipe a remporté la toute première Coupe du Monde de Rugby à XV en 1987 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(208, 42, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(209, 42, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(210, 42, 'Comment appelle-t-on l\'espace situé entre deux skis placés côte à côte ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(211, 43, 'Quelle équipe a remporté la toute première Coupe du Monde de Rugby à XV en 1987 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(212, 43, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(213, 43, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(214, 43, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(215, 43, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(216, 44, 'Quelle est cette danse sensuelle venue d’Argentine ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(217, 44, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(218, 44, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(219, 44, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(220, 44, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(221, 45, 'À combien s\'élève environ le total des gains remportés par John McEnroe ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(222, 45, 'Quelle équipe a remporté la toute première Coupe du Monde de Rugby à XV en 1987 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(223, 45, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(224, 45, 'Quelle est cette danse sensuelle venue d’Argentine ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(225, 45, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(226, 46, 'Quelle est cette danse sensuelle venue d’Argentine ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(227, 46, 'Quel sport collectif utilise un disque opposant deux équipes de sept joueurs ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(228, 46, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(229, 46, 'Quel joueur de rugby détient le record de points marqués en Coupe du Monde de Rugby ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(230, 46, 'Quel était le nom de la navigatrice en solitaire française, skipper du Biotherm ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(231, 47, 'Entré aux Jeux olympiques, quel est le sport collectif aquatique « par excellence » ?', 'https://images.pexels.com/photos/25537921/pexels-photo-25537921.jpeg', NULL, NULL, 0),
(232, 47, 'Quelle équipe ayant déjà remporté la Coupe du Monde de Rugby est surnommée \"les Springboks\" ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(233, 47, 'Comment s’appelle la danse née à la fin des années 50 aux États-Unis et qui se pratique en groupe et en ligne ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(234, 47, 'À quelle fréquence, la Coupe du Monde de Rugby à XV est-elle organisée ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(235, 47, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4),
(236, 48, 'Quelle est cette danse d’origine espagnole ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 0),
(237, 48, 'Quelle activité est directement associée à la danse “Pasodoble” ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 1),
(238, 48, 'Quel club de foot a remporté la Ligue 1 de la saison 2021-2022 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 2),
(239, 48, 'Dans quel pays se trouve le circuit automobile de Zandvoort ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 3),
(240, 48, 'Quel était le pays organisateur de la Coupe du Monde de Rugby en 2019 ?', 'https://miro.medium.com/v2/resize:fit:1400/1*MXyMqcEJ6Se0SCWcYCKZTQ.jpeg', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `difficulty` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `use` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `difficulty`, `type`, `use`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0, NULL, NULL),
(2, 0, 1, 0, NULL, NULL),
(3, 0, 1, 0, NULL, NULL),
(4, 0, 1, 0, NULL, NULL),
(5, 0, 1, 0, NULL, NULL),
(6, 0, 1, 0, NULL, NULL),
(7, 0, 1, 0, NULL, NULL),
(8, 0, 1, 0, NULL, NULL),
(9, 1, 1, 0, NULL, NULL),
(10, 1, 1, 0, NULL, NULL),
(11, 1, 1, 0, NULL, NULL),
(12, 1, 1, 0, NULL, NULL),
(13, 1, 1, 0, NULL, NULL),
(14, 1, 1, 0, NULL, NULL),
(15, 1, 1, 0, NULL, NULL),
(16, 1, 1, 0, NULL, NULL),
(17, 2, 1, 0, NULL, NULL),
(18, 2, 1, 0, NULL, NULL),
(19, 2, 1, 0, NULL, NULL),
(20, 2, 1, 0, NULL, NULL),
(21, 2, 1, 0, NULL, NULL),
(22, 2, 1, 0, NULL, NULL),
(23, 2, 1, 0, NULL, NULL),
(24, 2, 1, 0, NULL, NULL),
(25, 0, 0, 0, NULL, NULL),
(26, 0, 0, 0, NULL, NULL),
(27, 0, 0, 0, NULL, NULL),
(28, 0, 0, 0, NULL, NULL),
(29, 0, 0, 0, NULL, NULL),
(30, 0, 0, 0, NULL, NULL),
(31, 0, 0, 0, NULL, NULL),
(32, 0, 0, 0, NULL, NULL),
(33, 1, 0, 0, NULL, NULL),
(34, 1, 0, 0, NULL, NULL),
(35, 1, 0, 0, NULL, NULL),
(36, 1, 0, 0, NULL, NULL),
(37, 1, 0, 0, NULL, NULL),
(38, 1, 0, 0, NULL, NULL),
(39, 1, 0, 0, NULL, NULL),
(40, 1, 0, 0, NULL, NULL),
(41, 2, 0, 0, NULL, NULL),
(42, 2, 0, 0, NULL, NULL),
(43, 2, 0, 0, NULL, NULL),
(44, 2, 0, 0, NULL, NULL),
(45, 2, 0, 0, NULL, NULL),
(46, 2, 0, 0, NULL, NULL),
(47, 2, 0, 0, NULL, NULL),
(48, 2, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `response`
--

CREATE TABLE `response` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `questionId` int(11) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `badAnswer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `response`
--

INSERT INTO `response` (`id`, `questionId`, `value`, `created_at`, `updated_at`, `badAnswer`) VALUES
(1, 1, 'Roald Dahl', NULL, NULL, 0),
(2, 1, 'Enid Blyton', NULL, NULL, 1),
(3, 1, 'Caroline Quine', NULL, NULL, 1),
(4, 1, 'C.S Lewis', NULL, NULL, 1),
(5, 2, 'Bernard Weber', NULL, NULL, 0),
(6, 2, 'Franck Thilliez', NULL, NULL, 1),
(7, 2, 'Maxime Chattam', NULL, NULL, 1),
(8, 2, 'Alexandre Jardin', NULL, NULL, 1),
(9, 3, 'Michel-Ange', NULL, NULL, 0),
(10, 3, 'Raphael', NULL, NULL, 1),
(11, 3, 'Bellini', NULL, NULL, 1),
(12, 3, 'Botticelli', NULL, NULL, 1),
(13, 4, 'Ulysse', NULL, NULL, 0),
(14, 4, 'Achille', NULL, NULL, 1),
(15, 4, 'Dédale', NULL, NULL, 1),
(16, 4, 'Hector', NULL, NULL, 1),
(17, 5, 'Bleu', NULL, NULL, 0),
(18, 5, 'Noir', NULL, NULL, 1),
(19, 5, 'Rouge', NULL, NULL, 1),
(20, 5, 'Violet', NULL, NULL, 1),
(21, 6, 'Ulysse', NULL, NULL, 0),
(22, 6, 'Achille', NULL, NULL, 1),
(23, 6, 'Dédale', NULL, NULL, 1),
(24, 6, 'Hector', NULL, NULL, 1),
(25, 7, 'Bonjour tristesse', NULL, NULL, 0),
(26, 7, 'Au revoir tristesse', NULL, NULL, 1),
(27, 7, 'Bonsoir tristesse', NULL, NULL, 1),
(28, 7, 'Adieu tristesse', NULL, NULL, 1),
(29, 8, 'Pop Art', NULL, NULL, 0),
(30, 8, 'Street Art', NULL, NULL, 1),
(31, 8, 'Land Art', NULL, NULL, 1),
(32, 8, 'Art Abstrait', NULL, NULL, 1),
(33, 9, 'Sculptures', NULL, NULL, 0),
(34, 9, 'Tags', NULL, NULL, 1),
(35, 9, 'Peintures', NULL, NULL, 1),
(36, 9, 'Dessins', NULL, NULL, 1),
(37, 10, 'Capitaine Achab', NULL, NULL, 0),
(38, 10, 'Capitaine Crochet', NULL, NULL, 1),
(39, 10, 'Capitaine Fracasse', NULL, NULL, 1),
(40, 10, 'Capitaine Némo', NULL, NULL, 1),
(41, 11, 'Henri Rousseau', NULL, NULL, 0),
(42, 11, 'Pablo Picasso', NULL, NULL, 1),
(43, 11, 'Edgar Degas', NULL, NULL, 1),
(44, 11, 'Salvador Dali', NULL, NULL, 1),
(45, 12, 'Ulysse', NULL, NULL, 0),
(46, 12, 'Achille', NULL, NULL, 1),
(47, 12, 'Dédale', NULL, NULL, 1),
(48, 12, 'Hector', NULL, NULL, 1),
(49, 13, 'Edmond Rostand', NULL, NULL, 0),
(50, 13, 'Victor Hugo', NULL, NULL, 1),
(51, 13, 'Molière', NULL, NULL, 1),
(52, 13, 'Alfred de Musset', NULL, NULL, 1),
(53, 14, 'Albert Camus', NULL, NULL, 0),
(54, 14, 'Marcel Proust', NULL, NULL, 1),
(55, 14, 'Jean Cocteau', NULL, NULL, 1),
(56, 14, 'André de Malraux', NULL, NULL, 1),
(57, 15, '+ de 700', NULL, NULL, 0),
(58, 15, '33', NULL, NULL, 1),
(59, 15, '333', NULL, NULL, 1),
(60, 15, '500', NULL, NULL, 1),
(61, 16, 'Henri Rousseau', NULL, NULL, 0),
(62, 16, 'Pablo Picasso', NULL, NULL, 1),
(63, 16, 'Edgar Degas', NULL, NULL, 1),
(64, 16, 'Salvador Dali', NULL, NULL, 1),
(65, 17, 'Amy', NULL, NULL, 0),
(66, 17, 'Mary', NULL, NULL, 1),
(67, 17, 'Sarah', NULL, NULL, 1),
(68, 17, 'Jane', NULL, NULL, 1),
(69, 18, 'Bleu', NULL, NULL, 0),
(70, 18, 'Noir', NULL, NULL, 1),
(71, 18, 'Rouge', NULL, NULL, 1),
(72, 18, 'Violet', NULL, NULL, 1),
(73, 19, 'Bonjour tristesse', NULL, NULL, 0),
(74, 19, 'Au revoir tristesse', NULL, NULL, 1),
(75, 19, 'Bonsoir tristesse', NULL, NULL, 1),
(76, 19, 'Adieu tristesse', NULL, NULL, 1),
(77, 20, 'Michel-Ange', NULL, NULL, 0),
(78, 20, 'Raphael', NULL, NULL, 1),
(79, 20, 'Bellini', NULL, NULL, 1),
(80, 20, 'Botticelli', NULL, NULL, 1),
(81, 21, 'Pop Art', NULL, NULL, 0),
(82, 21, 'Street Art', NULL, NULL, 1),
(83, 21, 'Land Art', NULL, NULL, 1),
(84, 21, 'Art Abstrait', NULL, NULL, 1),
(85, 22, 'Sculptures', NULL, NULL, 0),
(86, 22, 'Tags', NULL, NULL, 1),
(87, 22, 'Peintures', NULL, NULL, 1),
(88, 22, 'Dessins', NULL, NULL, 1),
(89, 23, 'Edmond Rostand', NULL, NULL, 0),
(90, 23, 'Victor Hugo', NULL, NULL, 1),
(91, 23, 'Molière', NULL, NULL, 1),
(92, 23, 'Alfred de Musset', NULL, NULL, 1),
(93, 24, '+ de 700', NULL, NULL, 0),
(94, 24, '33', NULL, NULL, 1),
(95, 24, '333', NULL, NULL, 1),
(96, 24, '500', NULL, NULL, 1),
(97, 25, 'Capitaine Achab', NULL, NULL, 0),
(98, 25, 'Capitaine Crochet', NULL, NULL, 1),
(99, 25, 'Capitaine Fracasse', NULL, NULL, 1),
(100, 25, 'Capitaine Némo', NULL, NULL, 1),
(101, 26, 'Bernard Weber', NULL, NULL, 0),
(102, 26, 'Franck Thilliez', NULL, NULL, 1),
(103, 26, 'Maxime Chattam', NULL, NULL, 1),
(104, 26, 'Alexandre Jardin', NULL, NULL, 1),
(105, 27, 'Ulysse', NULL, NULL, 0),
(106, 27, 'Achille', NULL, NULL, 1),
(107, 27, 'Dédale', NULL, NULL, 1),
(108, 27, 'Hector', NULL, NULL, 1),
(109, 28, 'Michel-Ange', NULL, NULL, 0),
(110, 28, 'Raphael', NULL, NULL, 1),
(111, 28, 'Bellini', NULL, NULL, 1),
(112, 28, 'Botticelli', NULL, NULL, 1),
(113, 29, 'Bleu', NULL, NULL, 0),
(114, 29, 'Noir', NULL, NULL, 1),
(115, 29, 'Rouge', NULL, NULL, 1),
(116, 29, 'Violet', NULL, NULL, 1),
(117, 30, '+ de 700', NULL, NULL, 0),
(118, 30, '33', NULL, NULL, 1),
(119, 30, '333', NULL, NULL, 1),
(120, 30, '500', NULL, NULL, 1),
(121, 31, 'Bleu', NULL, NULL, 0),
(122, 31, 'Noir', NULL, NULL, 1),
(123, 31, 'Rouge', NULL, NULL, 1),
(124, 31, 'Violet', NULL, NULL, 1),
(125, 32, 'Edmond Rostand', NULL, NULL, 0),
(126, 32, 'Victor Hugo', NULL, NULL, 1),
(127, 32, 'Molière', NULL, NULL, 1),
(128, 32, 'Alfred de Musset', NULL, NULL, 1),
(129, 33, 'Albert Camus', NULL, NULL, 0),
(130, 33, 'Marcel Proust', NULL, NULL, 1),
(131, 33, 'Jean Cocteau', NULL, NULL, 1),
(132, 33, 'André de Malraux', NULL, NULL, 1),
(133, 34, 'Bernard Weber', NULL, NULL, 0),
(134, 34, 'Franck Thilliez', NULL, NULL, 1),
(135, 34, 'Maxime Chattam', NULL, NULL, 1),
(136, 34, 'Alexandre Jardin', NULL, NULL, 1),
(137, 35, 'Bonjour tristesse', NULL, NULL, 0),
(138, 35, 'Au revoir tristesse', NULL, NULL, 1),
(139, 35, 'Bonsoir tristesse', NULL, NULL, 1),
(140, 35, 'Adieu tristesse', NULL, NULL, 1),
(141, 36, 'Sculptures', NULL, NULL, 0),
(142, 36, 'Tags', NULL, NULL, 1),
(143, 36, 'Peintures', NULL, NULL, 1),
(144, 36, 'Dessins', NULL, NULL, 1),
(145, 37, 'Bonjour tristesse', NULL, NULL, 0),
(146, 37, 'Au revoir tristesse', NULL, NULL, 1),
(147, 37, 'Bonsoir tristesse', NULL, NULL, 1),
(148, 37, 'Adieu tristesse', NULL, NULL, 1),
(149, 38, 'Pop Art', NULL, NULL, 0),
(150, 38, 'Street Art', NULL, NULL, 1),
(151, 38, 'Land Art', NULL, NULL, 1),
(152, 38, 'Art Abstrait', NULL, NULL, 1),
(153, 39, 'Capitaine Achab', NULL, NULL, 0),
(154, 39, 'Capitaine Crochet', NULL, NULL, 1),
(155, 39, 'Capitaine Fracasse', NULL, NULL, 1),
(156, 39, 'Capitaine Némo', NULL, NULL, 1),
(157, 40, 'Bernard Weber', NULL, NULL, 0),
(158, 40, 'Franck Thilliez', NULL, NULL, 1),
(159, 40, 'Maxime Chattam', NULL, NULL, 1),
(160, 40, 'Alexandre Jardin', NULL, NULL, 1),
(161, 41, '+ de 700', NULL, NULL, 0),
(162, 41, '33', NULL, NULL, 1),
(163, 41, '333', NULL, NULL, 1),
(164, 41, '500', NULL, NULL, 1),
(165, 42, 'Bleu', NULL, NULL, 0),
(166, 42, 'Noir', NULL, NULL, 1),
(167, 42, 'Rouge', NULL, NULL, 1),
(168, 42, 'Violet', NULL, NULL, 1),
(169, 43, 'Amy', NULL, NULL, 0),
(170, 43, 'Mary', NULL, NULL, 1),
(171, 43, 'Sarah', NULL, NULL, 1),
(172, 43, 'Jane', NULL, NULL, 1),
(173, 44, 'Bonjour tristesse', NULL, NULL, 0),
(174, 44, 'Au revoir tristesse', NULL, NULL, 1),
(175, 44, 'Bonsoir tristesse', NULL, NULL, 1),
(176, 44, 'Adieu tristesse', NULL, NULL, 1),
(177, 45, 'Ulysse', NULL, NULL, 0),
(178, 45, 'Achille', NULL, NULL, 1),
(179, 45, 'Dédale', NULL, NULL, 1),
(180, 45, 'Hector', NULL, NULL, 1),
(181, 46, 'Sculptures', NULL, NULL, 0),
(182, 46, 'Tags', NULL, NULL, 1),
(183, 46, 'Peintures', NULL, NULL, 1),
(184, 46, 'Dessins', NULL, NULL, 1),
(185, 47, 'Capitaine Achab', NULL, NULL, 0),
(186, 47, 'Capitaine Crochet', NULL, NULL, 1),
(187, 47, 'Capitaine Fracasse', NULL, NULL, 1),
(188, 47, 'Capitaine Némo', NULL, NULL, 1),
(189, 48, 'Pop Art', NULL, NULL, 0),
(190, 48, 'Street Art', NULL, NULL, 1),
(191, 48, 'Land Art', NULL, NULL, 1),
(192, 48, 'Art Abstrait', NULL, NULL, 1),
(193, 49, 'Amy', NULL, NULL, 0),
(194, 49, 'Mary', NULL, NULL, 1),
(195, 49, 'Sarah', NULL, NULL, 1),
(196, 49, 'Jane', NULL, NULL, 1),
(197, 50, '+ de 700', NULL, NULL, 0),
(198, 50, '33', NULL, NULL, 1),
(199, 50, '333', NULL, NULL, 1),
(200, 50, '500', NULL, NULL, 1),
(201, 51, 'Pop Art', NULL, NULL, 0),
(202, 51, 'Street Art', NULL, NULL, 1),
(203, 51, 'Land Art', NULL, NULL, 1),
(204, 51, 'Art Abstrait', NULL, NULL, 1),
(205, 52, 'Sculptures', NULL, NULL, 0),
(206, 52, 'Tags', NULL, NULL, 1),
(207, 52, 'Peintures', NULL, NULL, 1),
(208, 52, 'Dessins', NULL, NULL, 1),
(209, 53, '+ de 700', NULL, NULL, 0),
(210, 53, '33', NULL, NULL, 1),
(211, 53, '333', NULL, NULL, 1),
(212, 53, '500', NULL, NULL, 1),
(213, 54, 'Ulysse', NULL, NULL, 0),
(214, 54, 'Achille', NULL, NULL, 1),
(215, 54, 'Dédale', NULL, NULL, 1),
(216, 54, 'Hector', NULL, NULL, 1),
(217, 55, 'Edmond Rostand', NULL, NULL, 0),
(218, 55, 'Victor Hugo', NULL, NULL, 1),
(219, 55, 'Molière', NULL, NULL, 1),
(220, 55, 'Alfred de Musset', NULL, NULL, 1),
(221, 56, 'Sculptures', NULL, NULL, 0),
(222, 56, 'Tags', NULL, NULL, 1),
(223, 56, 'Peintures', NULL, NULL, 1),
(224, 56, 'Dessins', NULL, NULL, 1),
(225, 57, 'Bernard Weber', NULL, NULL, 0),
(226, 57, 'Franck Thilliez', NULL, NULL, 1),
(227, 57, 'Maxime Chattam', NULL, NULL, 1),
(228, 57, 'Alexandre Jardin', NULL, NULL, 1),
(229, 58, 'Ulysse', NULL, NULL, 0),
(230, 58, 'Achille', NULL, NULL, 1),
(231, 58, 'Dédale', NULL, NULL, 1),
(232, 58, 'Hector', NULL, NULL, 1),
(233, 59, 'Pop Art', NULL, NULL, 0),
(234, 59, 'Street Art', NULL, NULL, 1),
(235, 59, 'Land Art', NULL, NULL, 1),
(236, 59, 'Art Abstrait', NULL, NULL, 1),
(237, 60, 'Bonjour tristesse', NULL, NULL, 0),
(238, 60, 'Au revoir tristesse', NULL, NULL, 1),
(239, 60, 'Bonsoir tristesse', NULL, NULL, 1),
(240, 60, 'Adieu tristesse', NULL, NULL, 1),
(241, 61, 'Capitaine Achab', NULL, NULL, 0),
(242, 61, 'Capitaine Crochet', NULL, NULL, 1),
(243, 61, 'Capitaine Fracasse', NULL, NULL, 1),
(244, 61, 'Capitaine Némo', NULL, NULL, 1),
(245, 62, 'Amy', NULL, NULL, 0),
(246, 62, 'Mary', NULL, NULL, 1),
(247, 62, 'Sarah', NULL, NULL, 1),
(248, 62, 'Jane', NULL, NULL, 1),
(249, 63, 'Roald Dahl', NULL, NULL, 0),
(250, 63, 'Enid Blyton', NULL, NULL, 1),
(251, 63, 'Caroline Quine', NULL, NULL, 1),
(252, 63, 'C.S Lewis', NULL, NULL, 1),
(253, 64, 'Bleu', NULL, NULL, 0),
(254, 64, 'Noir', NULL, NULL, 1),
(255, 64, 'Rouge', NULL, NULL, 1),
(256, 64, 'Violet', NULL, NULL, 1),
(257, 65, 'Michel-Ange', NULL, NULL, 0),
(258, 65, 'Raphael', NULL, NULL, 1),
(259, 65, 'Bellini', NULL, NULL, 1),
(260, 65, 'Botticelli', NULL, NULL, 1),
(261, 66, 'Amy', NULL, NULL, 0),
(262, 66, 'Mary', NULL, NULL, 1),
(263, 66, 'Sarah', NULL, NULL, 1),
(264, 66, 'Jane', NULL, NULL, 1),
(265, 67, 'Pop Art', NULL, NULL, 0),
(266, 67, 'Street Art', NULL, NULL, 1),
(267, 67, 'Land Art', NULL, NULL, 1),
(268, 67, 'Art Abstrait', NULL, NULL, 1),
(269, 68, 'Sculptures', NULL, NULL, 0),
(270, 68, 'Tags', NULL, NULL, 1),
(271, 68, 'Peintures', NULL, NULL, 1),
(272, 68, 'Dessins', NULL, NULL, 1),
(273, 69, 'Ulysse', NULL, NULL, 0),
(274, 69, 'Achille', NULL, NULL, 1),
(275, 69, 'Dédale', NULL, NULL, 1),
(276, 69, 'Hector', NULL, NULL, 1),
(277, 70, 'Bonjour tristesse', NULL, NULL, 0),
(278, 70, 'Au revoir tristesse', NULL, NULL, 1),
(279, 70, 'Bonsoir tristesse', NULL, NULL, 1),
(280, 70, 'Adieu tristesse', NULL, NULL, 1),
(281, 71, 'Bleu', NULL, NULL, 0),
(282, 71, 'Noir', NULL, NULL, 1),
(283, 71, 'Rouge', NULL, NULL, 1),
(284, 71, 'Violet', NULL, NULL, 1),
(285, 72, 'Amy', NULL, NULL, 0),
(286, 72, 'Mary', NULL, NULL, 1),
(287, 72, 'Sarah', NULL, NULL, 1),
(288, 72, 'Jane', NULL, NULL, 1),
(289, 73, 'Ulysse', NULL, NULL, 0),
(290, 73, 'Achille', NULL, NULL, 1),
(291, 73, 'Dédale', NULL, NULL, 1),
(292, 73, 'Hector', NULL, NULL, 1),
(293, 74, 'Bonjour tristesse', NULL, NULL, 0),
(294, 74, 'Au revoir tristesse', NULL, NULL, 1),
(295, 74, 'Bonsoir tristesse', NULL, NULL, 1),
(296, 74, 'Adieu tristesse', NULL, NULL, 1),
(297, 75, 'Bernard Weber', NULL, NULL, 0),
(298, 75, 'Franck Thilliez', NULL, NULL, 1),
(299, 75, 'Maxime Chattam', NULL, NULL, 1),
(300, 75, 'Alexandre Jardin', NULL, NULL, 1),
(301, 76, 'Bleu', NULL, NULL, 0),
(302, 76, 'Noir', NULL, NULL, 1),
(303, 76, 'Rouge', NULL, NULL, 1),
(304, 76, 'Violet', NULL, NULL, 1),
(305, 77, 'Albert Camus', NULL, NULL, 0),
(306, 77, 'Marcel Proust', NULL, NULL, 1),
(307, 77, 'Jean Cocteau', NULL, NULL, 1),
(308, 77, 'André de Malraux', NULL, NULL, 1),
(309, 78, 'Ulysse', NULL, NULL, 0),
(310, 78, 'Achille', NULL, NULL, 1),
(311, 78, 'Dédale', NULL, NULL, 1),
(312, 78, 'Hector', NULL, NULL, 1),
(313, 79, 'Michel-Ange', NULL, NULL, 0),
(314, 79, 'Raphael', NULL, NULL, 1),
(315, 79, 'Bellini', NULL, NULL, 1),
(316, 79, 'Botticelli', NULL, NULL, 1),
(317, 80, 'Edmond Rostand', NULL, NULL, 0),
(318, 80, 'Victor Hugo', NULL, NULL, 1),
(319, 80, 'Molière', NULL, NULL, 1),
(320, 80, 'Alfred de Musset', NULL, NULL, 1),
(321, 81, 'Henri Rousseau', NULL, NULL, 0),
(322, 81, 'Pablo Picasso', NULL, NULL, 1),
(323, 81, 'Edgar Degas', NULL, NULL, 1),
(324, 81, 'Salvador Dali', NULL, NULL, 1),
(325, 82, 'Pop Art', NULL, NULL, 0),
(326, 82, 'Street Art', NULL, NULL, 1),
(327, 82, 'Land Art', NULL, NULL, 1),
(328, 82, 'Art Abstrait', NULL, NULL, 1),
(329, 83, 'Amy', NULL, NULL, 0),
(330, 83, 'Mary', NULL, NULL, 1),
(331, 83, 'Sarah', NULL, NULL, 1),
(332, 83, 'Jane', NULL, NULL, 1),
(333, 84, 'Roald Dahl', NULL, NULL, 0),
(334, 84, 'Enid Blyton', NULL, NULL, 1),
(335, 84, 'Caroline Quine', NULL, NULL, 1),
(336, 84, 'C.S Lewis', NULL, NULL, 1),
(337, 85, 'Sculptures', NULL, NULL, 0),
(338, 85, 'Tags', NULL, NULL, 1),
(339, 85, 'Peintures', NULL, NULL, 1),
(340, 85, 'Dessins', NULL, NULL, 1),
(341, 86, 'Bernard Weber', NULL, NULL, 0),
(342, 86, 'Franck Thilliez', NULL, NULL, 1),
(343, 86, 'Maxime Chattam', NULL, NULL, 1),
(344, 86, 'Alexandre Jardin', NULL, NULL, 1),
(345, 87, 'Ulysse', NULL, NULL, 0),
(346, 87, 'Achille', NULL, NULL, 1),
(347, 87, 'Dédale', NULL, NULL, 1),
(348, 87, 'Hector', NULL, NULL, 1),
(349, 88, 'Ulysse', NULL, NULL, 0),
(350, 88, 'Achille', NULL, NULL, 1),
(351, 88, 'Dédale', NULL, NULL, 1),
(352, 88, 'Hector', NULL, NULL, 1),
(353, 89, 'Henri Rousseau', NULL, NULL, 0),
(354, 89, 'Pablo Picasso', NULL, NULL, 1),
(355, 89, 'Edgar Degas', NULL, NULL, 1),
(356, 89, 'Salvador Dali', NULL, NULL, 1),
(357, 90, 'Bleu', NULL, NULL, 0),
(358, 90, 'Noir', NULL, NULL, 1),
(359, 90, 'Rouge', NULL, NULL, 1),
(360, 90, 'Violet', NULL, NULL, 1),
(361, 91, 'Edmond Rostand', NULL, NULL, 0),
(362, 91, 'Victor Hugo', NULL, NULL, 1),
(363, 91, 'Molière', NULL, NULL, 1),
(364, 91, 'Alfred de Musset', NULL, NULL, 1),
(365, 92, 'Michel-Ange', NULL, NULL, 0),
(366, 92, 'Raphael', NULL, NULL, 1),
(367, 92, 'Bellini', NULL, NULL, 1),
(368, 92, 'Botticelli', NULL, NULL, 1),
(369, 93, 'Capitaine Achab', NULL, NULL, 0),
(370, 93, 'Capitaine Crochet', NULL, NULL, 1),
(371, 93, 'Capitaine Fracasse', NULL, NULL, 1),
(372, 93, 'Capitaine Némo', NULL, NULL, 1),
(373, 94, 'Albert Camus', NULL, NULL, 0),
(374, 94, 'Marcel Proust', NULL, NULL, 1),
(375, 94, 'Jean Cocteau', NULL, NULL, 1),
(376, 94, 'André de Malraux', NULL, NULL, 1),
(377, 95, 'Bleu', NULL, NULL, 0),
(378, 95, 'Noir', NULL, NULL, 1),
(379, 95, 'Rouge', NULL, NULL, 1),
(380, 95, 'Violet', NULL, NULL, 1),
(381, 96, 'Ulysse', NULL, NULL, 0),
(382, 96, 'Achille', NULL, NULL, 1),
(383, 96, 'Dédale', NULL, NULL, 1),
(384, 96, 'Hector', NULL, NULL, 1),
(385, 97, 'Sculptures', NULL, NULL, 0),
(386, 97, 'Tags', NULL, NULL, 1),
(387, 97, 'Peintures', NULL, NULL, 1),
(388, 97, 'Dessins', NULL, NULL, 1),
(389, 98, 'Ulysse', NULL, NULL, 0),
(390, 98, 'Achille', NULL, NULL, 1),
(391, 98, 'Dédale', NULL, NULL, 1),
(392, 98, 'Hector', NULL, NULL, 1),
(393, 99, 'Bernard Weber', NULL, NULL, 0),
(394, 99, 'Franck Thilliez', NULL, NULL, 1),
(395, 99, 'Maxime Chattam', NULL, NULL, 1),
(396, 99, 'Alexandre Jardin', NULL, NULL, 1),
(397, 100, 'Pop Art', NULL, NULL, 0),
(398, 100, 'Street Art', NULL, NULL, 1),
(399, 100, 'Land Art', NULL, NULL, 1),
(400, 100, 'Art Abstrait', NULL, NULL, 1),
(401, 101, 'Roald Dahl', NULL, NULL, 0),
(402, 101, 'Enid Blyton', NULL, NULL, 1),
(403, 101, 'Caroline Quine', NULL, NULL, 1),
(404, 101, 'C.S Lewis', NULL, NULL, 1),
(405, 102, 'Bleu', NULL, NULL, 0),
(406, 102, 'Noir', NULL, NULL, 1),
(407, 102, 'Rouge', NULL, NULL, 1),
(408, 102, 'Violet', NULL, NULL, 1),
(409, 103, 'Bonjour tristesse', NULL, NULL, 0),
(410, 103, 'Au revoir tristesse', NULL, NULL, 1),
(411, 103, 'Bonsoir tristesse', NULL, NULL, 1),
(412, 103, 'Adieu tristesse', NULL, NULL, 1),
(413, 104, 'Amy', NULL, NULL, 0),
(414, 104, 'Mary', NULL, NULL, 1),
(415, 104, 'Sarah', NULL, NULL, 1),
(416, 104, 'Jane', NULL, NULL, 1),
(417, 105, 'Michel-Ange', NULL, NULL, 0),
(418, 105, 'Raphael', NULL, NULL, 1),
(419, 105, 'Bellini', NULL, NULL, 1),
(420, 105, 'Botticelli', NULL, NULL, 1),
(421, 106, 'Pop Art', NULL, NULL, 0),
(422, 106, 'Street Art', NULL, NULL, 1),
(423, 106, 'Land Art', NULL, NULL, 1),
(424, 106, 'Art Abstrait', NULL, NULL, 1),
(425, 107, 'Sculptures', NULL, NULL, 0),
(426, 107, 'Tags', NULL, NULL, 1),
(427, 107, 'Peintures', NULL, NULL, 1),
(428, 107, 'Dessins', NULL, NULL, 1),
(429, 108, '+ de 700', NULL, NULL, 0),
(430, 108, '33', NULL, NULL, 1),
(431, 108, '333', NULL, NULL, 1),
(432, 108, '500', NULL, NULL, 1),
(433, 109, 'Ulysse', NULL, NULL, 0),
(434, 109, 'Achille', NULL, NULL, 1),
(435, 109, 'Dédale', NULL, NULL, 1),
(436, 109, 'Hector', NULL, NULL, 1),
(437, 110, 'Henri Rousseau', NULL, NULL, 0),
(438, 110, 'Pablo Picasso', NULL, NULL, 1),
(439, 110, 'Edgar Degas', NULL, NULL, 1),
(440, 110, 'Salvador Dali', NULL, NULL, 1),
(441, 111, '+ de 700', NULL, NULL, 0),
(442, 111, '33', NULL, NULL, 1),
(443, 111, '333', NULL, NULL, 1),
(444, 111, '500', NULL, NULL, 1),
(445, 112, 'Edmond Rostand', NULL, NULL, 0),
(446, 112, 'Victor Hugo', NULL, NULL, 1),
(447, 112, 'Molière', NULL, NULL, 1),
(448, 112, 'Alfred de Musset', NULL, NULL, 1),
(449, 113, 'Sculptures', NULL, NULL, 0),
(450, 113, 'Tags', NULL, NULL, 1),
(451, 113, 'Peintures', NULL, NULL, 1),
(452, 113, 'Dessins', NULL, NULL, 1),
(453, 114, 'Albert Camus', NULL, NULL, 0),
(454, 114, 'Marcel Proust', NULL, NULL, 1),
(455, 114, 'Jean Cocteau', NULL, NULL, 1),
(456, 114, 'André de Malraux', NULL, NULL, 1),
(457, 115, 'Bernard Weber', NULL, NULL, 0),
(458, 115, 'Franck Thilliez', NULL, NULL, 1),
(459, 115, 'Maxime Chattam', NULL, NULL, 1),
(460, 115, 'Alexandre Jardin', NULL, NULL, 1),
(461, 116, 'Henri Rousseau', NULL, NULL, 0),
(462, 116, 'Pablo Picasso', NULL, NULL, 1),
(463, 116, 'Edgar Degas', NULL, NULL, 1),
(464, 116, 'Salvador Dali', NULL, NULL, 1),
(465, 117, 'Ulysse', NULL, NULL, 0),
(466, 117, 'Achille', NULL, NULL, 1),
(467, 117, 'Dédale', NULL, NULL, 1),
(468, 117, 'Hector', NULL, NULL, 1),
(469, 118, 'Sculptures', NULL, NULL, 0),
(470, 118, 'Tags', NULL, NULL, 1),
(471, 118, 'Peintures', NULL, NULL, 1),
(472, 118, 'Dessins', NULL, NULL, 1),
(473, 119, 'Capitaine Achab', NULL, NULL, 0),
(474, 119, 'Capitaine Crochet', NULL, NULL, 1),
(475, 119, 'Capitaine Fracasse', NULL, NULL, 1),
(476, 119, 'Capitaine Némo', NULL, NULL, 1),
(477, 120, 'Pop Art', NULL, NULL, 0),
(478, 120, 'Street Art', NULL, NULL, 1),
(479, 120, 'Land Art', NULL, NULL, 1),
(480, 120, 'Art Abstrait', NULL, NULL, 1),
(481, 121, 'Nouvelle-Zélande', NULL, NULL, 0),
(482, 121, 'France', NULL, NULL, 1),
(483, 121, 'Afrique du Sud', NULL, NULL, 1),
(484, 121, 'Angleterre', NULL, NULL, 1),
(485, 122, 'Utimate', NULL, NULL, 0),
(486, 122, 'Frisbee', NULL, NULL, 1),
(487, 122, 'Roller Derby', NULL, NULL, 1),
(488, 122, 'Water-polo', NULL, NULL, 1),
(489, 123, 'Cambre', NULL, NULL, 0),
(490, 123, 'Half-pipe', NULL, NULL, 1),
(491, 123, 'Stem', NULL, NULL, 1),
(492, 123, 'Télémark', NULL, NULL, 1),
(493, 124, 'Flamenco', NULL, NULL, 0),
(494, 124, 'Mambo', NULL, NULL, 1),
(495, 124, 'Jive', NULL, NULL, 1),
(496, 124, 'Valse', NULL, NULL, 1),
(497, 125, 'Route du café', NULL, NULL, 0),
(498, 125, 'Route du rhum', NULL, NULL, 1),
(499, 125, 'Vendée Globe', NULL, NULL, 1),
(500, 125, 'Trophée du rhum', NULL, NULL, 1),
(501, 126, 'Water-polo', NULL, NULL, 0),
(502, 126, 'Fistball', NULL, NULL, 1),
(503, 126, 'Ultimate', NULL, NULL, 1),
(504, 126, 'Triathlon', NULL, NULL, 1),
(505, 127, 'PSG ', NULL, NULL, 0),
(506, 127, 'LOSC', NULL, NULL, 1),
(507, 127, 'L\'OM', NULL, NULL, 1),
(508, 127, 'Girondins', NULL, NULL, 1),
(509, 128, 'Cambre', NULL, NULL, 0),
(510, 128, 'Half-pipe', NULL, NULL, 1),
(511, 128, 'Stem', NULL, NULL, 1),
(512, 128, 'Télémark', NULL, NULL, 1),
(513, 129, 'La corrida', NULL, NULL, 0),
(514, 129, 'Le carnaval', NULL, NULL, 1),
(515, 129, 'La plage', NULL, NULL, 1),
(516, 129, 'L\'opéra', NULL, NULL, 1),
(517, 130, 'Madison', NULL, NULL, 0),
(518, 130, 'Quick Step', NULL, NULL, 1),
(519, 130, 'Le Twist', NULL, NULL, 1),
(520, 130, 'Be-bop', NULL, NULL, 1),
(521, 131, 'La corrida', NULL, NULL, 0),
(522, 131, 'Le carnaval', NULL, NULL, 1),
(523, 131, 'La plage', NULL, NULL, 1),
(524, 131, 'L\'opéra', NULL, NULL, 1),
(525, 132, 'Afrique du Sud', NULL, NULL, 0),
(526, 132, 'Russie', NULL, NULL, 1),
(527, 132, 'Etats-Unis', NULL, NULL, 1),
(528, 132, 'Italie', NULL, NULL, 1),
(529, 133, 'Route du café', NULL, NULL, 0),
(530, 133, 'Route du rhum', NULL, NULL, 1),
(531, 133, 'Vendée Globe', NULL, NULL, 1),
(532, 133, 'Trophée du rhum', NULL, NULL, 1),
(533, 134, 'Japon', NULL, NULL, 0),
(534, 134, 'Angleterre', NULL, NULL, 1),
(535, 134, 'Italie', NULL, NULL, 1),
(536, 134, 'Australie', NULL, NULL, 1),
(537, 135, '40 min', NULL, NULL, 0),
(538, 135, '30 min', NULL, NULL, 1),
(539, 135, '35 min', NULL, NULL, 1),
(540, 135, '45 min', NULL, NULL, 1),
(541, 136, 'La corrida', NULL, NULL, 0),
(542, 136, 'Le carnaval', NULL, NULL, 1),
(543, 136, 'La plage', NULL, NULL, 1),
(544, 136, 'L\'opéra', NULL, NULL, 1),
(545, 137, 'Les Pays-Bas', NULL, NULL, 0),
(546, 137, 'La Belgique', NULL, NULL, 1),
(547, 137, 'La Suisse', NULL, NULL, 1),
(548, 137, 'La France', NULL, NULL, 1),
(549, 138, 'Johnny Wilkinson', NULL, NULL, 0),
(550, 138, 'Frédéric Michalak', NULL, NULL, 1),
(551, 138, 'Daniel Carter', NULL, NULL, 1),
(552, 138, 'Gavin Hastings', NULL, NULL, 1),
(553, 139, 'Samba', NULL, NULL, 0),
(554, 139, 'Rumba', NULL, NULL, 1),
(555, 139, 'Salsa', NULL, NULL, 1),
(556, 139, 'Cha-Cha', NULL, NULL, 1),
(557, 140, 'PSG ', NULL, NULL, 0),
(558, 140, 'LOSC', NULL, NULL, 1),
(559, 140, 'L\'OM', NULL, NULL, 1),
(560, 140, 'Girondins', NULL, NULL, 1),
(561, 141, 'La corrida', NULL, NULL, 0),
(562, 141, 'Le carnaval', NULL, NULL, 1),
(563, 141, 'La plage', NULL, NULL, 1),
(564, 141, 'L\'opéra', NULL, NULL, 1),
(565, 142, 'Florence Artaud', NULL, NULL, 0),
(566, 142, 'Isabelle Autissier', NULL, NULL, 1),
(567, 142, 'Mathilde Géron', NULL, NULL, 1),
(568, 142, 'Maud Fontenoy', NULL, NULL, 1),
(569, 143, 'Utimate', NULL, NULL, 0),
(570, 143, 'Frisbee', NULL, NULL, 1),
(571, 143, 'Roller Derby', NULL, NULL, 1),
(572, 143, 'Water-polo', NULL, NULL, 1),
(573, 144, 'Canada', NULL, NULL, 0),
(574, 144, 'Afrique du Sud', NULL, NULL, 1),
(575, 144, 'Angleterre', NULL, NULL, 1),
(576, 144, 'Australie', NULL, NULL, 1),
(577, 145, 'Cambre', NULL, NULL, 0),
(578, 145, 'Half-pipe', NULL, NULL, 1),
(579, 145, 'Stem', NULL, NULL, 1),
(580, 145, 'Télémark', NULL, NULL, 1),
(581, 146, 'Samba', NULL, NULL, 0),
(582, 146, 'Rumba', NULL, NULL, 1),
(583, 146, 'Salsa', NULL, NULL, 1),
(584, 146, 'Cha-Cha', NULL, NULL, 1),
(585, 147, 'Afrique du Sud', NULL, NULL, 0),
(586, 147, 'Russie', NULL, NULL, 1),
(587, 147, 'Etats-Unis', NULL, NULL, 1),
(588, 147, 'Italie', NULL, NULL, 1),
(589, 148, 'Tous les 4 ans', NULL, NULL, 0),
(590, 148, 'Tous les 3 ans', NULL, NULL, 1),
(591, 148, 'Tous les 5 ans', NULL, NULL, 1),
(592, 148, 'Tous les 6 ans', NULL, NULL, 1),
(593, 149, 'Johnny Wilkinson', NULL, NULL, 0),
(594, 149, 'Frédéric Michalak', NULL, NULL, 1),
(595, 149, 'Daniel Carter', NULL, NULL, 1),
(596, 149, 'Gavin Hastings', NULL, NULL, 1),
(597, 150, 'Florence Artaud', NULL, NULL, 0),
(598, 150, 'Isabelle Autissier', NULL, NULL, 1),
(599, 150, 'Mathilde Géron', NULL, NULL, 1),
(600, 150, 'Maud Fontenoy', NULL, NULL, 1),
(601, 151, 'Madison', NULL, NULL, 0),
(602, 151, 'Quick Step', NULL, NULL, 1),
(603, 151, 'Le Twist', NULL, NULL, 1),
(604, 151, 'Be-bop', NULL, NULL, 1),
(605, 152, 'Florence Artaud', NULL, NULL, 0),
(606, 152, 'Isabelle Autissier', NULL, NULL, 1),
(607, 152, 'Mathilde Géron', NULL, NULL, 1),
(608, 152, 'Maud Fontenoy', NULL, NULL, 1),
(609, 153, 'Samba', NULL, NULL, 0),
(610, 153, 'Rumba', NULL, NULL, 1),
(611, 153, 'Salsa', NULL, NULL, 1),
(612, 153, 'Cha-Cha', NULL, NULL, 1),
(613, 154, 'Tango', NULL, NULL, 0),
(614, 154, 'Salsa', NULL, NULL, 1),
(615, 154, 'Samba', NULL, NULL, 1),
(616, 154, 'Bachata', NULL, NULL, 1),
(617, 155, 'Afrique du Sud', NULL, NULL, 0),
(618, 155, 'Russie', NULL, NULL, 1),
(619, 155, 'Etats-Unis', NULL, NULL, 1),
(620, 155, 'Italie', NULL, NULL, 1),
(621, 156, 'Tous les 4 ans', NULL, NULL, 0),
(622, 156, 'Tous les 3 ans', NULL, NULL, 1),
(623, 156, 'Tous les 5 ans', NULL, NULL, 1),
(624, 156, 'Tous les 6 ans', NULL, NULL, 1),
(625, 157, 'Les Pays-Bas', NULL, NULL, 0),
(626, 157, 'La Belgique', NULL, NULL, 1),
(627, 157, 'La Suisse', NULL, NULL, 1),
(628, 157, 'La France', NULL, NULL, 1),
(629, 158, 'Canada', NULL, NULL, 0),
(630, 158, 'Afrique du Sud', NULL, NULL, 1),
(631, 158, 'Angleterre', NULL, NULL, 1),
(632, 158, 'Australie', NULL, NULL, 1),
(633, 159, 'Afrique du Sud', NULL, NULL, 0),
(634, 159, 'Russie', NULL, NULL, 1),
(635, 159, 'Etats-Unis', NULL, NULL, 1),
(636, 159, 'Italie', NULL, NULL, 1),
(637, 160, '13 millions', NULL, NULL, 0),
(638, 160, '10 millions', NULL, NULL, 1),
(639, 160, '16 millions', NULL, NULL, 1),
(640, 160, '19 millions', NULL, NULL, 1),
(641, 161, 'Tous les 4 ans', NULL, NULL, 0),
(642, 161, 'Tous les 3 ans', NULL, NULL, 1),
(643, 161, 'Tous les 5 ans', NULL, NULL, 1),
(644, 161, 'Tous les 6 ans', NULL, NULL, 1),
(645, 162, 'Canada', NULL, NULL, 0),
(646, 162, 'Afrique du Sud', NULL, NULL, 1),
(647, 162, 'Angleterre', NULL, NULL, 1),
(648, 162, 'Australie', NULL, NULL, 1),
(649, 163, '13 millions', NULL, NULL, 0),
(650, 163, '10 millions', NULL, NULL, 1),
(651, 163, '16 millions', NULL, NULL, 1),
(652, 163, '19 millions', NULL, NULL, 1),
(653, 164, 'Florence Artaud', NULL, NULL, 0),
(654, 164, 'Isabelle Autissier', NULL, NULL, 1),
(655, 164, 'Mathilde Géron', NULL, NULL, 1),
(656, 164, 'Maud Fontenoy', NULL, NULL, 1),
(657, 165, 'Flamenco', NULL, NULL, 0),
(658, 165, 'Mambo', NULL, NULL, 1),
(659, 165, 'Jive', NULL, NULL, 1),
(660, 165, 'Valse', NULL, NULL, 1),
(661, 166, 'Les Pays-Bas', NULL, NULL, 0),
(662, 166, 'La Belgique', NULL, NULL, 1),
(663, 166, 'La Suisse', NULL, NULL, 1),
(664, 166, 'La France', NULL, NULL, 1),
(665, 167, 'Utimate', NULL, NULL, 0),
(666, 167, 'Frisbee', NULL, NULL, 1),
(667, 167, 'Roller Derby', NULL, NULL, 1),
(668, 167, 'Water-polo', NULL, NULL, 1),
(669, 168, 'La corrida', NULL, NULL, 0),
(670, 168, 'Le carnaval', NULL, NULL, 1),
(671, 168, 'La plage', NULL, NULL, 1),
(672, 168, 'L\'opéra', NULL, NULL, 1),
(673, 169, 'PSG ', NULL, NULL, 0),
(674, 169, 'LOSC', NULL, NULL, 1),
(675, 169, 'L\'OM', NULL, NULL, 1),
(676, 169, 'Girondins', NULL, NULL, 1),
(677, 170, 'Madison', NULL, NULL, 0),
(678, 170, 'Quick Step', NULL, NULL, 1),
(679, 170, 'Le Twist', NULL, NULL, 1),
(680, 170, 'Be-bop', NULL, NULL, 1),
(681, 171, 'Japon', NULL, NULL, 0),
(682, 171, 'Angleterre', NULL, NULL, 1),
(683, 171, 'Italie', NULL, NULL, 1),
(684, 171, 'Australie', NULL, NULL, 1),
(685, 172, 'PSG ', NULL, NULL, 0),
(686, 172, 'LOSC', NULL, NULL, 1),
(687, 172, 'L\'OM', NULL, NULL, 1),
(688, 172, 'Girondins', NULL, NULL, 1),
(689, 173, 'Florence Artaud', NULL, NULL, 0),
(690, 173, 'Isabelle Autissier', NULL, NULL, 1),
(691, 173, 'Mathilde Géron', NULL, NULL, 1),
(692, 173, 'Maud Fontenoy', NULL, NULL, 1),
(693, 174, 'Flamenco', NULL, NULL, 0),
(694, 174, 'Mambo', NULL, NULL, 1),
(695, 174, 'Jive', NULL, NULL, 1),
(696, 174, 'Valse', NULL, NULL, 1),
(697, 175, 'Madison', NULL, NULL, 0),
(698, 175, 'Quick Step', NULL, NULL, 1),
(699, 175, 'Le Twist', NULL, NULL, 1),
(700, 175, 'Be-bop', NULL, NULL, 1),
(701, 176, 'Tous les 4 ans', NULL, NULL, 0),
(702, 176, 'Tous les 3 ans', NULL, NULL, 1),
(703, 176, 'Tous les 5 ans', NULL, NULL, 1),
(704, 176, 'Tous les 6 ans', NULL, NULL, 1),
(705, 177, 'Samba', NULL, NULL, 0),
(706, 177, 'Rumba', NULL, NULL, 1),
(707, 177, 'Salsa', NULL, NULL, 1),
(708, 177, 'Cha-Cha', NULL, NULL, 1),
(709, 178, 'Japon', NULL, NULL, 0),
(710, 178, 'Angleterre', NULL, NULL, 1),
(711, 178, 'Italie', NULL, NULL, 1),
(712, 178, 'Australie', NULL, NULL, 1),
(713, 179, 'Afrique du Sud', NULL, NULL, 0),
(714, 179, 'Russie', NULL, NULL, 1),
(715, 179, 'Etats-Unis', NULL, NULL, 1),
(716, 179, 'Italie', NULL, NULL, 1),
(717, 180, 'Florence Artaud', NULL, NULL, 0),
(718, 180, 'Isabelle Autissier', NULL, NULL, 1),
(719, 180, 'Mathilde Géron', NULL, NULL, 1),
(720, 180, 'Maud Fontenoy', NULL, NULL, 1),
(721, 181, 'Utimate', NULL, NULL, 0),
(722, 181, 'Frisbee', NULL, NULL, 1),
(723, 181, 'Roller Derby', NULL, NULL, 1),
(724, 181, 'Water-polo', NULL, NULL, 1),
(725, 182, 'Florence Artaud', NULL, NULL, 0),
(726, 182, 'Isabelle Autissier', NULL, NULL, 1),
(727, 182, 'Mathilde Géron', NULL, NULL, 1),
(728, 182, 'Maud Fontenoy', NULL, NULL, 1),
(729, 183, 'Tous les 4 ans', NULL, NULL, 0),
(730, 183, 'Tous les 3 ans', NULL, NULL, 1),
(731, 183, 'Tous les 5 ans', NULL, NULL, 1),
(732, 183, 'Tous les 6 ans', NULL, NULL, 1),
(733, 184, 'Canada', NULL, NULL, 0),
(734, 184, 'Afrique du Sud', NULL, NULL, 1),
(735, 184, 'Angleterre', NULL, NULL, 1),
(736, 184, 'Australie', NULL, NULL, 1),
(737, 185, 'L\'Afrique du Sud', NULL, NULL, 0),
(738, 185, 'L\'Australie', NULL, NULL, 1),
(739, 185, 'La Nouvelle-Zélande', NULL, NULL, 1),
(740, 185, 'Les Fidji', NULL, NULL, 1),
(741, 186, 'Water-polo', NULL, NULL, 0),
(742, 186, 'Fistball', NULL, NULL, 1),
(743, 186, 'Ultimate', NULL, NULL, 1),
(744, 186, 'Triathlon', NULL, NULL, 1),
(745, 187, 'Afrique du Sud', NULL, NULL, 0),
(746, 187, 'Russie', NULL, NULL, 1),
(747, 187, 'Etats-Unis', NULL, NULL, 1),
(748, 187, 'Italie', NULL, NULL, 1),
(749, 188, 'Tous les 4 ans', NULL, NULL, 0),
(750, 188, 'Tous les 3 ans', NULL, NULL, 1),
(751, 188, 'Tous les 5 ans', NULL, NULL, 1),
(752, 188, 'Tous les 6 ans', NULL, NULL, 1),
(753, 189, 'Canada', NULL, NULL, 0),
(754, 189, 'Afrique du Sud', NULL, NULL, 1),
(755, 189, 'Angleterre', NULL, NULL, 1),
(756, 189, 'Australie', NULL, NULL, 1),
(757, 190, 'Les Pays-Bas', NULL, NULL, 0),
(758, 190, 'La Belgique', NULL, NULL, 1),
(759, 190, 'La Suisse', NULL, NULL, 1),
(760, 190, 'La France', NULL, NULL, 1),
(761, 191, 'Florence Artaud', NULL, NULL, 0),
(762, 191, 'Isabelle Autissier', NULL, NULL, 1),
(763, 191, 'Mathilde Géron', NULL, NULL, 1),
(764, 191, 'Maud Fontenoy', NULL, NULL, 1),
(765, 192, 'Japon', NULL, NULL, 0),
(766, 192, 'Angleterre', NULL, NULL, 1),
(767, 192, 'Italie', NULL, NULL, 1),
(768, 192, 'Australie', NULL, NULL, 1),
(769, 193, 'Tango', NULL, NULL, 0),
(770, 193, 'Salsa', NULL, NULL, 1),
(771, 193, 'Samba', NULL, NULL, 1),
(772, 193, 'Bachata', NULL, NULL, 1),
(773, 194, 'L\'Afrique du Sud', NULL, NULL, 0),
(774, 194, 'L\'Australie', NULL, NULL, 1),
(775, 194, 'La Nouvelle-Zélande', NULL, NULL, 1),
(776, 194, 'Les Fidji', NULL, NULL, 1),
(777, 195, 'La corrida', NULL, NULL, 0),
(778, 195, 'Le carnaval', NULL, NULL, 1),
(779, 195, 'La plage', NULL, NULL, 1),
(780, 195, 'L\'opéra', NULL, NULL, 1),
(781, 196, '13 millions', NULL, NULL, 0),
(782, 196, '10 millions', NULL, NULL, 1),
(783, 196, '16 millions', NULL, NULL, 1),
(784, 196, '19 millions', NULL, NULL, 1),
(785, 197, 'Johnny Wilkinson', NULL, NULL, 0),
(786, 197, 'Frédéric Michalak', NULL, NULL, 1),
(787, 197, 'Daniel Carter', NULL, NULL, 1),
(788, 197, 'Gavin Hastings', NULL, NULL, 1),
(789, 198, '40 min', NULL, NULL, 0),
(790, 198, '30 min', NULL, NULL, 1),
(791, 198, '35 min', NULL, NULL, 1),
(792, 198, '45 min', NULL, NULL, 1),
(793, 199, 'Tous les 4 ans', NULL, NULL, 0),
(794, 199, 'Tous les 3 ans', NULL, NULL, 1),
(795, 199, 'Tous les 5 ans', NULL, NULL, 1),
(796, 199, 'Tous les 6 ans', NULL, NULL, 1),
(797, 200, 'Water-polo', NULL, NULL, 0),
(798, 200, 'Fistball', NULL, NULL, 1),
(799, 200, 'Ultimate', NULL, NULL, 1),
(800, 200, 'Triathlon', NULL, NULL, 1),
(801, 201, 'Utimate', NULL, NULL, 0),
(802, 201, 'Frisbee', NULL, NULL, 1),
(803, 201, 'Roller Derby', NULL, NULL, 1),
(804, 201, 'Water-polo', NULL, NULL, 1),
(805, 202, 'Samba', NULL, NULL, 0),
(806, 202, 'Rumba', NULL, NULL, 1),
(807, 202, 'Salsa', NULL, NULL, 1),
(808, 202, 'Cha-Cha', NULL, NULL, 1),
(809, 203, 'PSG ', NULL, NULL, 0),
(810, 203, 'LOSC', NULL, NULL, 1),
(811, 203, 'L\'OM', NULL, NULL, 1),
(812, 203, 'Girondins', NULL, NULL, 1),
(813, 204, 'Nouvelle-Zélande', NULL, NULL, 0),
(814, 204, 'France', NULL, NULL, 1),
(815, 204, 'Afrique du Sud', NULL, NULL, 1),
(816, 204, 'Angleterre', NULL, NULL, 1),
(817, 205, 'Water-polo', NULL, NULL, 0),
(818, 205, 'Fistball', NULL, NULL, 1),
(819, 205, 'Ultimate', NULL, NULL, 1),
(820, 205, 'Triathlon', NULL, NULL, 1),
(821, 206, 'Florence Artaud', NULL, NULL, 0),
(822, 206, 'Isabelle Autissier', NULL, NULL, 1),
(823, 206, 'Mathilde Géron', NULL, NULL, 1),
(824, 206, 'Maud Fontenoy', NULL, NULL, 1),
(825, 207, 'Nouvelle-Zélande', NULL, NULL, 0),
(826, 207, 'France', NULL, NULL, 1),
(827, 207, 'Afrique du Sud', NULL, NULL, 1),
(828, 207, 'Angleterre', NULL, NULL, 1),
(829, 208, 'Japon', NULL, NULL, 0),
(830, 208, 'Angleterre', NULL, NULL, 1),
(831, 208, 'Italie', NULL, NULL, 1),
(832, 208, 'Australie', NULL, NULL, 1),
(833, 209, 'Madison', NULL, NULL, 0),
(834, 209, 'Quick Step', NULL, NULL, 1),
(835, 209, 'Le Twist', NULL, NULL, 1),
(836, 209, 'Be-bop', NULL, NULL, 1),
(837, 210, 'Cambre', NULL, NULL, 0),
(838, 210, 'Half-pipe', NULL, NULL, 1),
(839, 210, 'Stem', NULL, NULL, 1),
(840, 210, 'Télémark', NULL, NULL, 1),
(841, 211, 'Nouvelle-Zélande', NULL, NULL, 0),
(842, 211, 'France', NULL, NULL, 1),
(843, 211, 'Afrique du Sud', NULL, NULL, 1),
(844, 211, 'Angleterre', NULL, NULL, 1),
(845, 212, 'Madison', NULL, NULL, 0),
(846, 212, 'Quick Step', NULL, NULL, 1),
(847, 212, 'Le Twist', NULL, NULL, 1),
(848, 212, 'Be-bop', NULL, NULL, 1),
(849, 213, 'La corrida', NULL, NULL, 0),
(850, 213, 'Le carnaval', NULL, NULL, 1),
(851, 213, 'La plage', NULL, NULL, 1),
(852, 213, 'L\'opéra', NULL, NULL, 1),
(853, 214, 'Les Pays-Bas', NULL, NULL, 0),
(854, 214, 'La Belgique', NULL, NULL, 1),
(855, 214, 'La Suisse', NULL, NULL, 1),
(856, 214, 'La France', NULL, NULL, 1),
(857, 215, '13 millions', NULL, NULL, 0),
(858, 215, '10 millions', NULL, NULL, 1),
(859, 215, '16 millions', NULL, NULL, 1),
(860, 215, '19 millions', NULL, NULL, 1),
(861, 216, 'Tango', NULL, NULL, 0),
(862, 216, 'Salsa', NULL, NULL, 1),
(863, 216, 'Samba', NULL, NULL, 1),
(864, 216, 'Bachata', NULL, NULL, 1),
(865, 217, 'Florence Artaud', NULL, NULL, 0),
(866, 217, 'Isabelle Autissier', NULL, NULL, 1),
(867, 217, 'Mathilde Géron', NULL, NULL, 1),
(868, 217, 'Maud Fontenoy', NULL, NULL, 1),
(869, 218, 'PSG ', NULL, NULL, 0),
(870, 218, 'LOSC', NULL, NULL, 1),
(871, 218, 'L\'OM', NULL, NULL, 1),
(872, 218, 'Girondins', NULL, NULL, 1),
(873, 219, '13 millions', NULL, NULL, 0),
(874, 219, '10 millions', NULL, NULL, 1),
(875, 219, '16 millions', NULL, NULL, 1),
(876, 219, '19 millions', NULL, NULL, 1),
(877, 220, 'Tous les 4 ans', NULL, NULL, 0),
(878, 220, 'Tous les 3 ans', NULL, NULL, 1),
(879, 220, 'Tous les 5 ans', NULL, NULL, 1),
(880, 220, 'Tous les 6 ans', NULL, NULL, 1),
(881, 221, '13 millions', NULL, NULL, 0),
(882, 221, '10 millions', NULL, NULL, 1),
(883, 221, '16 millions', NULL, NULL, 1),
(884, 221, '19 millions', NULL, NULL, 1),
(885, 222, 'Nouvelle-Zélande', NULL, NULL, 0),
(886, 222, 'France', NULL, NULL, 1),
(887, 222, 'Afrique du Sud', NULL, NULL, 1),
(888, 222, 'Angleterre', NULL, NULL, 1),
(889, 223, 'Les Pays-Bas', NULL, NULL, 0),
(890, 223, 'La Belgique', NULL, NULL, 1),
(891, 223, 'La Suisse', NULL, NULL, 1),
(892, 223, 'La France', NULL, NULL, 1),
(893, 224, 'Tango', NULL, NULL, 0),
(894, 224, 'Salsa', NULL, NULL, 1),
(895, 224, 'Samba', NULL, NULL, 1),
(896, 224, 'Bachata', NULL, NULL, 1),
(897, 225, 'PSG ', NULL, NULL, 0),
(898, 225, 'LOSC', NULL, NULL, 1),
(899, 225, 'L\'OM', NULL, NULL, 1),
(900, 225, 'Girondins', NULL, NULL, 1),
(901, 226, 'Tango', NULL, NULL, 0),
(902, 226, 'Salsa', NULL, NULL, 1),
(903, 226, 'Samba', NULL, NULL, 1),
(904, 226, 'Bachata', NULL, NULL, 1),
(905, 227, 'Utimate', NULL, NULL, 0),
(906, 227, 'Frisbee', NULL, NULL, 1),
(907, 227, 'Roller Derby', NULL, NULL, 1),
(908, 227, 'Water-polo', NULL, NULL, 1),
(909, 228, 'Japon', NULL, NULL, 0),
(910, 228, 'Angleterre', NULL, NULL, 1),
(911, 228, 'Italie', NULL, NULL, 1),
(912, 228, 'Australie', NULL, NULL, 1),
(913, 229, 'Johnny Wilkinson', NULL, NULL, 0),
(914, 229, 'Frédéric Michalak', NULL, NULL, 1),
(915, 229, 'Daniel Carter', NULL, NULL, 1),
(916, 229, 'Gavin Hastings', NULL, NULL, 1),
(917, 230, 'Florence Artaud', NULL, NULL, 0),
(918, 230, 'Isabelle Autissier', NULL, NULL, 1),
(919, 230, 'Mathilde Géron', NULL, NULL, 1),
(920, 230, 'Maud Fontenoy', NULL, NULL, 1),
(921, 231, 'Water-polo', NULL, NULL, 0),
(922, 231, 'Fistball', NULL, NULL, 1),
(923, 231, 'Ultimate', NULL, NULL, 1),
(924, 231, 'Triathlon', NULL, NULL, 1),
(925, 232, 'L\'Afrique du Sud', NULL, NULL, 0),
(926, 232, 'L\'Australie', NULL, NULL, 1),
(927, 232, 'La Nouvelle-Zélande', NULL, NULL, 1),
(928, 232, 'Les Fidji', NULL, NULL, 1),
(929, 233, 'Madison', NULL, NULL, 0),
(930, 233, 'Quick Step', NULL, NULL, 1),
(931, 233, 'Le Twist', NULL, NULL, 1),
(932, 233, 'Be-bop', NULL, NULL, 1),
(933, 234, 'Tous les 4 ans', NULL, NULL, 0),
(934, 234, 'Tous les 3 ans', NULL, NULL, 1),
(935, 234, 'Tous les 5 ans', NULL, NULL, 1),
(936, 234, 'Tous les 6 ans', NULL, NULL, 1),
(937, 235, 'PSG ', NULL, NULL, 0),
(938, 235, 'LOSC', NULL, NULL, 1),
(939, 235, 'L\'OM', NULL, NULL, 1),
(940, 235, 'Girondins', NULL, NULL, 1),
(941, 236, 'Flamenco', NULL, NULL, 0),
(942, 236, 'Mambo', NULL, NULL, 1),
(943, 236, 'Jive', NULL, NULL, 1),
(944, 236, 'Valse', NULL, NULL, 1),
(945, 237, 'La corrida', NULL, NULL, 0),
(946, 237, 'Le carnaval', NULL, NULL, 1),
(947, 237, 'La plage', NULL, NULL, 1),
(948, 237, 'L\'opéra', NULL, NULL, 1),
(949, 238, 'PSG ', NULL, NULL, 0),
(950, 238, 'LOSC', NULL, NULL, 1),
(951, 238, 'L\'OM', NULL, NULL, 1),
(952, 238, 'Girondins', NULL, NULL, 1),
(953, 239, 'Les Pays-Bas', NULL, NULL, 0),
(954, 239, 'La Belgique', NULL, NULL, 1),
(955, 239, 'La Suisse', NULL, NULL, 1),
(956, 239, 'La France', NULL, NULL, 1),
(957, 240, 'Japon', NULL, NULL, 0),
(958, 240, 'Angleterre', NULL, NULL, 1),
(959, 240, 'Italie', NULL, NULL, 1),
(960, 240, 'Australie', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3RtRkVXzrCJVUhjBv2a4ZeT8DZ2eSZ6zBT0YFlN3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibWFENjlXeU5ZWURhSEE2Z3lGc1I2ZW84TFlYdHdqb0lFeEt2amlTWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTA6ImdhbWVVc2VySWQiO2k6MTg7fQ==', 1718375977),
('bwvdRDprzvjxx2pazOhOAKH3bmE0twaJnLJNxHYi', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRmd5c0M1SGFtQlR0alVaN0RmSnQzQVlybW1kSmttZlZDQWtOU1FYQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9xdWl6L2dhbWUvMS9BSVBZM0RQUiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1718358370),
('JfW8NX36v8nO4fyfXhht4oRSS1NaNSHkScXf6dFr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmdHOFg3NXA1VFNYc2JZcklrMXp1eU9TQmJiblBzRUVjWGc5bVdlcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718358517),
('ylVpu3mWeuGNIVEw3CMxvRMvDFfgqr8vKQD4u9eu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSENuUm10ZDhTMHpUU0ZtNGZ6a205MzFPQ0JYMXMyOUpzYU9VdjdIcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9xdWl6L2dhbWUvMS9YQ0QwOURNVCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1718375968);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `nickname`) VALUES
(1, 'strucuture.skz@gmail.com', NULL, '$2y$12$AQM0/hV25ejPU8qOtJLFyOc2rzH2ZDPTYH3/usGCOUNjiJEnHpp3a', NULL, '2024-06-13 07:38:39', '2024-06-13 07:38:39', 'naka');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_user`
--
ALTER TABLE `game_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `game_user_response`
--
ALTER TABLE `game_user_response`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `game_user`
--
ALTER TABLE `game_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `game_user_response`
--
ALTER TABLE `game_user_response`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `history`
--
ALTER TABLE `history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `response`
--
ALTER TABLE `response`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=961;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
