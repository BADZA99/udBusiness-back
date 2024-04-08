-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 09 avr. 2024 à 01:33
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

-- --------------------------------------------------------

--
-- Structure de la table `demandes`
--

CREATE TABLE `demandes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `statut` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_limite` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `photo` mediumtext DEFAULT NULL
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
(20, '2024_04_06_134741_add_tarif_cv_solde_to_users_table', 11);

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
(63, 'App\\Models\\User', 3, 'token', '6184976412f94ebc73b0d26cfa6fc5b47e13dff4e493342328173eda560e826b', '[\"*\"]', '2024-04-08 23:21:38', NULL, '2024-04-08 23:21:36', '2024-04-08 23:21:38');

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
  `photo` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 'psycho pass', 'grenonnobreutri-7224@yopmail.com', NULL, '$2y$12$w5/SCFZdKOUPy02Zi9NFdeMVii04IBmp9vC7R8lJDrC54kc3Lfwvy', NULL, '2024-04-07 18:51:49', '2024-04-07 18:51:49', 2, 'dakar', 'femme', 2, '2121212133', NULL, NULL, NULL),
(10, 'psycho pass', 'geloko1405@irnini.com', NULL, '$2y$12$meWjeTmVTOnOvF1Kg1CEv.b1/M9QE9kDXopFu.GmQGuysgd8.dxLS', NULL, '2024-04-07 18:52:48', '2024-04-07 18:52:48', 2, 'thies', 'femme', 2, '776543960', NULL, NULL, NULL),
(11, 'the boys', 'gojo@gmail.com', NULL, '$2y$12$GnThuh/zKXBBD3Dn1GyCVulfcqt91AuI7/VAZxuPOhSbBMS3FK3sK', NULL, '2024-04-07 19:09:41', '2024-04-07 19:09:41', 2, 'dakar', 'homme', 2, '222222222', NULL, NULL, NULL),
(12, 'snowfall', 'karega6390@hisotyr.com', NULL, '$2y$12$KjF/Nz2fBdhMhHhInSqBueXRQC9x/BNebnxLSpIfsqLYpdtP3HENC', NULL, '2024-04-07 19:11:26', '2024-04-07 19:11:26', 2, 'dakar', 'homme', 2, '21212121333', NULL, NULL, NULL),
(13, 'badara', 'pocifob335@ekposta.com', NULL, '$2y$12$b45LQvBe0mdXkWxrYJynieU3X2ak6DepdXOWblL0RzjP1dzCL6xfa', NULL, '2024-04-08 01:56:32', '2024-04-08 21:28:22', 2, 'thiaroye', 'homme', 1, '7654321890', 12345, NULL, '[[]]');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demandes`
--
ALTER TABLE `demandes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
