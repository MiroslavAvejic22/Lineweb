-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 13, 2021 at 06:49 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g2`
--

-- --------------------------------------------------------

--
-- Table structure for table `galerije`
--

DROP TABLE IF EXISTS `galerije`;
CREATE TABLE IF NOT EXISTS `galerije` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) NOT NULL,
  `komentar` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerije`
--

INSERT INTO `galerije` (`id`, `ime`, `komentar`) VALUES
(1, 'adsad', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
CREATE TABLE IF NOT EXISTS `kategorije` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `naziv`) VALUES
(1, 'Automobili'),
(2, 'Mobilni telefoni'),
(3, 'Stanovi'),
(4, 'Bela tehnika'),
(5, 'Kupatilo'),
(8, 'Instrumenti'),
(7, 'Foto'),
(6, 'Igrice');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProizvoda` int(3) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `volim` int(11) NOT NULL DEFAULT '0',
  `nevolim` int(11) NOT NULL DEFAULT '0',
  `dozvoljen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`id`, `idProizvoda`, `ime`, `komentar`, `vreme`, `volim`, `nevolim`, `dozvoljen`) VALUES
(2, 14, 'ppera', 'Ovo je drugi komentar', '2021-02-09 17:08:59', 0, 0, 1),
(3, 14, 'laza', 'Ovo je treci komentar', '2021-02-09 17:09:11', 0, 0, 1),
(4, 9, 'bbosko', 'Ovo je prvi komentar za id=9', '2021-02-09 17:11:52', 0, 0, 1),
(5, 13, 'sdfsdf', 'dsfsdfs', '2021-02-09 17:24:31', 0, 0, 1),
(6, 11, 'bbosko', 'Komentar koji treba da se odobri', '2021-02-09 17:30:46', 0, 0, 1),
(7, 11, 'bbosko', 'sadsadasd', '2021-02-09 17:48:28', 0, 0, 1),
(9, 14, 'bbosko', 'alert(&#39;Hakovan si&#39;)', '2021-02-09 17:53:53', 0, 0, 1),
(8, 11, 'ppera', 'asdsdasd', '2021-02-09 17:49:50', 0, 0, 1),
(10, 14, 'asdasd', 'asdasdsad', '2021-03-12 19:22:21', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
CREATE TABLE IF NOT EXISTS `kontakt` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(3) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pitanje` text NOT NULL,
  `vremePitanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `odgovor` text,
  `vremeOdgovora` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kontakt`
--

INSERT INTO `kontakt` (`id`, `idKorisnika`, `email`, `pitanje`, `vremePitanja`, `odgovor`, `vremeOdgovora`) VALUES
(1, NULL, 'bbosko@skola.com', 'Moje prvo pitanje?', '2021-02-09 18:32:13', 'Ovo je odgovor koji sam vam dao', '2021-02-09 19:00:47'),
(2, 1, 'bbosko@skola.com', 'ovo je pitanje prijavljenog korisnika', '2021-02-09 18:38:25', 'Ovde unosim odgovor sa porukom', '2021-02-09 18:59:50'),
(3, NULL, 'ckurbla@skola.com', 'dzdsfsfsdfsdfsdf', '2021-02-09 18:39:00', 'Ovo je odgovor na glupo pitanje', '2021-02-09 18:56:15'),
(4, 1, 'bbosko@skola.com', 'Ovo je moje drugo pitanje', '2021-02-09 19:20:33', NULL, NULL),
(5, 1, 'bbosko@skola.com', 'Ovo je moje trece pitanje?', '2021-02-09 19:20:54', 'Ovo je odgovor na trece pitanje', '2021-02-09 19:21:16'),
(6, 3, 'ckurbla@skola.com', 'Ovo je pitanje Caneta?', '2021-02-09 19:21:55', 'Cane, evo odgovora', '2021-02-09 19:22:40'),
(7, 3, 'ckurbla@skola.com', 'ovo je drugo pitanje Caneta?', '2021-02-09 19:22:04', 'Cane, ne smaraj', '2021-02-09 19:22:52'),
(8, 3, 'ckurbla@skola.com', 'Ali ja sam bas hteo.....?', '2021-02-09 19:23:47', 'Cane, iskuliraj', '2021-02-09 19:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `lozinka` varchar(256) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `komentar` text,
  `aktivan` int(1) NOT NULL DEFAULT '1',
  `status` enum('Administrator','Urednik','Korisnik') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `email`, `lozinka`, `vreme`, `komentar`, `aktivan`, `status`) VALUES
(1, 'Бошко', 'Богојевић', 'bbosko@skola.com', 'bbosko', '2020-12-15 17:16:12', 'Car nad carevima', 1, 'Administrator'),
(2, 'Pera', 'Peric', 'pperic@skola.com', 'pperic', '2020-12-15 17:16:12', '', 1, 'Urednik'),
(3, 'Cane', 'Kurbla', 'ckurbla@skola.com', 'ckurbla', '2020-12-15 17:31:20', 'Nije platio clanarinu', 1, 'Korisnik'),
(7, 'Pera', 'Peric', 'asdsasdasdsd@sfsdfsd.com', '12345', '2021-04-06 15:42:00', '', 1, 'Korisnik'),
(8, 'Mile', 'Milic', 'gfhfgh@gdfgdf.com', '12345', '2021-04-06 15:42:14', 'dsfdfds', 1, 'Korisnik');

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

DROP TABLE IF EXISTS `proizvodi`;
CREATE TABLE IF NOT EXISTS `proizvodi` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(150) NOT NULL,
  `tekst` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` int(3) NOT NULL,
  `kategorija` int(3) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  `izmena` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cena` int(10) NOT NULL,
  `pogledan` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `naslov`, `tekst`, `vreme`, `autor`, `kategorija`, `obrisan`, `izmena`, `cena`, `pogledan`) VALUES
(1, 'KAKAV ŠAMAR SRBIJI OD SRPSKOG GOLMANA Navijači su se kleli u njega dok je branio za Zvezdu, a sad je PONIZIO', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-12-16 18:43:23', 1, 1, 1, '2020-12-29 17:30:03', 0, 0),
(2, 'NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary bosko to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2019-12-15 18:43:23', 2, 2, 1, '2021-01-26 19:19:59', 0, 7),
(3, 'KAKAV ŠAMAR SRBIJI OD SRPSKOG GOLMANA Navijači su se kleli u njega dok je branio za Zvezdu, a sad je PONIZIO', 'Lorem Ipsum bosko is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-12-15 18:43:23', 2, 1, 0, '2021-01-12 19:44:48', 0, 2),
(4, 'NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2020-12-15 18:43:23', 2, 3, 0, '2020-12-29 16:53:17', 0, 0),
(5, 'Naseg NOVAKA ZAMENILI RAFOM I RODŽEROM ATP nije dopustio Đokovićev', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-12-15 18:43:23', 1, 1, 1, '2020-12-29 19:00:36', 0, 0),
(6, 'NASLOV IZ UPDATE UPITA', 'TEKST IZ UPDATE UPITA', '2020-12-29 18:43:23', 3, 2, 1, '2021-01-26 19:24:49', 0, 0),
(8, 'Poslednja NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2020-12-15 18:43:23', 2, 3, 0, '2020-12-29 17:39:26', 0, 0),
(9, 'Ovo je naslov iz phpmyadmina', 'Ovo je tekst iz phpmyadmina', '2020-12-29 18:12:25', 1, 4, 0, '2021-02-09 17:13:47', 0, 4),
(10, 'Ovo je naslov iz phpmyadmina sa UPITOM', 'Ovo je tekst iz phpmyadmina sa UPITOM', '2020-12-29 18:15:20', 1, 1, 0, NULL, 0, 0),
(11, 'Naslov sa PHP stranice za INSERT', 'Tekst sa PHP stranice za INSERT i ovde ide neki Lorem Ipsum', '2020-12-29 18:48:08', 1, 6, 0, '2021-04-13 15:10:25', 0, 16),
(12, 'Ovo je Izmenjen naslov sa statisstikom', 'Ovo je IZMENJEN naslov sa statisstikom. I ovde ide neki novi Lorem Ipsum', '2020-12-29 18:51:05', 5, 6, 0, '2021-01-19 19:19:46', 0, 0),
(13, 'Nova NOKIA 3310', 'Stara 10 godina. Baterija na 34%', '2021-01-26 19:07:38', 1, 2, 0, '2021-04-13 15:07:33', 1000, 17),
(14, 'Nove letnje lezaljke', 'Super!!!!! Probajte. Veliki izbor. Vrlo povoljno', '2021-02-02 19:26:35', 1, 5, 0, '2021-04-13 15:07:26', 1000, 52);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodislike`
--

DROP TABLE IF EXISTS `proizvodislike`;
CREATE TABLE IF NOT EXISTS `proizvodislike` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProizvoda` int(4) NOT NULL,
  `imeSlike` varchar(100) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proizvodislike`
--

INSERT INTO `proizvodislike` (`id`, `idProizvoda`, `imeSlike`, `vreme`) VALUES
(1, 14, '1612293995.0889.jpg', '2021-02-02 19:26:35'),
(2, 14, '1612293995.0926.jpg', '2021-02-02 19:26:35'),
(3, 14, '1612293995.0952.jpg', '2021-02-02 19:26:35'),
(4, 14, '1612293995.0974.jpg', '2021-02-02 19:26:35'),
(5, 14, '1612293995.0996.jpg', '2021-02-02 19:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `statistika`
--

DROP TABLE IF EXISTS `statistika`;
CREATE TABLE IF NOT EXISTS `statistika` (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipadresa` varchar(50) NOT NULL,
  `stranica` varchar(50) NOT NULL,
  `parametri` varchar(50) DEFAULT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tekst` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statistika`
--

INSERT INTO `statistika` (`id`, `ipadresa`, `stranica`, `parametri`, `vreme`, `tekst`) VALUES
(25, '::1', '/aphp/g2/p1/index.php', '', '2020-12-29 19:22:45', ''),
(26, '::1', '/aphp/g2/p1/index.php', 'id=12', '2020-12-29 19:22:48', ''),
(27, '::1', '/aphp/g2/p1/index.php', 'autor=1', '2020-12-29 19:22:50', ''),
(28, '::1', '/aphp/g2/p1/index.php', 'id=7', '2020-12-29 19:22:51', ''),
(29, '::1', '/aphp/g2/p1/index.php', 'autor=1', '2020-12-29 19:22:52', ''),
(30, '::1', '/aphp/g2/p1/index.php', 'kategorija=1', '2020-12-29 19:22:54', ''),
(31, '::1', '/aphp/g2/p1/index.php', 'kategorija=3', '2020-12-29 19:22:54', ''),
(32, '::1', '/aphp/g2/p1/index.php', 'kategorija=4', '2020-12-29 19:22:55', ''),
(33, '::1', '/aphp/g2/p1/index.php', 'kategorija=5', '2020-12-29 19:22:55', ''),
(34, '::1', '/aphp/g2/p1/index.php', 'kategorija=3', '2020-12-29 19:22:56', ''),
(35, '::1', '/aphp/g2/p1/index.php', 'kategorija=6', '2020-12-29 19:22:57', ''),
(36, '::1', '/aphp/g2/p1/index.php', 'id=11', '2020-12-29 19:22:58', ''),
(37, '::1', '/aphp/g2/p1/index4.php', '', '2020-12-29 19:29:05', 'Uspesno obrisana vest 7'),
(38, '::1', '/aphp/g2/p1/index.php', '', '2020-12-29 19:29:40', ''),
(39, '::1', '/aphp/g2/p1/index.php', '', '2020-12-29 19:32:30', ''),
(40, '::1', '/aphp/g2/p1/index5.php', '', '2020-12-29 19:32:36', 'Uspesan pokusaj brisanja: 12'),
(41, '::1', '/aphp/g2/p1/index.php', '', '2020-12-29 19:32:41', ''),
(42, '::1', '/aphp/g2/p1/index.php', '', '2020-12-29 19:33:28', '');

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

DROP TABLE IF EXISTS `vesti`;
CREATE TABLE IF NOT EXISTS `vesti` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(150) NOT NULL,
  `tekst` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` int(3) NOT NULL,
  `kategorija` int(3) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  `izmena` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cena` int(10) NOT NULL,
  `pogledan` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`id`, `naslov`, `tekst`, `vreme`, `autor`, `kategorija`, `obrisan`, `izmena`, `cena`, `pogledan`) VALUES
(1, 'KAKAV ŠAMAR SRBIJI OD SRPSKOG GOLMANA Navijači su se kleli u njega dok je branio za Zvezdu, a sad je PONIZIO', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-12-16 18:43:23', 1, 1, 1, '2020-12-29 17:30:03', 0, 0),
(2, 'NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary bosko to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2019-12-15 18:43:23', 2, 2, 0, '2020-12-29 17:51:52', 0, 0),
(3, 'KAKAV ŠAMAR SRBIJI OD SRPSKOG GOLMANA Navijači su se kleli u njega dok je branio za Zvezdu, a sad je PONIZIO', 'Lorem Ipsum bosko is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-12-15 18:43:23', 2, 1, 0, '2020-12-29 17:51:52', 0, 0),
(4, 'NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2020-12-15 18:43:23', 2, 3, 0, '2020-12-29 16:53:17', 0, 0),
(5, 'Naseg NOVAKA ZAMENILI RAFOM I RODŽEROM ATP nije dopustio Đokovićev', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-12-15 18:43:23', 1, 1, 1, '2020-12-29 19:00:36', 0, 0),
(6, 'NASLOV IZ UPDATE UPITA', 'TEKST IZ UPDATE UPITA', '2020-12-29 18:43:23', 2, 2, 0, '2020-12-29 19:03:19', 0, 0),
(8, 'Poslednja NADAM SE DA ĆU DA POSTIGNEM GOL Falćineli je već TRESAO MREŽU Milana i zna recept za Zvezdinu pobedu', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32', '2020-12-15 18:43:23', 2, 3, 0, '2020-12-29 17:39:26', 0, 0),
(9, 'Ovo je naslov iz phpmyadmina', 'Ovo je tekst iz phpmyadmina', '2020-12-29 18:12:25', 1, 4, 0, '2020-12-29 18:15:52', 0, 0),
(10, 'Ovo je naslov iz phpmyadmina sa UPITOM', 'Ovo je tekst iz phpmyadmina sa UPITOM', '2020-12-29 18:15:20', 1, 1, 0, NULL, 0, 0),
(11, 'Naslov sa PHP stranice za INSERT', 'Tekst sa PHP stranice za INSERT i ovde ide neki Lorem Ipsum', '2020-12-29 18:48:08', 1, 6, 0, NULL, 0, 0),
(12, 'Ovo je Izmenjen naslov sa statisstikom', 'Ovo je IZMENJEN naslov sa statisstikom. I ovde ide neki novi Lorem Ipsum', '2020-12-29 18:51:05', 1, 6, 0, '2020-12-29 19:33:25', 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwproizvodi`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vwproizvodi`;
CREATE TABLE IF NOT EXISTS `vwproizvodi` (
`id` int(3) unsigned
,`naslov` varchar(150)
,`tekst` text
,`vreme` timestamp
,`autor` int(3)
,`kategorija` int(3)
,`obrisan` int(1)
,`izmena` timestamp
,`cena` int(10)
,`pogledan` int(5)
,`naziv` varchar(50)
,`ime` varchar(20)
,`prezime` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `vwproizvodi`
--
DROP TABLE IF EXISTS `vwproizvodi`;

DROP VIEW IF EXISTS `vwproizvodi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwproizvodi`  AS  select `proizvodi`.`id` AS `id`,`proizvodi`.`naslov` AS `naslov`,`proizvodi`.`tekst` AS `tekst`,`proizvodi`.`vreme` AS `vreme`,`proizvodi`.`autor` AS `autor`,`proizvodi`.`kategorija` AS `kategorija`,`proizvodi`.`obrisan` AS `obrisan`,`proizvodi`.`izmena` AS `izmena`,`proizvodi`.`cena` AS `cena`,`proizvodi`.`pogledan` AS `pogledan`,`kategorije`.`naziv` AS `naziv`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime` from ((`proizvodi` join `kategorije` on((`proizvodi`.`kategorija` = `kategorije`.`id`))) join `korisnici` on((`proizvodi`.`autor` = `korisnici`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
