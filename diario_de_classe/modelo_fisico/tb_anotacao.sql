-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 12-Nov-2018 às 19:43
-- Versão do servidor: 5.7.21
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diario_de_classe`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_anotacao`
--

DROP TABLE IF EXISTS `tb_anotacao`;
CREATE TABLE IF NOT EXISTS `tb_anotacao` (
  `anotacao_id_anotacao` int(200) NOT NULL AUTO_INCREMENT,
  `anotacao_assunto` varchar(50) NOT NULL,
  `anotacao_data` date NOT NULL,
  `anotacao_id_usuario` int(200) NOT NULL,
  `anotacao_anotacao` longtext NOT NULL,
  PRIMARY KEY (`anotacao_id_anotacao`),
  KEY `fk_anotacoes/usuario` (`anotacao_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_anotacao`
--
ALTER TABLE `tb_anotacao`
  ADD CONSTRAINT `fk_anotacoes/usuario` FOREIGN KEY (`anotacao_id_usuario`) REFERENCES `tb_usuario` (`tb_usuario_id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
