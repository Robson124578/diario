-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 25-Nov-2018 às 17:15
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
-- Database: `dbdiariodeclasse`
--
CREATE DATABASE IF NOT EXISTS `dbdiariodeclasse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbdiariodeclasse`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
CREATE TABLE IF NOT EXISTS `tb_aluno` (
  `tb_aluno_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tb_aluno_nome` varchar(100) NOT NULL,
  `tb_aluno_email` varchar(60) NOT NULL,
  `tb_aluno_telefone` varchar(50) NOT NULL,
  `tb_aluno_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_aluno_turma` int(11) DEFAULT NULL,
  PRIMARY KEY (`tb_aluno_id`),
  KEY `fk_AlunoTurma` (`tb_aluno_turma`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_anotacao`
--

DROP TABLE IF EXISTS `tb_anotacao`;
CREATE TABLE IF NOT EXISTS `tb_anotacao` (
  `tb_anotacao_id_anotacao` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tb_anotacao_assunto` varchar(350) NOT NULL,
  `tb_anotacao_data_criacao` date DEFAULT NULL,
  `tb_anotacao_id_usuario` int(11) DEFAULT NULL,
  `tb_anotacao_anotacao` varchar(5000) NOT NULL,
  `tb_anotacao_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tb_anotacao_id_anotacao`),
  KEY `FK_tb_anotacao_id_usuario` (`tb_anotacao_id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_anotacao`
--

INSERT INTO `tb_anotacao` (`tb_anotacao_id_anotacao`, `tb_anotacao_assunto`, `tb_anotacao_data_criacao`, `tb_anotacao_id_usuario`, `tb_anotacao_anotacao`, `tb_anotacao_data`) VALUES
(3, 'As principáis formas de conhecimento humano.', '2018-12-01', NULL, 'Em linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável. Wikipédia\r\nEm linguística, a noção de texto é ampla e ainda aberta a uma definição mais precisa. Grosso modo, pode ser entendido como manifestação linguística das ideias de um autor, que serão interpretadas pelo leitor de acordo com seus conhecimentos linguísticos e culturais. Seu tamanho é variável. Wikipédia\r\n', '2018-11-25 13:46:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nota`
--

DROP TABLE IF EXISTS `tb_nota`;
CREATE TABLE IF NOT EXISTS `tb_nota` (
  `tb_nota_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tb_nota_turma` int(11) DEFAULT NULL,
  `tb_nota_id_aluno` int(11) DEFAULT NULL,
  `tb_nota_periodo` varchar(50) NOT NULL,
  `tb_nota_nota` varchar(10) NOT NULL,
  `tb_nota_data_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tb_nota_id`),
  KEY `FK_tb_nota_turma` (`tb_nota_turma`),
  KEY `FK_tb_nota_id_aluno` (`tb_nota_id_aluno`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_nota`
--

INSERT INTO `tb_nota` (`tb_nota_id`, `tb_nota_turma`, `tb_nota_id_aluno`, `tb_nota_periodo`, `tb_nota_nota`, `tb_nota_data_registro`) VALUES
(1, 0, 0, '3Â° semestre', '4.3', '2018-11-25 03:59:39'),
(2, 0, 0, '3° semestre', '4.3', '2018-11-25 13:50:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano_de_aula`
--

DROP TABLE IF EXISTS `tb_plano_de_aula`;
CREATE TABLE IF NOT EXISTS `tb_plano_de_aula` (
  `tb_plano_de_aula_id_plano_de_aula` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tb_plano_de_aula_id_turma` int(11) DEFAULT NULL,
  `tb_plano_de_aula_tema` varchar(250) NOT NULL,
  `tb_plano_de_aula_data` date NOT NULL,
  `tb_plano_de_aula_conteudo` varchar(150) NOT NULL,
  `tb_plano_de_aula_metodologia_de_ensino` varchar(600) DEFAULT NULL,
  `tb_plano_de_aula_objetivo` varchar(600) DEFAULT NULL,
  `tb_plano_de_aula_recursos_necessarios` varchar(600) DEFAULT NULL,
  `tb_plano_de_aula_referencias` varchar(500) DEFAULT NULL,
  `tb_plano_de_aula_data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tb_plano_de_aula_id_plano_de_aula`),
  KEY `FK_tb_plano_de_aula_id_turma` (`tb_plano_de_aula_id_turma`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
CREATE TABLE IF NOT EXISTS `tb_turma` (
  `tb_turma_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tb_turma_nome` varchar(100) NOT NULL,
  `tb_turma_serie` varchar(50) NOT NULL,
  `tb_turma_periodo` varchar(50) NOT NULL,
  `tb_turma_qtd_alunos` varchar(100) NOT NULL,
  `tb_turma_disciplina_ministrada` varchar(70) NOT NULL,
  `tb_turma_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tb_turma_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='				';

--
-- Extraindo dados da tabela `tb_turma`
--

INSERT INTO `tb_turma` (`tb_turma_id`, `tb_turma_nome`, `tb_turma_serie`, `tb_turma_periodo`, `tb_turma_qtd_alunos`, `tb_turma_disciplina_ministrada`, `tb_turma_data`) VALUES
(2, 'turminha da mônica', '3° ano', 'vespertino', '100', 'português', '2018-11-25 13:43:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `tb_usuario_id_usuario` int(100) UNSIGNED NOT NULL,
  `tb_usuario_nome_completo` varchar(70) NOT NULL,
  `tb_usuario_data_nascimento` date NOT NULL,
  `tb_usuario_email` varchar(70) NOT NULL,
  `tb_usuario_nome_usuario` varchar(70) NOT NULL,
  `tb_usuario_senha` int(10) NOT NULL,
  `tb_usuario_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tb_usuario_id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`tb_usuario_id_usuario`, `tb_usuario_nome_completo`, `tb_usuario_data_nascimento`, `tb_usuario_email`, `tb_usuario_nome_usuario`, `tb_usuario_senha`, `tb_usuario_data`) VALUES
(11, 'joão', '1985-02-01', 'joao@gmail.com', 'jojó', 124578, '2018-11-25 12:11:55'),
(12, 'Róbson', '1985-02-01', 'joao@gmail.com', 'zezé', 124578, '2018-11-25 12:35:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
