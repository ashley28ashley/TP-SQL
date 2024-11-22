-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 12:28
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL AUTO_INCREMENT,
  `id_panier` int DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `total_commande` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_panier` (`id_panier`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_panier`, `date_commande`, `total_commande`) VALUES
(1, 1, '1975-06-19', 397.18),
(2, 2, '2012-05-23', 300.56),
(3, 3, '1974-09-14', 180.98),
(4, 4, '1989-05-07', 291.46),
(5, 5, '2023-01-08', 469.45),
(6, 6, '2002-09-16', 135.09),
(7, 7, '1975-01-15', 453.41),
(8, 8, '1996-11-09', 65.08),
(9, 9, '1980-06-11', 436.07),
(10, 10, '1978-09-01', 209.73),
(11, 11, '2015-04-05', 279.17),
(12, 12, '2012-07-08', 94.28),
(13, 13, '2017-06-19', 438.17),
(14, 14, '2015-11-09', 344.95),
(15, 15, '1994-07-10', 473.97),
(16, 16, '1986-06-08', 370.22),
(17, 17, '1994-07-24', 61.57),
(18, 18, '2004-03-30', 390.64),
(19, 19, '1976-10-08', 229.51),
(20, 20, '1999-07-26', 486.76),
(21, 21, '1983-01-22', 34.15),
(22, 22, '1982-02-14', 216.19),
(23, 23, '1999-01-16', 134.90),
(24, 24, '1995-04-05', 47.39),
(25, 25, '1973-10-04', 395.34),
(26, 26, '1982-07-26', 233.20),
(27, 27, '2005-10-29', 149.91),
(28, 28, '2023-11-23', 78.95),
(29, 29, '1985-12-18', 302.15),
(30, 30, '1976-12-26', 458.88),
(31, 31, '2004-12-10', 329.00),
(32, 32, '2004-08-30', 49.71),
(33, 33, '1976-06-22', 333.17),
(34, 34, '2003-05-29', 176.44),
(35, 35, '2010-10-18', 490.20),
(36, 36, '1975-08-24', 459.06),
(37, 37, '2009-11-07', 345.99),
(38, 38, '1972-05-23', 171.61),
(39, 39, '2010-03-07', 49.03),
(40, 40, '1986-04-23', 230.18);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` int NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int DEFAULT NULL,
  `id_commande` int DEFAULT NULL,
  PRIMARY KEY (`id_panier`),
  KEY `id_utilisateur` (`id_utilisateur`),
  KEY `id_commande` (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `id_utilisateur`, `id_commande`) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL),
(11, 1, NULL),
(12, 2, NULL),
(13, 3, NULL),
(14, 4, NULL),
(15, 5, NULL),
(16, 6, NULL),
(17, 7, NULL),
(18, 8, NULL),
(19, 9, NULL),
(20, 10, NULL),
(21, 1, NULL),
(22, 2, NULL),
(23, 3, NULL),
(24, 4, NULL),
(25, 5, NULL),
(26, 6, NULL),
(27, 7, NULL),
(28, 8, NULL),
(29, 9, NULL),
(30, 10, NULL),
(31, 1, NULL),
(32, 2, NULL),
(33, 3, NULL),
(34, 4, NULL),
(35, 5, NULL),
(36, 6, NULL),
(37, 7, NULL),
(38, 8, NULL),
(39, 9, NULL),
(40, 10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `panier_produit`
--

DROP TABLE IF EXISTS `panier_produit`;
CREATE TABLE IF NOT EXISTS `panier_produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produit` int DEFAULT NULL,
  `id_panier` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produit` (`id_produit`),
  KEY `id_panier` (`id_panier`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `panier_produit`
--

INSERT INTO `panier_produit` (`id`, `id_produit`, `id_panier`, `quantite`) VALUES
(1, 6, 1, 1),
(2, 10, 1, 6),
(3, 19, 2, 8),
(4, 7, 2, 7),
(5, 6, 2, 2),
(6, 17, 2, 3),
(7, 16, 3, 5),
(8, 3, 3, 10),
(9, 13, 4, 2),
(10, 15, 5, 5),
(11, 2, 5, 2),
(12, 13, 6, 5),
(13, 6, 6, 10),
(14, 1, 6, 8),
(15, 17, 7, 5),
(16, 18, 7, 4),
(17, 13, 7, 2),
(18, 15, 8, 10),
(19, 2, 8, 1),
(20, 2, 8, 1),
(21, 17, 9, 2),
(22, 8, 9, 7),
(23, 12, 9, 6),
(24, 19, 9, 5),
(25, 6, 10, 6),
(26, 5, 11, 2),
(27, 15, 11, 5),
(28, 16, 11, 10),
(29, 16, 12, 6),
(30, 19, 12, 1),
(31, 9, 12, 5),
(32, 20, 13, 2),
(33, 4, 13, 1),
(34, 20, 14, 8),
(35, 14, 14, 6),
(36, 6, 14, 3),
(37, 20, 14, 1),
(38, 17, 15, 9),
(39, 10, 15, 5),
(40, 3, 15, 10),
(41, 10, 16, 10),
(42, 20, 16, 6),
(43, 8, 16, 4),
(44, 17, 17, 5),
(45, 16, 18, 6),
(46, 6, 18, 10),
(47, 4, 19, 4),
(48, 11, 20, 8),
(49, 7, 21, 1),
(50, 19, 21, 10),
(51, 17, 21, 6),
(52, 10, 22, 3),
(53, 14, 22, 9),
(54, 3, 23, 5),
(55, 18, 23, 2),
(56, 13, 23, 5),
(57, 1, 24, 2),
(58, 9, 25, 8),
(59, 7, 25, 6),
(60, 12, 26, 2),
(61, 3, 26, 10),
(62, 5, 26, 10),
(63, 20, 26, 5),
(64, 2, 26, 4),
(65, 1, 27, 4),
(66, 15, 27, 4),
(67, 15, 28, 5),
(68, 9, 28, 5),
(69, 14, 29, 7),
(70, 18, 29, 7),
(71, 9, 30, 9),
(72, 5, 30, 6),
(73, 1, 31, 7),
(74, 12, 31, 3),
(75, 13, 31, 6),
(76, 12, 32, 3),
(77, 11, 32, 7),
(78, 13, 32, 10),
(79, 19, 33, 9),
(80, 4, 33, 5),
(81, 18, 33, 4),
(82, 19, 34, 4),
(83, 12, 35, 2),
(84, 19, 35, 2),
(85, 12, 35, 6),
(86, 14, 35, 2),
(87, 3, 36, 2),
(88, 2, 36, 2),
(89, 3, 36, 8),
(90, 19, 37, 9),
(91, 2, 38, 7),
(92, 9, 38, 7),
(93, 3, 39, 9),
(94, 9, 39, 10),
(95, 17, 40, 8),
(96, 6, 40, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(100) DEFAULT NULL,
  `description` text,
  `prix` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom_produit`, `description`, `prix`, `stock`) VALUES
(1, 'sequi', 'Nesciunt nam ab pariatur numquam neque dolor.', 31.83, 68),
(2, 'mollitia', 'Aut tenetur dolor consequuntur est et.', 99.62, 48),
(3, 'sed', 'Laboriosam recusandae veritatis beatae vel atque.', 58.92, 36),
(4, 'nihil', 'Amet ad ut eius et sint suscipit.', 61.88, 93),
(5, 'dignissimos', 'Aut consequatur tenetur autem veritatis est voluptas.', 81.83, 66),
(6, 'non', 'Minus ut reprehenderit quo numquam.', 35.74, 75),
(7, 'beatae', 'Deleniti eligendi nam vitae odit delectus.', 46.57, 5),
(8, 'odio', 'Est non omnis ipsa.', 13.63, 7),
(9, 'temporibus', 'Sit aut tempora animi et sed ut.', 78.95, 39),
(10, 'nobis', 'Totam dolores atque cupiditate maxime amet qui voluptates.', 69.62, 28),
(11, 'nihil', 'Ex laboriosam optio iure et delectus asperiores deserunt.', 71.93, 30),
(12, 'voluptates', 'Quis quidem velit dolore mollitia.', 90.39, 54),
(13, 'placeat', 'Sit dolores aut quis delectus est et.', 62.69, 95),
(14, 'voluptatem', 'Nihil dolor ratione quo quia minus odio earum.', 55.78, 52),
(15, 'et', 'Quo id natus illo laudantium qui voluptatem numquam.', 90.69, 73),
(16, 'et', 'Sint quo neque nesciunt voluptas sequi laborum optio.', 97.22, 39),
(17, 'cumque', 'Id voluptates at numquam.', 57.64, 28),
(18, 'iusto', 'Sed nam quidem autem adipisci.', 88.77, 53),
(19, 'architecto', 'Nostrum molestiae qui repellat itaque voluptates facere.', 50.16, 14),
(20, 'distinctio', 'Maiores voluptas minus et.', 85.17, 9),
(21, 'a', 'Omnis accusamus autem omnis ipsam architecto.', 30.16, 24),
(22, 'ut', 'Vel eaque inventore quisquam veniam fuga facilis.', 80.33, 45),
(23, 'est', 'Impedit saepe officiis ut veritatis rem.', 19.35, 40),
(24, 'magnam', 'Veniam doloremque necessitatibus et eos adipisci.', 33.22, 20),
(25, 'fugiat', 'Distinctio quia ad esse impedit voluptatem.', 46.45, 23),
(26, 'quod', 'Natus sunt dolorem voluptatum et laudantium et.', 26.09, 67),
(27, 'quos', 'Laboriosam ipsum fuga hic aperiam laudantium.', 91.75, 31),
(28, 'animi', 'Fugiat ut earum dolorem deserunt labore excepturi.', 90.18, 67),
(29, 'iste', 'Quas consectetur at nobis officia non quis ratione qui.', 41.36, 37),
(30, 'quia', 'Delectus eveniet nulla est dolor sed expedita neque.', 38.67, 76),
(31, 'blanditiis', 'Omnis corrupti pariatur et.', 59.05, 91),
(32, 'quae', 'Quis et ut voluptatum ut et voluptatum.', 40.40, 81),
(33, 'amet', 'Dicta quia ea qui sed.', 73.75, 25),
(34, 'rerum', 'Illo qui dolore recusandae aliquid magni aut.', 18.80, 75),
(35, 'voluptatem', 'In minus ipsum quae non asperiores possimus.', 95.02, 2),
(36, 'ut', 'Aliquid distinctio nisi exercitationem architecto vitae laborum.', 34.57, 55),
(37, 'voluptatibus', 'Suscipit alias qui cumque.', 97.60, 3),
(38, 'iusto', 'Modi et dolor enim dolores tempora quia ut.', 47.00, 50),
(39, 'corrupti', 'Nesciunt distinctio est qui quia.', 54.89, 18),
(40, 'architecto', 'Sint voluptate et rerum.', 54.50, 66),
(41, 'et', 'Soluta numquam sit repudiandae nam beatae distinctio minima.', 65.47, 21),
(42, 'debitis', 'Sed rerum aut perferendis soluta iste.', 17.67, 93),
(43, 'magnam', 'Cupiditate nam distinctio et vel nulla est.', 30.84, 6),
(44, 'provident', 'Odit doloremque ex commodi voluptas ipsum dolor labore suscipit.', 58.81, 30),
(45, 'iste', 'Fugiat dolor quo dolor delectus temporibus voluptatem.', 46.76, 78),
(46, 'mollitia', 'Debitis pariatur culpa quia minima excepturi omnis.', 69.53, 71),
(47, 'ut', 'Ut aliquam vero vel sit itaque tenetur in.', 98.88, 46),
(48, 'et', 'Quam voluptatibus sit ut blanditiis tenetur atque.', 22.26, 67),
(49, 'maiores', 'Qui qui enim commodi dolores ut voluptas et.', 62.52, 58),
(50, 'repellendus', 'Sit necessitatibus saepe quae.', 64.71, 65),
(51, 'accusamus', 'Expedita cumque fugiat dolor quia velit ipsum.', 84.35, 51),
(52, 'dolor', 'Illum fuga perspiciatis est veritatis voluptatem.', 6.70, 24),
(53, 'error', 'Expedita est corporis adipisci eum maxime.', 55.52, 88),
(54, 'voluptas', 'Quia iusto accusamus recusandae repellat itaque labore modi.', 71.55, 65),
(55, 'dolore', 'Optio quos reiciendis neque itaque.', 89.71, 26),
(56, 'et', 'Ut aut repellendus distinctio et error quo quia.', 6.91, 98),
(57, 'qui', 'Quod ut itaque commodi velit.', 90.05, 87),
(58, 'perferendis', 'Eveniet fugiat et dolorem facilis ipsam est.', 40.38, 43),
(59, 'et', 'Alias inventore aut labore corporis provident.', 28.30, 45),
(60, 'et', 'Quo facilis accusamus repellat ad asperiores velit et minima.', 80.01, 83),
(61, 'dolorem', 'Aperiam magni illum doloremque delectus tempora fuga.', 54.18, 22),
(62, 'perspiciatis', 'Sed atque at quisquam eligendi repudiandae corporis doloribus.', 47.50, 73),
(63, 'dolorem', 'Non quo impedit exercitationem asperiores sint quisquam.', 9.48, 23),
(64, 'et', 'Qui et dolor odit deserunt explicabo repudiandae veritatis.', 20.62, 81),
(65, 'officia', 'Voluptas expedita animi in consequatur voluptatem.', 55.97, 64),
(66, 'facere', 'Aut assumenda similique dolorem nemo sequi est.', 17.13, 14),
(67, 'quo', 'Quo ut ea sint est iste.', 43.70, 47),
(68, 'ullam', 'Autem a illo vero pariatur.', 99.78, 65),
(69, 'molestiae', 'Voluptates ullam rerum ut in dignissimos dolorem.', 30.98, 57),
(70, 'laudantium', 'Quia occaecati illo et consequatur qui neque.', 98.59, 27),
(71, 'qui', 'Autem commodi placeat voluptas et modi dolorem accusantium.', 64.59, 45),
(72, 'consequatur', 'Impedit nihil doloremque ipsa et ipsa.', 77.85, 1),
(73, 'aliquid', 'Dignissimos similique rerum dolorem.', 15.34, 1),
(74, 'neque', 'Soluta aliquam atque et inventore necessitatibus voluptatum earum dolor.', 56.05, 59),
(75, 'autem', 'Itaque blanditiis quod quisquam facere atque asperiores.', 72.03, 54),
(76, 'eum', 'Modi omnis laboriosam debitis autem consequatur cupiditate unde quis.', 56.26, 41),
(77, 'beatae', 'Ea voluptates a reprehenderit veniam et qui voluptas.', 50.00, 20),
(78, 'eos', 'Aliquam quos quia ullam nihil perferendis repellat.', 97.50, 42),
(79, 'occaecati', 'Consequuntur velit sit quia.', 94.35, 71),
(80, 'sit', 'Autem omnis illum voluptatum sunt consequuntur veritatis eaque.', 55.95, 12),
(81, 'autem', 'Sed velit nobis quod quo et fuga laboriosam.', 61.10, 3),
(82, 'minus', 'Repudiandae ut quis ea consequatur.', 18.17, 44),
(83, 'voluptatem', 'Sunt et odio fuga fugit eaque voluptatem.', 26.83, 47),
(84, 'molestiae', 'Quisquam eligendi autem et.', 44.23, 16),
(85, 'excepturi', 'Ex quis iusto quis qui et sunt nihil eum.', 43.46, 55),
(86, 'veniam', 'Perspiciatis laudantium aut iste corporis pariatur quisquam ut aliquam.', 69.51, 51),
(87, 'sed', 'Consectetur voluptate aliquam adipisci aspernatur rerum ducimus inventore.', 8.54, 64),
(88, 'expedita', 'Et nihil sit quidem recusandae et at.', 53.49, 31),
(89, 'deleniti', 'Dolores aperiam et aperiam rem.', 86.94, 54),
(90, 'laudantium', 'Suscipit qui ut dignissimos corrupti eos accusantium.', 50.98, 21),
(91, 'nisi', 'Eligendi sint voluptates consequatur dolorem quasi deleniti iste.', 21.99, 61),
(92, 'veritatis', 'Earum impedit repellendus architecto.', 5.29, 74),
(93, 'qui', 'Repellendus ipsam illum quasi deleniti aut doloribus molestiae qui.', 8.44, 76),
(94, 'aspernatur', 'Soluta consequatur ducimus ea eius in.', 95.23, 52),
(95, 'debitis', 'Eos voluptatum inventore cupiditate dicta autem.', 59.46, 69),
(96, 'consequatur', 'Repellendus aliquid dignissimos voluptatem dolor.', 44.54, 97),
(97, 'consequatur', 'Accusamus non quo est nesciunt qui magni.', 73.13, 37),
(98, 'voluptas', 'Est sint quos tempora eum quaerat.', 39.84, 96),
(99, 'at', 'Dolor voluptatibus voluptatem vel nam optio itaque.', 59.96, 78),
(100, 'quo', 'Expedita animi dolor voluptate quisquam necessitatibus earum reiciendis.', 37.45, 86);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `mot_de_passe`, `telephone`) VALUES
(1, 'Olson', 'Ardith', 'keebler.rickey@stoltenberg.net', '$2y$10$au25thjsEGqe9NqnYWS9XukhYcpj1Af7ZEXDg3qR09OPrGa28GUku', '1-463-490-9266'),
(2, 'Daniel', 'Allie', 'jwitting@pfannerstill.info', '$2y$10$0S7VbphxwBvyT8UzrnDHte8xDuByG49ID48jLkmwYU.OYN67JWDgO', '276.235.6484'),
(3, 'Gaylord', 'Freeda', 'gstracke@mckenzie.com', '$2y$10$l.cIdnTugd3X08DgpdHb3eSpFWRaYcSdVR6Y712ECzdkJ/c0LQPBW', '959-497-0410'),
(4, 'Ryan', 'Krystina', 'sunny84@hotmail.com', '$2y$10$hfYfLZIeB0GXO06PPZjdKuUXsmXHQlSPoKZVq.t.GFrRjrnuW.F3u', '+1 (484) 764-49'),
(5, 'Metz', 'Palma', 'schiller.pedro@yahoo.com', '$2y$10$z2gem7mAtEXnEUPVIOXd0uB/A6GOvf772d93XWqgT46vX6CCEgkVG', '(279) 610-2565'),
(6, 'Lesch', 'Antonina', 'tremaine36@dibbert.info', '$2y$10$IbvCz3MIEy039GoHIthMiOgq2V7yx5JyBGN9QDIH6oX4V46Tf.WRK', '(219) 540-8016'),
(7, 'Willms', 'Leora', 'donnell.konopelski@gmail.com', '$2y$10$pF92SyHMRIF.d6F2bHc6TOiz1eKvHzw79wWLEjS/WU/CD/l9kl5mC', '1-404-830-3130'),
(8, 'Lueilwitz', 'Izaiah', 'pagac.tamara@roob.biz', '$2y$10$SPEsTcl8vXF6tExYhQbyy.XRvmqxVphYXwjbtCKz5jO2hixy66F7K', '1-727-445-7582'),
(9, 'Abbott', 'Tanya', 'rpollich@rowe.biz', '$2y$10$PpTfCzqxFrHosI4HjJu0MuSiKR/XPtqKdnco3t8yZi6S5j/niFPBa', '602.428.9858'),
(10, 'Langworth', 'Yadira', 'jabari05@lesch.info', '$2y$10$VsfvvC6udYjUtf44R08mkuuqzbl8tUfNArrxZoZvALb3CjM9QjHWa', '+13058594463'),
(11, 'Bergstrom', 'Jamaal', 'edmond.hickle@mills.com', '$2y$10$/DR9DcnO7TTl6U4Zv06bNOVg06ZcyeTJf4c0KEfFTyVcvObTvHUHO', '1-509-848-2883'),
(12, 'Turner', 'Kelvin', 'orion.barrows@gmail.com', '$2y$10$WzvA2NmMutoMZOW8/PpdsuZMayfa4DzoOu7WBGst8XvEIyhyWNZ9i', '+15752515644'),
(13, 'Kertzmann', 'Andy', 'xhartmann@gmail.com', '$2y$10$lZR7.o.V0uBURxoq.pwIieGExHmmQI8457y5kD8740oTnu1xoq7tm', '740-943-7275'),
(14, 'Klein', 'Claire', 'vicenta.oconner@yahoo.com', '$2y$10$ylBhY42OY9ZXOr7R06wGFOKtqIBV/22MLr4VJEuzJial/XaZV4P62', '(628) 692-2006'),
(15, 'Hartmann', 'Gwen', 'bartell.alek@monahan.com', '$2y$10$ALrJZC9ZcyMUgFakSf2kjeOC/Yje5y4mbyJcNEmMSe2XDP91pN822', '+14086775200'),
(16, 'Schinner', 'Paula', 'lily.champlin@gmail.com', '$2y$10$5EKvmT/xVGsOhdBLPQS/jOyV3Vb5k9uOJKsLhogxfv6XxmSjrBaYq', '+1 (640) 559-30'),
(17, 'Parker', 'Aaron', 'estrosin@becker.com', '$2y$10$3oYoROtp6h13dA7.2mG3ju6/nldFoVd3Id5HBGGKr.EX9ApHowoUO', '270-431-6399'),
(18, 'Williamson', 'Duane', 'sheridan83@hotmail.com', '$2y$10$4QzFUoqY3r8nsrkUQtdQ0O6CUdc02XBrnwLksHirqzbmyxsBqQlty', '+13854166911'),
(19, 'Stracke', 'Elroy', 'dosinski@murray.com', '$2y$10$SFBjHz0uH1Ti6nqYRo3FOOf0dzfMzHY8sbipL8yN9iIVvevLYh3s.', '+1.956.594.4361'),
(20, 'Kshlerin', 'Yasmin', 'michele.harber@yahoo.com', '$2y$10$ZNP4LDB.GGEBPx.BtGs1a.DCrGDiSiacl5eNk6fv/gvcgPS15cELC', '1-832-754-6616'),
(21, 'Leuschke', 'Arnold', 'shania46@yahoo.com', '$2y$10$ZJ3O2o8YABBB.E6qY1uV0eWhnaypUWHi5j/TU/6GIaccPGK.95bVO', '+1 (904) 725-65'),
(22, 'Beier', 'Anita', 'josiane.larkin@gmail.com', '$2y$10$7SIRjJuL3e.j5Bbgmwvhn.8wjwBt43ZRfBM.MLb.6YeRz04mC4vei', '+15208822177'),
(23, 'Schiller', 'Araceli', 'allie.veum@gutkowski.com', '$2y$10$nOXi3749R4I8pGqxkHih8edrp1w7K05AdSo1Ire6olE.LycIXq9Z.', '1-915-509-2818'),
(24, 'Bechtelar', 'Deshaun', 'kip.torphy@powlowski.net', '$2y$10$3WUiDMLUagmKd.sBuJj21.4cJMmf71h2KHs3gynSd97YH7qtgu8MK', '540-217-8946'),
(25, 'Jacobson', 'Katherine', 'pasquale.tromp@gmail.com', '$2y$10$GRu/t8m.Bm6fT5Ouy/X32OJAih6aQuKsiXb8vms8z97j866svYkk2', '330.506.1357'),
(26, 'Connelly', 'Catherine', 'kulas.santina@hotmail.com', '$2y$10$vl2wK6JXRd3fz.A2H.IWV.JtW4C4GTmy/YwbvjmVsKU96qxk7/Mxq', '+1 (678) 683-23'),
(27, 'Bechtelar', 'Carmen', 'tia.halvorson@hotmail.com', '$2y$10$6YPrcLzZije6iQ5wXMM75.8UrZnFeyh4t8U5CErsxSzf5R4uFRY76', '1-469-999-8069'),
(28, 'Cartwright', 'Marcos', 'elody76@hotmail.com', '$2y$10$NbyBiCHLySemHAyl00w7DuIBGbWjmBx0QaNCW28De4SLUmowe.kfa', '775.327.4857'),
(29, 'Schultz', 'Roy', 'xkemmer@breitenberg.info', '$2y$10$7xxY1qixXyNyhJ3CwtPyl.13znBm.hnn6YpgdQ9Xo9KA.jvfLpPYW', '1-732-800-6454'),
(30, 'Bernier', 'Francis', 'hailie36@hotmail.com', '$2y$10$9i8OpBPMJmyhTWfeIdNXMu3XP7DVSD1HEPGmbSIPV.bg8RVYo8V9u', '+1-208-343-8339'),
(31, 'Dicki', 'Lola', 'spencer.marcus@zboncak.biz', '$2y$10$doYuku1syFMGmS5/rZxqe.pY4TRm0TLmoNXPhj7WB9e6GcvTKmAUi', '(878) 626-2274'),
(32, 'Rippin', 'Aubrey', 'garnet.gaylord@gmail.com', '$2y$10$EYJnEFqrUFNZ7OvcNEU7rukhpOSHcWS37gs/MXNToKEZwzSFqCOLm', '(252) 302-9174'),
(33, 'Kulas', 'Emerald', 'dixie.gleichner@hotmail.com', '$2y$10$pUfjO.74DegsVlLwSz61n.lf8o7h0cWGTbSf61LFzpd6OvvcuwU1u', '256.898.4685'),
(34, 'Stoltenberg', 'Jaida', 'dstamm@hotmail.com', '$2y$10$L7NClcM96uiYJ2cLvZWPzO25MoKhDnweYvjK778XEUFefJ6XqNZrW', '+19719798397'),
(35, 'Auer', 'Garrett', 'kkeebler@hotmail.com', '$2y$10$glXr6X/1W0NJcYBEialcuewNEsiCpDmoP4ffwKs48jDe6pR3FvK3a', '+1-413-873-1872'),
(36, 'Kutch', 'Judy', 'kevon20@kozey.com', '$2y$10$xuc/eGCX2vsEyxFNWBIdru.L5LiqjA7L5dQ.48kQ9dNKvLiHroxuK', '+1 (440) 474-10'),
(37, 'Daugherty', 'Josh', 'viviane91@yahoo.com', '$2y$10$phMhKLlwueh25RZTCXQGSur54fYz559E2hPDg8wC9y6XVnN1et.pm', '360-795-1351'),
(38, 'Graham', 'Pinkie', 'abdullah12@gmail.com', '$2y$10$YixfPs90SecQSWHPAsbqBuZHVFxl7BvGDpyXnGTFfsimylm5y6Kea', '+15679596627'),
(39, 'Murphy', 'Ofelia', 'dahlia.ritchie@schneider.com', '$2y$10$LasaJeZ7vqHZgkcCt5nzVeEWXHG/6qy3ZcZvPs7ZVpi/nqTBjnOJy', '920-243-0143'),
(40, 'King', 'Carmella', 'batz.karli@yahoo.com', '$2y$10$8rNQeaFl60Fr7myZ3lCqoe8SPj7ohzW/wIuy3e/./C1TJCOzenYi.', '(820) 545-4812'),
(41, 'West', 'Cecilia', 'lubowitz.albert@yahoo.com', '$2y$10$oEMCQXFQuT1gpMPD/UDzDuGVMzMdYNGWVBbEd9cx3XSEhUH9L6EqG', '+1-561-960-6725'),
(42, 'Kutch', 'Helene', 'kamren.weimann@yahoo.com', '$2y$10$B9A4oY2rzX4jaJKcoN/mcey9FkkuC1wAtKwWvcZDjLfxazXENpoKC', '+1-478-557-0332'),
(43, 'Hoppe', 'Yazmin', 'jensen.kozey@gmail.com', '$2y$10$KbtbQU7n3/2F8cY7MY6ZzO30iTnAeRZXQF9hjzHGzqbYbnqAY3TjS', '(951) 718-8582'),
(44, 'Klein', 'Alberta', 'schultz.cathrine@sipes.com', '$2y$10$SGI75Z7pxJ0S5Ca9x/2TX.ziXuVPEup51JMcNn25.3bO3mwqqlBcK', '+1 (863) 710-82'),
(45, 'Stoltenberg', 'Myles', 'harvey.jenkins@christiansen.org', '$2y$10$cH2ZfuaxaW1.Z/wgWAKTHebKdQfiQXiQ4vAdwnfIij2rnsMBUg4Z6', '(551) 320-6347'),
(46, 'Kuhlman', 'Wyatt', 'meaghan12@gmail.com', '$2y$10$/8VxN3od.E3aeszq8ydp/Oj6mxdVnYCjmG9JKOjoEo5v/TDKUfGqG', '971-824-1062'),
(47, 'Lemke', 'Margaret', 'nitzsche.bridget@hotmail.com', '$2y$10$LS5VnFO1QDNCgoUNfDTwXe5Ed/15UVB3am6I6vaaSok3pVN28/kTG', '1-848-204-6963'),
(48, 'Hauck', 'Otto', 'margaretta.larson@yahoo.com', '$2y$10$tzR2WgE1PNMptHsUQhReD.SCqFwh8aqv5EIGtAWFt2fDZlVInLF3a', '+1-424-564-3756'),
(49, 'Lesch', 'Granville', 'mabel.hudson@yahoo.com', '$2y$10$Iif/m7he05mEDqj2xrB/W.J3FwwqwVFGxFJNchw1kn.BDqZHmNogq', '+1 (785) 682-80'),
(50, 'Oberbrunner', 'Hulda', 'lebsack.ressie@nader.com', '$2y$10$UFoGlbQDUwc39Bd6OxgilefsTlCoMSBUcGiv2g1EB8K6Ig6wFCTuC', '(480) 780-2825');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
