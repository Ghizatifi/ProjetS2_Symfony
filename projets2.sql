-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 23 Mars 2018 à 22:01
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projets2`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`id`, `login`, `pwd`, `profile`) VALUES
(1, 'admin', 'admin', '1'),
(2, 'user', 'user', '2');

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

CREATE TABLE IF NOT EXISTS `cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lbl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Qte` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `prod`
--

CREATE TABLE IF NOT EXISTS `prod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Prix` int(11) NOT NULL,
  `Qte` int(11) NOT NULL,
  `categ` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brochure` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `prod`
--

INSERT INTO `prod` (`id`, `Libelle`, `Prix`, `Qte`, `categ`, `image`, `brochure`) VALUES
(6, 'aze', 4000, 1, 'telefone', '05e2c10243d24ed9b6fe96b733d6f009.jpeg', '2bd31b4d70e724bb5e0733c5a1d1b836.pdf'),
(7, 'wxc', 800000, 5, 'pc', '8e59eb9f1642f56b2fbf40f8805a8b9d.jpeg', '25962155471e059dee17a80ac5cb445c.pdf'),
(8, 'qsdss', 70000, 4, 'telefone', 'fcfd3594b7d1df2e952a815d4ca699b8.jpeg', 'e5fec030ae854363d5f682d623c64b54.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Prix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Categorie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `Libelle`, `Prix`, `Description`, `Categorie`) VALUES
(1, 'pc', '2000', 'dell', 'q'),
(2, 'tele', '1500', 'samsung', 'a'),
(3, 'rgf', '0', 'tsjsyu', 'srtj'),
(4, 'rgf', '0', 'tsjsyu', 'srtj'),
(5, 'fv', '0', 'uk', 'yf'),
(6, 'fv', '0', 'uk', 'yf');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
