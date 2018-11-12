-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 12-Nov-2018 às 12:36
-- Versão do servidor: 5.7.23
-- versão do PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diario_de_classee`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE IF NOT EXISTS `tb_login` (
  `id_login` int(200) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(30) NOT NULL,
  `nome_usuario` varchar(30) NOT NULL,
  `senha` int(30) NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_login/usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notas`
--

DROP TABLE IF EXISTS `tb_notas`;
CREATE TABLE IF NOT EXISTS `tb_notas` (
  `id_nota` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(200) NOT NULL,
  `id_turma` int(200) NOT NULL,
  `nota` int(20) NOT NULL,
  PRIMARY KEY (`id_nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de Notas e avaliações.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano_de_aula`
--

DROP TABLE IF EXISTS `tb_plano_de_aula`;
CREATE TABLE IF NOT EXISTS `tb_plano_de_aula` (
  `id_plano_de_aula` int(200) NOT NULL AUTO_INCREMENT,
  `id_turma` int(30) NOT NULL,
  `tema` varchar(30) NOT NULL,
  `conteudo` longtext NOT NULL,
  `metodologia_de_ensino` varchar(100) NOT NULL,
  `objetivo` varchar(100) NOT NULL,
  `recursos_necessarios` varchar(100) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id_plano_de_aula`),
  KEY `fk_planos_de_aula/turma` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de planos de aula';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
CREATE TABLE IF NOT EXISTS `tb_turma` (
  `id_turma` int(200) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `periodo` varchar(20) NOT NULL,
  `qtd_atunos` int(200) NOT NULL,
  `disciplina_ministrada` varchar(50) NOT NULL,
  `id_professor` int(200) NOT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `fk_turma/usuario` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela referente a turma do usuário';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id_usuario` int(200) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de dados de usuário.';

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `fk_login/usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_plano_de_aula`
--
ALTER TABLE `tb_plano_de_aula`
  ADD CONSTRAINT `fk_planos_de_aula/turma` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `fk_turma/usuario` FOREIGN KEY (`id_professor`) REFERENCES `tb_usuario` (`id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
