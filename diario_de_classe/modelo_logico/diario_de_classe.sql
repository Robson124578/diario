-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 09-Nov-2018 às 19:50
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
-- Database: `diario_de_classe`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
CREATE TABLE IF NOT EXISTS `tb_aluno` (
  `matricula` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `telefone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `id_turma_aluno_fk` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_anotacao`
--

DROP TABLE IF EXISTS `tb_anotacao`;
CREATE TABLE IF NOT EXISTS `tb_anotacao` (
  `id_anotacao` int(11) NOT NULL,
  `id_professor` int(11) DEFAULT NULL,
  `anotacao` varchar(200) DEFAULT NULL,
  `data_anotacao` date DEFAULT NULL,
  PRIMARY KEY (`id_anotacao`),
  KEY `id_professor_anotacao_sk` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_chamada`
--

DROP TABLE IF EXISTS `tb_chamada`;
CREATE TABLE IF NOT EXISTS `tb_chamada` (
  `id_chamada` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `presente` varchar(200) DEFAULT NULL,
  `ausente` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_chamada`),
  KEY `id_matricula_chamada_fk` (`matricula`),
  KEY `id_turma_chamada_fk` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE IF NOT EXISTS `tb_login` (
  `id_professor` int(11) NOT NULL,
  `nome_usuario` varchar(200) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notas`
--

DROP TABLE IF EXISTS `tb_notas`;
CREATE TABLE IF NOT EXISTS `tb_notas` (
  `id_nota` int(11) NOT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `nota` float DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_turma_nota_fk` (`id_turma`),
  KEY `id_matricula_nota_fk` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano_de_aula`
--

DROP TABLE IF EXISTS `tb_plano_de_aula`;
CREATE TABLE IF NOT EXISTS `tb_plano_de_aula` (
  `id_plano_de_aula` int(11) NOT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `tema` varchar(200) DEFAULT NULL,
  `objetivo` varchar(200) DEFAULT NULL,
  `conteudo` varchar(200) DEFAULT NULL,
  `metodologia_de_ensino` varchar(200) DEFAULT NULL,
  `recursos_necessários` varchar(200) DEFAULT NULL,
  `referencias` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_plano_de_aula`),
  KEY `id_turma_plano_de_aula_fk` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
CREATE TABLE IF NOT EXISTS `tb_turma` (
  `id_turma` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `serie` varchar(200) DEFAULT NULL,
  `qtd_alunos` int(11) DEFAULT NULL,
  `disciplina_ministrada` varchar(200) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `id_professor_turma_fk` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD CONSTRAINT `id_turma_aluno_fk` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_anotacao`
--
ALTER TABLE `tb_anotacao`
  ADD CONSTRAINT `id_professor_anotacao_sk` FOREIGN KEY (`id_professor`) REFERENCES `tb_usuario` (`id_professor`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_chamada`
--
ALTER TABLE `tb_chamada`
  ADD CONSTRAINT `id_matricula_chamada_fk` FOREIGN KEY (`matricula`) REFERENCES `tb_aluno` (`matricula`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_turma_chamada_fk` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `id_professor_login_fk` FOREIGN KEY (`id_professor`) REFERENCES `tb_usuario` (`id_professor`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_notas`
--
ALTER TABLE `tb_notas`
  ADD CONSTRAINT `id_matricula_nota_fk` FOREIGN KEY (`matricula`) REFERENCES `tb_aluno` (`matricula`),
  ADD CONSTRAINT `id_turma_nota_fk` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_plano_de_aula`
--
ALTER TABLE `tb_plano_de_aula`
  ADD CONSTRAINT `id_turma_plano_de_aula_fk` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `id_professor_turma_fk` FOREIGN KEY (`id_professor`) REFERENCES `tb_usuario` (`id_professor`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
