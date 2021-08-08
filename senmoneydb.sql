-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 06 août 2021 à 14:34
-- Version du serveur :  10.4.16-MariaDB
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `senmoneydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `solde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `numero`, `code`, `solde`) VALUES
(1, 784318031, 1997, 5785),
(2, 774852231, 1990, 47125),
(3, 784318031, 1546, 15000),
(4, 778489522, 3120, 15000),
(5, 701854895, 4985, 29290),
(6, 769588774, 4871, 45775);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `id_compte_source` int(11) NOT NULL,
  `id_compte_destination` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id`, `montant`, `id_compte_source`, `id_compte_destination`, `date`) VALUES
(1, 50, 1, 6, '2021-08-05 00:00:00'),
(2, 5500, 1, 3, '2021-08-03 00:00:00'),
(3, 51, 1, 1, '0000-00-00 00:00:00'),
(4, 54, 1, 2, '2021-08-05 05:30:09'),
(5, 156, 1, 6, '2021-08-05 00:00:00'),
(6, 8000, 1, 6, '2021-08-05 07:00:30'),
(7, 5000, 2, 1, '2021-08-05 00:00:00'),
(8, 58, 1, 3, '2021-08-05 00:00:00'),
(9, 514, 1, 5, '2021-08-05 00:00:00'),
(10, 500, 2, 1, '2021-08-05 00:00:00'),
(11, 500, 2, 1, '2021-08-05 18:41:16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compte_source` (`id_compte_source`),
  ADD KEY `fk_compte_destination` (`id_compte_destination`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_compte_destination` FOREIGN KEY (`id_compte_destination`) REFERENCES `compte` (`id`),
  ADD CONSTRAINT `fk_compte_source` FOREIGN KEY (`id_compte_source`) REFERENCES `compte` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
