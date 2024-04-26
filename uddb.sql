-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 25 avr. 2024 à 15:30
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `uddb`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `note` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `libelle`) VALUES
(1, '2024-04-09 00:20:37', '2024-04-09 00:20:37', 'developement'),
(2, '2024-04-09 00:21:30', '2024-04-09 00:21:30', 'bureautique'),
(3, '2024-04-16 13:37:16', '2024-04-16 13:37:16', 'commerce'),
(4, '2024-04-16 13:37:16', '2024-04-16 13:37:16', 'stage'),
(5, '2024-04-16 13:37:16', '2024-04-16 13:37:16', 'autres');

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `statut` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_limite` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` mediumtext DEFAULT NULL,
  `nomDemandeur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demandes`
--

INSERT INTO `demandes` (`id`, `user_id`, `statut`, `titre`, `description`, `date_limite`, `created_at`, `updated_at`, `categorie_id`, `photo`, `nomDemandeur`) VALUES
(2, 3, '1', 'stagiaire dev', 'efficace te gaw', '2024-04-12', '2024-04-09 19:55:36', '2024-04-12 09:54:05', 2, 'papa.jpg', 'papa'),
(20, 12, '1', 'recherche peintre', 'heeeeeeeeeeeeeeeeeee', '2024-07-10', '2024-04-10 00:05:36', '2024-04-10 00:05:36', 1, 'PAPA BADARA NDIAYE (1).pdf', 'snowfall'),
(22, 14, '1', 'recherche assisttant', 'expert en redaction et bureautique', '2024-04-15', '2024-04-12 00:11:39', '2024-04-12 00:11:39', 2, 'Untitled.pdf', 'kendrick'),
(23, 11, '1', 'cuisinier tres bon', 'azertsfdcervscxgdgrtraaaaa', '2024-04-27', '2024-04-12 10:31:01', '2024-04-12 11:05:07', 1, '[object FileList]', 'butcher'),
(24, 3, '1', 'infographe', 'design web,affiche creation originale pour la publicite', '2024-06-10', '2024-04-23 14:13:02', '2024-04-23 14:13:02', 3, 'blog-2.jpg', 'papa');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_06_013343_create_roles_table', 1),
(6, '2024_04_06_015643_create__profile_table', 2),
(7, '2024_04_06_020852_update_users_table', 2),
(8, '2024_04_06_021907_add_idprofil_to__users_table', 3),
(9, '2024_04_06_022552_create__categories_table', 4),
(10, '2024_04_06_022852_create__services_table', 5),
(11, '2024_04_06_023649_create_demandes_table', 6),
(12, '2024_04_06_024159_create_avis_table', 7),
(13, '2024_04_06_024627_update_services_table', 7),
(14, '2024_04_06_024738_update_demandes_table', 7),
(15, '2024_04_06_123534_add_photo_to_demandes_table', 8),
(16, '2024_04_06_123828_add_photo_to_services_table', 8),
(17, '2024_04_06_124018_add_cv_to_profile_table', 8),
(18, '2024_04_06_130327_add_telephone_to_users_table', 9),
(19, '2024_04_06_134537_update_profile_table', 10),
(20, '2024_04_06_134741_add_tarif_cv_solde_to_users_table', 11),
(21, '2024_04_06_230926_profile_controller', 12),
(22, '2024_04_09_002935_add_statut_to_services_table', 12),
(23, '2024_04_09_004407_delete_service_id_from_demandes_table', 13),
(24, '2024_04_09_212824_add__nom_demandeur_to_demandes_table', 14),
(25, '2024_04_10_223833_update_services_table', 15);

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
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'token', '1a814a02a76280efd44022ee0adf905dbc73c3069196ae6496ed077bddae89cc', '[\"*\"]', NULL, NULL, '2024-04-06 14:42:52', '2024-04-06 14:42:52'),
(2, 'App\\Models\\User', 3, 'token', '8327b2e80b2441d4c21b64d269a513daac0af213fdf54cfdaea3ae1f4f8a07d0', '[\"*\"]', NULL, NULL, '2024-04-06 14:55:30', '2024-04-06 14:55:30'),
(3, 'App\\Models\\User', 3, 'token', '6d02d078d96ec98e1765e217abbe6f73cd03cfd602454bd52b93333d710f7a92', '[\"*\"]', '2024-04-06 15:04:44', NULL, '2024-04-06 14:59:11', '2024-04-06 15:04:44'),
(4, 'App\\Models\\User', 3, 'token', '82614bbf91ab0a19b856bcaab25e6eb8687d07d7289fcc8fd7ff8aa50229dbdd', '[\"*\"]', '2024-04-06 15:14:18', NULL, '2024-04-06 15:05:04', '2024-04-06 15:14:18'),
(5, 'App\\Models\\User', 3, 'token', '026d2434dfd99569a57f6ba23f6deb5e1444c40280ed0c7c0ead9dc8b0e2872e', '[\"*\"]', '2024-04-06 15:15:01', NULL, '2024-04-06 15:14:51', '2024-04-06 15:15:01'),
(6, 'App\\Models\\User', 10, 'token', '47214598d8eea08504b073870069740b9a62be02fc3bd30969cc3650705769ac', '[\"*\"]', NULL, NULL, '2024-04-07 19:04:13', '2024-04-07 19:04:13'),
(7, 'App\\Models\\User', 10, 'token', 'e8a86738d2503afc72dff570f5fe19bdd8d4daa2840f6920b71cea28b5294c5c', '[\"*\"]', NULL, NULL, '2024-04-07 19:05:32', '2024-04-07 19:05:32'),
(8, 'App\\Models\\User', 10, 'token', '62918f676472faca25502593dc74ce2b76ad20a5fa5594a31d44c111993c111c', '[\"*\"]', NULL, NULL, '2024-04-07 19:05:57', '2024-04-07 19:05:57'),
(9, 'App\\Models\\User', 12, 'token', 'b65a50c1d3dab5e536fd201a309c6a90f5ddc0fc772f328b6ec79abec31316bb', '[\"*\"]', NULL, NULL, '2024-04-07 19:11:34', '2024-04-07 19:11:34'),
(10, 'App\\Models\\User', 12, 'token', '43fe6ced72f844d3ccf4a43ac06f4f656e75090fd5750eba1eb5e828ecd32985', '[\"*\"]', NULL, NULL, '2024-04-07 19:12:26', '2024-04-07 19:12:26'),
(11, 'App\\Models\\User', 12, 'token', '7bbe58a4adc6de116f26f3e9b76070af6c267a9e608c66619f23255ca3bc80d3', '[\"*\"]', NULL, NULL, '2024-04-07 22:23:30', '2024-04-07 22:23:30'),
(12, 'App\\Models\\User', 12, 'token', '908aa8648568cdd36d3ecec1f156a20b185c37d50b466ed518e37abb6f3d9dbd', '[\"*\"]', NULL, NULL, '2024-04-07 22:24:15', '2024-04-07 22:24:15'),
(13, 'App\\Models\\User', 12, 'token', '69d68a8ffd27636fd9c018494f63e816ff30dd29e4f59410fc0a3ca994a12ccd', '[\"*\"]', NULL, NULL, '2024-04-07 22:32:43', '2024-04-07 22:32:43'),
(14, 'App\\Models\\User', 12, 'token', '401604046c06faf02837fdfe1cfd589dafdd7d931c2806522a0d58217fc4bea0', '[\"*\"]', '2024-04-07 22:44:16', NULL, '2024-04-07 22:44:12', '2024-04-07 22:44:16'),
(15, 'App\\Models\\User', 12, 'token', '36f42e06d03eb71354a307c758fd98ede1d77e4bac7e97ccdd413f3c4c2dc928', '[\"*\"]', NULL, NULL, '2024-04-07 22:44:30', '2024-04-07 22:44:30'),
(16, 'App\\Models\\User', 12, 'token', '267e93125e25e52deb0bc0662bd3821f9bf5cdfc325e7f6b31e69805f0fb3410', '[\"*\"]', '2024-04-07 22:58:03', NULL, '2024-04-07 22:50:36', '2024-04-07 22:58:03'),
(17, 'App\\Models\\User', 12, 'token', 'f9b18682113d542bbb5de7d6504bed61ba63f277d1289176fd3adce52e4927cb', '[\"*\"]', '2024-04-07 23:03:47', NULL, '2024-04-07 22:58:02', '2024-04-07 23:03:47'),
(18, 'App\\Models\\User', 12, 'token', '4198764fa00309d69b2f61557dbad413a26ec21524250199c607db29340b15fa', '[\"*\"]', NULL, NULL, '2024-04-07 23:05:10', '2024-04-07 23:05:10'),
(19, 'App\\Models\\User', 12, 'token', 'ff37b4f175811101ecc74a9803f9e816e174d9894d5c803b2a7bfd7041a122c4', '[\"*\"]', '2024-04-07 23:11:32', NULL, '2024-04-07 23:06:02', '2024-04-07 23:11:32'),
(20, 'App\\Models\\User', 12, 'token', '582aad6dccde826cd9a81673aba9f6b774844c1e61673a64bf6e96d7614d24dd', '[\"*\"]', '2024-04-07 23:15:16', NULL, '2024-04-07 23:11:31', '2024-04-07 23:15:16'),
(21, 'App\\Models\\User', 11, 'token', 'a7b7328d273fdc6517ab9026480fc20502f39a564739d9c14ce9ac61ad052893', '[\"*\"]', NULL, NULL, '2024-04-07 23:16:12', '2024-04-07 23:16:12'),
(22, 'App\\Models\\User', 11, 'token', 'd353cf8aef51f02e98927e6ce0ce312fb44acc14f52781da4ac5de1d92cd9e3c', '[\"*\"]', '2024-04-07 23:18:03', NULL, '2024-04-07 23:16:58', '2024-04-07 23:18:03'),
(23, 'App\\Models\\User', 12, 'token', '2bbd5dbd57e47e983ec2c8938582138751ff6ba508a57a6b7ee819961c5cc0b9', '[\"*\"]', '2024-04-07 23:32:18', NULL, '2024-04-07 23:18:15', '2024-04-07 23:32:18'),
(24, 'App\\Models\\User', 12, 'token', '242b69dfecced188a15fbc2ab765bf2f2d92a6977495921374abdf9de2d29cd8', '[\"*\"]', '2024-04-07 23:36:39', NULL, '2024-04-07 23:36:11', '2024-04-07 23:36:39'),
(25, 'App\\Models\\User', 11, 'token', '974f903950f1d490dc1879ee119685c3fd417d03427a713f1fe89cc9e51bd13b', '[\"*\"]', '2024-04-07 23:39:06', NULL, '2024-04-07 23:36:57', '2024-04-07 23:39:06'),
(26, 'App\\Models\\User', 11, 'token', 'ee9589aedcbfcd97be7dc108b8e588c2d437e057d68329afd58289b06deaad6f', '[\"*\"]', '2024-04-07 23:41:51', NULL, '2024-04-07 23:41:41', '2024-04-07 23:41:51'),
(27, 'App\\Models\\User', 12, 'token', '20f175efa45247c6a961002f41bc02f27c601d4a265fc17b1bb28a0e329eec1f', '[\"*\"]', '2024-04-07 23:51:13', NULL, '2024-04-07 23:42:02', '2024-04-07 23:51:13'),
(28, 'App\\Models\\User', 12, 'token', '03f0fc3861407b2b25d7581aa22780a7bee845c00418abc1e014d13c53764bb2', '[\"*\"]', '2024-04-08 00:05:10', NULL, '2024-04-08 00:03:34', '2024-04-08 00:05:10'),
(29, 'App\\Models\\User', 12, 'token', '9a741d3f53914304dfbaf3353b8948df07f283f80603344c14c64bd28de0c6f7', '[\"*\"]', NULL, NULL, '2024-04-08 00:05:43', '2024-04-08 00:05:43'),
(30, 'App\\Models\\User', 12, 'token', '17bfd342e5957d027f944e45e279629e9dd73c601a81430ab1585706bdc89cba', '[\"*\"]', '2024-04-08 00:09:06', NULL, '2024-04-08 00:07:27', '2024-04-08 00:09:06'),
(31, 'App\\Models\\User', 12, 'token', 'b03effac803bd0ae3bfa52f3a5df6c9102495bb3ece2bead3790f67f5dc80d9f', '[\"*\"]', '2024-04-08 00:13:27', NULL, '2024-04-08 00:09:15', '2024-04-08 00:13:27'),
(32, 'App\\Models\\User', 12, 'token', '0088475c98449e5564b4ed6f314962efc0d257de1bb874fd3d0160f53800e35c', '[\"*\"]', '2024-04-08 00:20:17', NULL, '2024-04-08 00:17:46', '2024-04-08 00:20:17'),
(33, 'App\\Models\\User', 12, 'token', 'e8aa4c3aefb083ac0d93e254dd83cda705efae30f6f2e13a6eb7b65918da9420', '[\"*\"]', '2024-04-08 00:21:04', NULL, '2024-04-08 00:20:25', '2024-04-08 00:21:04'),
(34, 'App\\Models\\User', 12, 'token', '4252473fc777798fe5cc314a2fd881d5159b3f31df4c260d7c667c26df273fcf', '[\"*\"]', '2024-04-08 00:23:47', NULL, '2024-04-08 00:21:12', '2024-04-08 00:23:47'),
(35, 'App\\Models\\User', 12, 'token', 'e359dc6bdc7840087993b4edb441c046d8f37a894faa4136517ea31fd9a4057c', '[\"*\"]', '2024-04-08 00:25:40', NULL, '2024-04-08 00:25:18', '2024-04-08 00:25:40'),
(36, 'App\\Models\\User', 12, 'token', 'c09430d0aaa513efed2fb32ee16c520cd7e438a32c5e3d3b6894bea90847a310', '[\"*\"]', '2024-04-08 00:27:40', NULL, '2024-04-08 00:27:31', '2024-04-08 00:27:40'),
(37, 'App\\Models\\User', 12, 'token', '24234f2e1b8ff73688f9db73238dd53c1848ee1db40e42a71adcd927fe17d239', '[\"*\"]', '2024-04-08 00:29:45', NULL, '2024-04-08 00:29:40', '2024-04-08 00:29:45'),
(38, 'App\\Models\\User', 12, 'token', '9a23654709d9b2360aa8b6a4072617939b7dd941034fd78fd2f96b94c8c1edaf', '[\"*\"]', '2024-04-08 00:34:13', NULL, '2024-04-08 00:31:02', '2024-04-08 00:34:13'),
(39, 'App\\Models\\User', 12, 'token', 'bb92a55514406e62e60ddc5faa2469e23dbb321007fb9644fb185592072b3934', '[\"*\"]', '2024-04-08 00:46:49', NULL, '2024-04-08 00:46:38', '2024-04-08 00:46:49'),
(40, 'App\\Models\\User', 12, 'token', 'd8fbb166abe0bbbf86f0f02374cc758b48b36140692c1af7df59dd3b6cac3f6a', '[\"*\"]', '2024-04-08 00:49:52', NULL, '2024-04-08 00:49:44', '2024-04-08 00:49:52'),
(41, 'App\\Models\\User', 12, 'token', 'ed6035e6cd80d6cfaa31494294d1142c4ef41dfd1c6a32f6b24be1df77055b57', '[\"*\"]', '2024-04-08 00:52:25', NULL, '2024-04-08 00:50:38', '2024-04-08 00:52:25'),
(42, 'App\\Models\\User', 12, 'token', '9060c0c585c41a45a4e8a0cf7b4ce0c88a2afa3ecf985bb55b73f2a843ef6ff4', '[\"*\"]', NULL, NULL, '2024-04-08 00:52:36', '2024-04-08 00:52:36'),
(43, 'App\\Models\\User', 12, 'token', '0a23335c030619bb8750fc03806cf4372c9bc8b4be1ad5042a470a72230f4427', '[\"*\"]', NULL, NULL, '2024-04-08 00:53:22', '2024-04-08 00:53:22'),
(44, 'App\\Models\\User', 12, 'token', '7627af408600975edb7191f772fcfa4dae933b7809cece412090b3c22211cd1d', '[\"*\"]', '2024-04-08 00:59:03', NULL, '2024-04-08 00:55:37', '2024-04-08 00:59:03'),
(45, 'App\\Models\\User', 12, 'token', 'da6e648787082054f394e8821d98ac94b0be88a994683504f1d98d9f2a2a79ef', '[\"*\"]', '2024-04-08 01:00:19', NULL, '2024-04-08 00:59:37', '2024-04-08 01:00:19'),
(46, 'App\\Models\\User', 12, 'token', 'a33b22526fede1ddf17d268e07030e246294b35869d27971b6e626050b5b4569', '[\"*\"]', '2024-04-08 01:10:31', NULL, '2024-04-08 01:06:30', '2024-04-08 01:10:31'),
(47, 'App\\Models\\User', 12, 'token', '9f8566a89af402232f2084cb76e2479cfc22198d0705bfec7daab3c0f304e33c', '[\"*\"]', '2024-04-08 01:13:29', NULL, '2024-04-08 01:10:39', '2024-04-08 01:13:29'),
(48, 'App\\Models\\User', 12, 'token', '31b16e9a8cd8f6cd8c82a89e88007d1eb05dc0f058acc99ae8bd0663e6730718', '[\"*\"]', '2024-04-08 01:14:13', NULL, '2024-04-08 01:13:36', '2024-04-08 01:14:13'),
(49, 'App\\Models\\User', 12, 'token', '81769e5affa3f19f359894c5c07def9fa8b12f2b21de1c5372b8de551f9f0700', '[\"*\"]', '2024-04-08 01:14:38', NULL, '2024-04-08 01:14:21', '2024-04-08 01:14:38'),
(50, 'App\\Models\\User', 12, 'token', '8d4a3c3e0176e085948692990877ef4dd2f90ce66f19b9f8cd4dbf98223fa007', '[\"*\"]', '2024-04-08 01:15:51', NULL, '2024-04-08 01:14:47', '2024-04-08 01:15:51'),
(51, 'App\\Models\\User', 12, 'token', '0fc7c75650309f2e329eea8deb2e49128df95b71e56ddbc9fab9e98d93e55ed3', '[\"*\"]', '2024-04-08 01:19:45', NULL, '2024-04-08 01:16:01', '2024-04-08 01:19:45'),
(52, 'App\\Models\\User', 12, 'token', 'f2b9d8ca0b933d2866f175a4d682bd159458b93cbacc5e0e9e1d8d7bb5b398ed', '[\"*\"]', '2024-04-08 01:20:49', NULL, '2024-04-08 01:19:51', '2024-04-08 01:20:49'),
(53, 'App\\Models\\User', 12, 'token', 'f6c627a7d1b17d4b939bec056bea93dfb8a09c536096a0a1e644b58d9069fc89', '[\"*\"]', '2024-04-08 01:34:59', NULL, '2024-04-08 01:21:08', '2024-04-08 01:34:59'),
(54, 'App\\Models\\User', 12, 'token', 'b4690f72897fbda365098472f44bebf838dbb3ac04f47ea63b20e07884cdb33e', '[\"*\"]', '2024-04-08 01:36:17', NULL, '2024-04-08 01:35:14', '2024-04-08 01:36:17'),
(55, 'App\\Models\\User', 12, 'token', '1ec1322de93e1c89dbda67912db5ed430794eb303cea861dd3a9d91793cc0497', '[\"*\"]', '2024-04-08 01:42:19', NULL, '2024-04-08 01:36:27', '2024-04-08 01:42:19'),
(56, 'App\\Models\\User', 12, 'token', 'f8f17f68ba9108a07d844cc353dfb80206d37e5f5ef68e705fadfcf930fd10cc', '[\"*\"]', '2024-04-08 01:42:45', NULL, '2024-04-08 01:42:29', '2024-04-08 01:42:45'),
(57, 'App\\Models\\User', 12, 'token', '305bdaaffca075dedb7ff8ac28058ef6850a2f470ca69f89a4ec09f281a6a94a', '[\"*\"]', '2024-04-08 01:43:24', NULL, '2024-04-08 01:42:56', '2024-04-08 01:43:24'),
(58, 'App\\Models\\User', 13, 'token', '64cd66a06cef989c5e0a6fc8fdef56ec85fce27d95b461485d1dc30580f2f553', '[\"*\"]', '2024-04-08 02:34:09', NULL, '2024-04-08 02:33:55', '2024-04-08 02:34:09'),
(59, 'App\\Models\\User', 13, 'token', '1b53463bdc09a3d6db3e8a88c88fd8e06cde8c0fda94665832c513e29f015390', '[\"*\"]', '2024-04-08 19:59:07', NULL, '2024-04-08 19:58:33', '2024-04-08 19:59:07'),
(60, 'App\\Models\\User', 13, 'token', '20fd4d730809a7c305f92d74626b49e25385f48f1a6db8a4a0b7f8a9c7099ad1', '[\"*\"]', '2024-04-08 20:05:40', NULL, '2024-04-08 20:05:30', '2024-04-08 20:05:40'),
(61, 'App\\Models\\User', 13, 'token', '13756222864f4e1023d4508a619620e9e3b06bacd8705c38c8c896f92469c96c', '[\"*\"]', '2024-04-08 22:10:35', NULL, '2024-04-08 20:08:42', '2024-04-08 22:10:35'),
(62, 'App\\Models\\User', 13, 'token', '12750c91f0a3f667a3d57b27fa6490ac42874935fb903689afd6775cdcf3ee7a', '[\"*\"]', '2024-04-08 23:20:47', NULL, '2024-04-08 22:15:21', '2024-04-08 23:20:47'),
(63, 'App\\Models\\User', 3, 'token', '6184976412f94ebc73b0d26cfa6fc5b47e13dff4e493342328173eda560e826b', '[\"*\"]', '2024-04-09 00:48:55', NULL, '2024-04-08 23:21:36', '2024-04-09 00:48:55'),
(64, 'App\\Models\\User', 3, 'token', '3ad3031d791f1d498973e6b093a4c356635c6ef6b41695971779673b6cbced10', '[\"*\"]', '2024-04-09 01:04:07', NULL, '2024-04-09 00:49:00', '2024-04-09 01:04:07'),
(65, 'App\\Models\\User', 3, 'token', 'fd42cd887a501f552583ba5673b34056f429183289bb2c4a79a198d0efafbdf0', '[\"*\"]', '2024-04-09 01:09:57', NULL, '2024-04-09 01:04:20', '2024-04-09 01:09:57'),
(66, 'App\\Models\\User', 3, 'token', '6c0024e73f1c7516e5515888f41bafbd9c5b1fdb4d8e425619d77fe40319c614', '[\"*\"]', '2024-04-09 21:25:01', NULL, '2024-04-09 18:54:09', '2024-04-09 21:25:01'),
(67, 'App\\Models\\User', 3, 'token', '7d162d49c326b54ca6512fd2e9e46341ad9fd13dbd25b9e6f4b4b95f46abd2ec', '[\"*\"]', '2024-04-09 22:38:56', NULL, '2024-04-09 21:36:11', '2024-04-09 22:38:56'),
(68, 'App\\Models\\User', 3, 'token', 'bcfcbfba3e0df4149b45701822150680c8a38769b84910f4dae2f527c9bb1991', '[\"*\"]', '2024-04-09 23:05:32', NULL, '2024-04-09 22:39:02', '2024-04-09 23:05:32'),
(69, 'App\\Models\\User', 12, 'token', '7b7d856e4239a7fd5894ce7fc36ea18d8f97ec7e19178deb8710fbe4901a2171', '[\"*\"]', '2024-04-09 23:57:47', NULL, '2024-04-09 23:05:48', '2024-04-09 23:57:47'),
(70, 'App\\Models\\User', 12, 'token', '7198571cff671f386e27da73840e1fc65ffa0fe8fe419a914b3df5bcb980fc32', '[\"*\"]', '2024-04-10 00:16:05', NULL, '2024-04-09 23:58:01', '2024-04-10 00:16:05'),
(71, 'App\\Models\\User', 3, 'token', '83b1f8bb839250b539fb0d80de25a923c4a885d3025917a985bfe5f12850dce7', '[\"*\"]', '2024-04-10 00:19:39', NULL, '2024-04-10 00:16:27', '2024-04-10 00:19:39'),
(72, 'App\\Models\\User', 11, 'token', '620a08c941b1bc543822352d50930e0664b9f87b77e3f955e45fc05927da9818', '[\"*\"]', '2024-04-10 22:57:47', NULL, '2024-04-10 00:20:15', '2024-04-10 22:57:47'),
(73, 'App\\Models\\User', 11, 'token', '20252ac8a01520a972cea2a99b34db24879a9d3695cdf2afe58a45b62e222b57', '[\"*\"]', '2024-04-10 22:58:38', NULL, '2024-04-10 22:58:19', '2024-04-10 22:58:38'),
(74, 'App\\Models\\User', 11, 'token', '0f8b4bbaf26f037580f2399fa3caa194734f48d81b85c83df496634b00276079', '[\"*\"]', '2024-04-10 23:39:46', NULL, '2024-04-10 22:58:55', '2024-04-10 23:39:46'),
(75, 'App\\Models\\User', 11, 'token', '707091b2b6208319cf35e29ae1312952994375b98e435765976bf9f4b2e562f9', '[\"*\"]', '2024-04-10 23:40:00', NULL, '2024-04-10 23:39:55', '2024-04-10 23:40:00'),
(76, 'App\\Models\\User', 12, 'token', '8a62e0953455b5ab94b7de96a2e272171b72e78c028c93d5d048ca34480f9c89', '[\"*\"]', '2024-04-10 23:40:16', NULL, '2024-04-10 23:40:14', '2024-04-10 23:40:16'),
(77, 'App\\Models\\User', 14, 'token', '57338ace2fe893a8abaa56670e0ead83d9e4862fb082478938c8c92b5ffa1a40', '[\"*\"]', '2024-04-12 00:13:51', NULL, '2024-04-12 00:08:00', '2024-04-12 00:13:51'),
(78, 'App\\Models\\User', 15, 'token', 'a21051981f0fe26804c0f1093ee8db6f77473e479865c0b47e00c0206cffec2e', '[\"*\"]', '2024-04-12 09:14:41', NULL, '2024-04-12 00:16:01', '2024-04-12 09:14:41'),
(79, 'App\\Models\\User', 16, 'token', 'fcdd533877ce91bc11455a4a6ef7575b4f35ab9ad97cff2202fa40f488795f9a', '[\"*\"]', '2024-04-12 09:25:54', NULL, '2024-04-12 09:16:54', '2024-04-12 09:25:54'),
(80, 'App\\Models\\User', 16, 'token', '1e182d949099e6a3875d5a583bc889b1897664525e676bb43b1b695aa2b3a167', '[\"*\"]', '2024-04-12 10:23:30', NULL, '2024-04-12 09:26:00', '2024-04-12 10:23:30'),
(81, 'App\\Models\\User', 11, 'token', '613b38d7dd42322fc17e97b6c698ab994874499aa5e7f9fdb6444b7a975edb1a', '[\"*\"]', '2024-04-12 11:06:38', NULL, '2024-04-12 10:23:45', '2024-04-12 11:06:38'),
(82, 'App\\Models\\User', 11, 'token', '12828671ef70c714c6d6f26fa7b5391ea66e4e17ea5d48f1cd966376fb594637', '[\"*\"]', '2024-04-16 09:57:52', NULL, '2024-04-16 09:57:10', '2024-04-16 09:57:52'),
(83, 'App\\Models\\User', 17, 'token', 'f55592cce6816808a9104e9fe7c8afe4f449ae592f60c9798782c87ec35d17a5', '[\"*\"]', '2024-04-16 10:00:37', NULL, '2024-04-16 09:58:52', '2024-04-16 10:00:37'),
(84, 'App\\Models\\User', 17, 'token', '8d786bcb81a4cf53b39a938ae9c0d6d92c224dc5efc3975e5012f8454ad24d23', '[\"*\"]', '2024-04-16 10:07:41', NULL, '2024-04-16 10:02:14', '2024-04-16 10:07:41'),
(85, 'App\\Models\\User', 17, 'token', '2aaf7f450ba5967523bd589536d300ef64a802429253d417bf6ba01ad9417e26', '[\"*\"]', '2024-04-16 10:08:38', NULL, '2024-04-16 10:07:49', '2024-04-16 10:08:38'),
(86, 'App\\Models\\User', 12, 'token', 'e3ca4f3a7a22fe54624f53f02f3216e0468a7f21c434a5a9e52e54ecd424e7d1', '[\"*\"]', '2024-04-16 10:10:01', NULL, '2024-04-16 10:08:52', '2024-04-16 10:10:01'),
(87, 'App\\Models\\User', 12, 'token', '19afac7e14c4dda8d053caff4362508c6fea3358f9290ede8b7de34b793b6ef0', '[\"*\"]', '2024-04-16 10:22:30', NULL, '2024-04-16 10:16:44', '2024-04-16 10:22:30'),
(88, 'App\\Models\\User', 18, 'token', '1a8d0d64acd4d76f4afd4f6a4dfb67272065521d60e6df1b1461b1290f805913', '[\"*\"]', '2024-04-16 11:50:48', NULL, '2024-04-16 10:31:16', '2024-04-16 11:50:48'),
(89, 'App\\Models\\User', 19, 'token', 'c4a9e18a0fb0068797a0b11d39b3d8c52e970333b70a5f8b6fd0a1368f0278b3', '[\"*\"]', '2024-04-16 11:51:46', NULL, '2024-04-16 11:51:21', '2024-04-16 11:51:46'),
(90, 'App\\Models\\User', 20, 'token', 'ff9eda421a790b894f7a3e1949e0f551f80d7291c198466e713245c9d768ccdd', '[\"*\"]', '2024-04-16 11:58:22', NULL, '2024-04-16 11:54:33', '2024-04-16 11:58:22'),
(91, 'App\\Models\\User', 18, 'token', '78ca21bf3655344154d1cfeb7feb62fcd3867fb5e9dfbfd2e26248d8df12815e', '[\"*\"]', '2024-04-16 12:16:20', NULL, '2024-04-16 11:58:30', '2024-04-16 12:16:20'),
(92, 'App\\Models\\User', 18, 'token', 'ab87335769be66a14fb0cd6947c1dec0a5b9e0c2cde13e1bd14cbe258038f4d0', '[\"*\"]', '2024-04-16 12:17:12', NULL, '2024-04-16 12:16:27', '2024-04-16 12:17:12'),
(93, 'App\\Models\\User', 18, 'token', 'ffefb06a44630f4b2d70b02fff51053e5ffd2e9bac4af10485504a07d49ecde2', '[\"*\"]', '2024-04-16 12:17:52', NULL, '2024-04-16 12:17:14', '2024-04-16 12:17:52'),
(94, 'App\\Models\\User', 18, 'token', 'fe3e3b13fbaaedd79c8198fa619c89d4f748a8522eb59e72274dc9a0bcff5fb8', '[\"*\"]', '2024-04-16 12:18:49', NULL, '2024-04-16 12:17:59', '2024-04-16 12:18:49'),
(95, 'App\\Models\\User', 18, 'token', '237d1bc63d3101b33618b0fd26d4a9d3dca643c19cedd9ac11af5cc81addea9c', '[\"*\"]', '2024-04-16 12:19:53', NULL, '2024-04-16 12:18:51', '2024-04-16 12:19:53'),
(96, 'App\\Models\\User', 18, 'token', 'ad49ffdbc56d56f7ace047a6fab77c5fbb38cca73a3eca559192ccd859a8485d', '[\"*\"]', '2024-04-16 12:20:38', NULL, '2024-04-16 12:20:01', '2024-04-16 12:20:38'),
(97, 'App\\Models\\User', 18, 'token', 'c774e1920090600243168efd176ca08f81284388f8e8fd6cf9c8c908e1175436', '[\"*\"]', '2024-04-16 12:21:46', NULL, '2024-04-16 12:20:41', '2024-04-16 12:21:46'),
(98, 'App\\Models\\User', 18, 'token', '8b8618bd99de11022956d59bf41dc11636149644cbf29594a4a76cfb084fabd6', '[\"*\"]', '2024-04-16 12:23:31', NULL, '2024-04-16 12:21:52', '2024-04-16 12:23:31'),
(99, 'App\\Models\\User', 18, 'token', '74db15e274abc3f6ace1d98b3a5afb4a9e4470c23a59cef33738249947a8b020', '[\"*\"]', '2024-04-16 12:23:39', NULL, '2024-04-16 12:23:37', '2024-04-16 12:23:39'),
(100, 'App\\Models\\User', 18, 'token', '8fde5ddeb8eb9e257d4cc6ef07ebe4f4d4f95e855aea748fb4a705598b73de70', '[\"*\"]', '2024-04-16 12:25:07', NULL, '2024-04-16 12:23:38', '2024-04-16 12:25:07'),
(101, 'App\\Models\\User', 18, 'token', 'a5cc6df37e54fb6b392f42249dcf8dd6e5c26786db9fa91622d3005a1acdee84', '[\"*\"]', '2024-04-16 12:25:14', NULL, '2024-04-16 12:25:13', '2024-04-16 12:25:14'),
(102, 'App\\Models\\User', 18, 'token', '05a5daec5dc69898f4470248193df97a2bd68dd62f01e0a73a181e4eb7ab4fdb', '[\"*\"]', '2024-04-16 12:26:01', NULL, '2024-04-16 12:25:14', '2024-04-16 12:26:01'),
(103, 'App\\Models\\User', 18, 'token', '7cdc0623b4fbd03ad8f0d2649ef037de4edae5b46b17500c4c3bb14f9393acac', '[\"*\"]', '2024-04-16 12:26:27', NULL, '2024-04-16 12:26:25', '2024-04-16 12:26:27'),
(104, 'App\\Models\\User', 18, 'token', 'e973e57f166ee665bc4dd8c6c03887bc281dabf40a47c21eca0966faa9a2f6dd', '[\"*\"]', '2024-04-16 12:30:33', NULL, '2024-04-16 12:26:26', '2024-04-16 12:30:33'),
(105, 'App\\Models\\User', 18, 'token', '04f57207ad1728151efa8bbd78cfb1ddc428a42e2432a630d7b6f3cec8a6db97', '[\"*\"]', '2024-04-16 12:30:50', NULL, '2024-04-16 12:30:48', '2024-04-16 12:30:50'),
(106, 'App\\Models\\User', 18, 'token', '6239a9e58ac4cacd03bfb456b2fbf036889acef4403ace87c46c1a46f81b6299', '[\"*\"]', '2024-04-16 12:31:31', NULL, '2024-04-16 12:30:48', '2024-04-16 12:31:31'),
(107, 'App\\Models\\User', 18, 'token', '75a4978cfdc762aeb1cb25b6712806110e0c9bdf018963b90861c89a78c7c626', '[\"*\"]', '2024-04-16 12:31:50', NULL, '2024-04-16 12:31:48', '2024-04-16 12:31:50'),
(108, 'App\\Models\\User', 18, 'token', 'd27f094029a47accb2f4583370ccf3ca33a1d86a088d70a3619261f922e08de8', '[\"*\"]', '2024-04-16 12:32:41', NULL, '2024-04-16 12:31:49', '2024-04-16 12:32:41'),
(109, 'App\\Models\\User', 18, 'token', '2e88e942be1b70014bce0119d365e244b80abb436a3b7e2bc0aa81124382de51', '[\"*\"]', '2024-04-16 12:32:50', NULL, '2024-04-16 12:32:47', '2024-04-16 12:32:50'),
(110, 'App\\Models\\User', 18, 'token', '3c7574bcb38ceeb720976038176623746600e2c7fe3d23fc6bd52562ea9e8704', '[\"*\"]', '2024-04-16 12:34:47', NULL, '2024-04-16 12:32:49', '2024-04-16 12:34:47'),
(111, 'App\\Models\\User', 18, 'token', '786f2386dfd33e3f1777d115f441130751662c4e4fe7f3695aaff2089eede914', '[\"*\"]', '2024-04-16 12:34:56', NULL, '2024-04-16 12:34:55', '2024-04-16 12:34:56'),
(112, 'App\\Models\\User', 18, 'token', '8e9d2e9f181aa3dc9e0715f045ac1bfce4ce2863d0ce87f83954ce79a470cc41', '[\"*\"]', '2024-04-16 12:35:47', NULL, '2024-04-16 12:34:55', '2024-04-16 12:35:47'),
(113, 'App\\Models\\User', 18, 'token', '7171d72fbf25d83a324c72c1a4a370e20554340dd6524a758bc04256f891572d', '[\"*\"]', '2024-04-16 12:36:31', NULL, '2024-04-16 12:35:54', '2024-04-16 12:36:31'),
(114, 'App\\Models\\User', 18, 'token', '9bb35692b41e2fa8dbdc79a8766b0ac2957e08883ac8e47249e188a15019fc9c', '[\"*\"]', '2024-04-16 12:37:53', NULL, '2024-04-16 12:36:37', '2024-04-16 12:37:53'),
(115, 'App\\Models\\User', 18, 'token', '8dcd546add635e2dd3a614b580d86d3af0952cf4677cdf812db93c19efe26cff', '[\"*\"]', '2024-04-16 12:40:16', NULL, '2024-04-16 12:37:59', '2024-04-16 12:40:16'),
(116, 'App\\Models\\User', 18, 'token', '0dad90d402d5751d8acbae9e2a19a6b500b5579e4e2f8e64c648df7ffccbc651', '[\"*\"]', '2024-04-16 12:41:53', NULL, '2024-04-16 12:40:22', '2024-04-16 12:41:53'),
(117, 'App\\Models\\User', 18, 'token', '5b737d2104b700a822aa6283592d654b50e0adabdfa5621f3a2e8bb4a0bb7286', '[\"*\"]', '2024-04-16 12:52:42', NULL, '2024-04-16 12:52:17', '2024-04-16 12:52:42'),
(118, 'App\\Models\\User', 18, 'token', '600d377518d8276ce4ecfbc246ef39151e9b8dfec3b6ebc9ab8027a31f5e2592', '[\"*\"]', '2024-04-16 12:55:10', NULL, '2024-04-16 12:55:00', '2024-04-16 12:55:10'),
(119, 'App\\Models\\User', 18, 'token', '90a32a80463459a742ce303d31e67e4fb6de92a5df56489247bbe937cbc55846', '[\"*\"]', '2024-04-16 13:03:03', NULL, '2024-04-16 13:02:57', '2024-04-16 13:03:03'),
(120, 'App\\Models\\User', 18, 'token', '04c1b0e6fe3f663e090c863587de68d03ce6e623f761d951d93de22ae606aee4', '[\"*\"]', '2024-04-16 13:06:03', NULL, '2024-04-16 13:05:58', '2024-04-16 13:06:03'),
(121, 'App\\Models\\User', 18, 'token', '8dfa1c2e96459cc08fde258fc2d1c977e15090e71439e4ee587ad5143f71b5aa', '[\"*\"]', '2024-04-16 13:08:58', NULL, '2024-04-16 13:08:01', '2024-04-16 13:08:58'),
(122, 'App\\Models\\User', 18, 'token', '985b21841a612c9e01e041b7ef96f687dd785d0520128b4e0aa65b06ed01a2f5', '[\"*\"]', '2024-04-16 13:10:03', NULL, '2024-04-16 13:09:05', '2024-04-16 13:10:03'),
(123, 'App\\Models\\User', 18, 'token', '4dd7ef72f1a221b800b7f37e38350c4a3f714b2d03f4a5aa6c87537b70cfcc7a', '[\"*\"]', '2024-04-16 13:10:43', NULL, '2024-04-16 13:10:09', '2024-04-16 13:10:43'),
(124, 'App\\Models\\User', 18, 'token', '7cee6004acb1ec3ccfe7013cc357a3807b9b2657e8718cc65cbae176577be94c', '[\"*\"]', '2024-04-16 13:11:53', NULL, '2024-04-16 13:10:49', '2024-04-16 13:11:53'),
(125, 'App\\Models\\User', 18, 'token', '04893faec2079e0de8c096d33a4dfab48cec2aadf22ceef8bc7bb30e3bbb5aba', '[\"*\"]', '2024-04-16 13:12:05', NULL, '2024-04-16 13:11:59', '2024-04-16 13:12:05'),
(126, 'App\\Models\\User', 18, 'token', 'aa47d267ed590c417e512a6b8e0170994597a12824dc1a40053bc766d35e4c8f', '[\"*\"]', '2024-04-16 13:15:12', NULL, '2024-04-16 13:15:05', '2024-04-16 13:15:12'),
(127, 'App\\Models\\User', 21, 'token', 'b00d1bc35ce0f391d8266b58818f8827fa8d33ecc28d22fa8022c372b715dc9b', '[\"*\"]', '2024-04-16 14:45:48', NULL, '2024-04-16 13:23:07', '2024-04-16 14:45:48'),
(128, 'App\\Models\\User', 21, 'token', '5e5a53cea8fb49319d6571f9ce32ab902bf2ef4d19b333937262deb4df2a931c', '[\"*\"]', '2024-04-23 12:06:52', NULL, '2024-04-23 12:06:31', '2024-04-23 12:06:52'),
(129, 'App\\Models\\User', 21, 'token', '4afb55e2358083d76fc9ba463ec51a1c45f69d143428f944ff04eae8c1c92c1e', '[\"*\"]', '2024-04-23 12:15:23', NULL, '2024-04-23 12:12:53', '2024-04-23 12:15:23'),
(130, 'App\\Models\\User', 21, 'token', '6f1b8c718fc72dc86523ad8a1fb863bf9a8baf82f1c7b216f5786e7496690595', '[\"*\"]', '2024-04-23 12:21:04', NULL, '2024-04-23 12:18:18', '2024-04-23 12:21:04'),
(131, 'App\\Models\\User', 21, 'token', '2dbabb7af6658e15820bdcc6c8e26a88dd1b1b1fc2b32f59eff8202ad0efcacf', '[\"*\"]', '2024-04-23 12:28:26', NULL, '2024-04-23 12:22:47', '2024-04-23 12:28:26'),
(132, 'App\\Models\\User', 21, 'token', 'c44d3732924138a9313bc748cb76b36a5db17c67e9f75820a5d9ab5bf6970a01', '[\"*\"]', '2024-04-23 12:34:18', NULL, '2024-04-23 12:29:26', '2024-04-23 12:34:18'),
(133, 'App\\Models\\User', 21, 'token', '8c0acb5c2fac0cee8843fb7630cfa306bc01383063087a27450a6136f8a42e21', '[\"*\"]', '2024-04-23 12:50:05', NULL, '2024-04-23 12:38:06', '2024-04-23 12:50:05'),
(134, 'App\\Models\\User', 3, 'token', '0c1bbeae9fb473b5c2c7596d6d37be4868c79e03ab08e6ee0e9f7bb223e0de1d', '[\"*\"]', '2024-04-23 13:44:45', NULL, '2024-04-23 12:50:21', '2024-04-23 13:44:45'),
(135, 'App\\Models\\User', 3, 'token', '05d42d68168284e5e509b5d9c0ba81dd13f422309455fa0ce12d460fc1aef0f1', '[\"*\"]', '2024-04-23 14:19:33', NULL, '2024-04-23 13:49:32', '2024-04-23 14:19:33'),
(136, 'App\\Models\\User', 3, 'token', 'cf06bab9121a0e67d16e725e157d08757485782fef7c900100d178fec8579b13', '[\"*\"]', '2024-04-23 14:52:55', NULL, '2024-04-23 14:19:42', '2024-04-23 14:52:55'),
(137, 'App\\Models\\User', 3, 'token', '7b68b1032e16ef49c61694e2b2ac1c41d0e90b2241fcda7e893ddbae497094d3', '[\"*\"]', '2024-04-23 17:00:37', NULL, '2024-04-23 16:08:22', '2024-04-23 17:00:37'),
(138, 'App\\Models\\User', 3, 'token', '960d5f10ce524ea10324a57abe417923e3c74615396349317cf4f424a1b7a4b1', '[\"*\"]', '2024-04-25 09:27:34', NULL, '2024-04-25 09:26:54', '2024-04-25 09:27:34'),
(139, 'App\\Models\\User', 3, 'token', '2c99218c3eab0f05ae782a43824897c87ad1ada45a6c7fa58dd3e6372e9ba7b1', '[\"*\"]', '2024-04-25 09:28:27', NULL, '2024-04-25 09:27:41', '2024-04-25 09:28:27'),
(140, 'App\\Models\\User', 3, 'token', 'e8d182589acec937b8faca1e83d9c182e988d0f61bf146e60bbb82e9ddfd23ad', '[\"*\"]', '2024-04-25 10:21:15', NULL, '2024-04-25 09:28:33', '2024-04-25 10:21:15'),
(141, 'App\\Models\\User', 3, 'token', '37738380f76af62f175a95132871d096eec5db2f4aa076bff9e9f648cabefddc', '[\"*\"]', '2024-04-25 11:13:39', NULL, '2024-04-25 10:21:21', '2024-04-25 11:13:39');

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `NomProfile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `created_at`, `updated_at`, `NomProfile`) VALUES
(1, '2024-04-06 13:49:07', '2024-04-06 13:49:07', 'particulier'),
(2, '2024-04-06 13:49:07', '2024-04-06 13:49:07', 'entreprise'),
(3, '2024-04-06 13:49:07', '2024-04-06 13:49:07', 'auto-entrepreneur');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `libelle`) VALUES
(1, NULL, NULL, 'admin'),
(2, NULL, NULL, 'utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `tarif` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` mediumtext DEFAULT NULL,
  `statut` varchar(255) NOT NULL,
  `nomPrestataire` varchar(255) DEFAULT NULL,
  `telephonePresta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `titre`, `description`, `tarif`, `date`, `lieu`, `user_id`, `created_at`, `updated_at`, `categorie_id`, `photo`, `statut`, `nomPrestataire`, `telephonePresta`) VALUES
(1, 'je suis dev react', 'je sias coder en reactjs et js', 12000.00, '2024-08-15', 'dakar', 3, '2024-04-10 22:25:04', '2024-04-10 22:25:04', 1, 'dev.jpeg', '1', 'papa', '774327640'),
(2, 'je suis dev laravel', 'je sias coder en php et laravel mysql etc', 12000.00, '2024-08-15', 'dakar', 9, '2024-04-10 22:46:27', '2024-04-10 22:46:27', 1, 'dev.jpeg', '1', 'psycho pass', '77777777'),
(3, 'je suis dev full stack laravel', 'je suis bon serieux et tres attentif', 120000.00, '2024-06-19', 'pikine', 11, '2024-04-10 23:36:54', '2024-04-10 23:36:54', 1, 'Untitled.pdf', '1', 'butcher', '555555555'),
(4, 'je suis expert wordpress', 'je cree votre site en ligne', 150000.00, '2024-05-31', 'sahm', 12, '2024-04-10 23:49:33', '2024-04-10 23:49:33', 1, 'Untitled.pdf', '1', 'snowfall', '21212121333'),
(5, 'je suis chauffeur', 'j\'aime conduire', 150000.00, '2024-08-15', 'pikine', 14, '2024-04-12 00:10:14', '2024-04-12 00:10:14', 2, 'Untitled.pdf', '1', 'kendrick', '76543218432'),
(6, 'developpeur java springboot', 'je cree des application web et desktop en utilisant le framework de java spring boot', 150000.00, '2024-07-24', 'pikine', 16, '2024-04-12 09:25:17', '2024-04-12 09:25:17', 1, 'PAPA BADARA NDIAYE (1).pdf', '1', 'itachi ushiha', '76543218765'),
(7, 'community manager', 'responsable reseaux sociaux instagram youtube twitter etc', 50000.00, '2025-01-17', 'ouakam', 3, '2024-04-23 14:05:20', '2024-04-23 14:05:20', 4, 'blog-1.jpg', '1', 'papa', '774327640');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `idProfile` bigint(20) UNSIGNED DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `tarif` int(11) DEFAULT NULL,
  `solde` int(11) DEFAULT NULL,
  `cv` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `adresse`, `sexe`, `idProfile`, `telephone`, `tarif`, `solde`, `cv`) VALUES
(3, 'papa', 'pndiaye999@gmail.com', NULL, '$2y$12$7fRgAGCALQ2yUBfDeJ21ieuumRR6HD2QBYTKYtH6pwiRP7sgUpEGi', NULL, '2024-04-06 13:58:48', '2024-04-06 13:58:48', 2, 'dakar', 'Homme', 1, '774327640', NULL, NULL, NULL),
(9, 'psycho pass', 'mapaye999@gmail.com', NULL, '$2y$12$w5/SCFZdKOUPy02Zi9NFdeMVii04IBmp9vC7R8lJDrC54kc3Lfwvy', NULL, '2024-04-07 18:51:49', '2024-04-07 18:51:49', 2, 'dakar', 'femme', 2, '2121212133', NULL, NULL, NULL),
(10, 'psycho pass', 'geloko1405@irnini.com', NULL, '$2y$12$meWjeTmVTOnOvF1Kg1CEv.b1/M9QE9kDXopFu.GmQGuysgd8.dxLS', NULL, '2024-04-07 18:52:48', '2024-04-07 18:52:48', 2, 'thies', 'femme', 2, '776543960', NULL, NULL, NULL),
(11, 'butcher', 'gojo@gmail.com', NULL, '$2y$12$GnThuh/zKXBBD3Dn1GyCVulfcqt91AuI7/VAZxuPOhSbBMS3FK3sK', NULL, '2024-04-07 19:09:41', '2024-04-10 00:20:59', 2, 'thiaroye', 'homme', 2, '555555555', 10000, NULL, '[[]]'),
(12, 'snowfall', 'karega6390@hisotyr.com', NULL, '$2y$12$KjF/Nz2fBdhMhHhInSqBueXRQC9x/BNebnxLSpIfsqLYpdtP3HENC', NULL, '2024-04-07 19:11:26', '2024-04-07 19:11:26', 2, 'dakar', 'homme', 2, '21212121333', NULL, NULL, NULL),
(13, 'badara', 'pocifob335@ekposta.com', NULL, '$2y$12$b45LQvBe0mdXkWxrYJynieU3X2ak6DepdXOWblL0RzjP1dzCL6xfa', NULL, '2024-04-08 01:56:32', '2024-04-08 21:28:22', 2, 'thiaroye', 'homme', 1, '7654321890', 12345, NULL, '[[]]'),
(14, 'kendrick', 'yejiko3202@rartg.com', NULL, '$2y$12$lOOf/81p7URYHlqoxjh5JenYMwOlf8G16wOTfWNlj0r84VrJvPdwi', NULL, '2024-04-12 00:07:22', '2024-04-12 00:09:06', 2, 'thiaroye', 'homme', 1, '76543218432', 150000, NULL, '[[]]'),
(15, 'Pedro Duar', 'calom38856@iliken.com', NULL, '$2y$12$u0Sruyo1qsxZ3Z1DNl7ah.4PH3YK6tEgIh10/Dx24rrB7PYUDEWSO', NULL, '2024-04-12 00:15:20', '2024-04-12 00:15:20', 2, 'thies', 'homme', 3, '7654321844', NULL, NULL, NULL),
(16, 'itachi ushiha', 'manan28052@rartg.com', NULL, '$2y$12$NBGd2EaBttKkH.FBHBbpQ.YwBMiQWOvtg8jrdwlFAnyE0iTSpL.De', NULL, '2024-04-12 09:16:41', '2024-04-12 09:16:41', 2, 'thies', 'homme', 2, '76543218765', NULL, NULL, NULL),
(17, 'borido', 'borido7679@kravify.com', NULL, '$2y$12$aSSs1l.Ln0F/Mf67adXDReQ9ILfHjKSAND.erPMQAPUBqMv3w0DG2', NULL, '2024-04-16 09:58:23', '2024-04-16 09:58:23', 2, 'thiaroye', 'homme', 2, '765432109', NULL, NULL, NULL),
(18, 'artha', 'adama_aidara85@hotmail.com', NULL, '$2y$12$mmoY2yfnMYSkUbJL7xKwAekueplspr5TtyBQMzOmF0Ds4.L0byFSy', NULL, '2024-04-16 10:23:47', '2024-04-16 10:23:47', 2, 'derkle', 'femme', 1, '776650736', NULL, NULL, NULL),
(19, 'barca', 'ciheli7640@etopys.com', NULL, '$2y$12$YyihkPoCIuf4az6EUaCFnO.j34Yxh6ema5E0cZ7wk.ud4i197dvBe', NULL, '2024-04-16 11:47:26', '2024-04-16 11:47:26', 2, 'thies', 'homme', 2, '2340987653', NULL, NULL, NULL),
(20, 'pedri', 'cajijip230@rartg.com', NULL, '$2y$12$7Z8lEZOqnb7iTGZX2dvPrOEzzTucWJeZ5LeqBZyD/u.MmR.isg25y', NULL, '2024-04-16 11:53:57', '2024-04-16 11:53:57', 2, 'thies', 'homme', 3, '786543078', NULL, NULL, NULL),
(21, 'heloko', 'helokol412@etopys.com', NULL, '$2y$12$0eu7zRmMTQJcKYPmTbY1FOwjmMHmakimhDGb2BSduSpv59uSDJg5.', NULL, '2024-04-16 13:22:08', '2024-04-16 13:22:08', 2, 'thies', 'homme', 2, '338765423', NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avis_user_id_foreign` (`user_id`),
  ADD KEY `avis_service_id_foreign` (`service_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `demandes_user_id_foreign` (`user_id`),
  ADD KEY `demandes_categorie_id_foreign` (`categorie_id`);

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
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_user_id_foreign` (`user_id`),
  ADD KEY `services_categorie_id_foreign` (`categorie_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_idprofile_foreign` (`idProfile`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `avis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `demandes`
--
ALTER TABLE `demandes`
  ADD CONSTRAINT `demandes_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `demandes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_idprofile_foreign` FOREIGN KEY (`idProfile`) REFERENCES `profile` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
