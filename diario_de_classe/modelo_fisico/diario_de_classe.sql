-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 19-Nov-2018 às 18:41
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
-- Estrutura da tabela `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
CREATE TABLE IF NOT EXISTS `tb_aluno` (
  `aluno_id_aluno` int(200) NOT NULL AUTO_INCREMENT,
  `aluno_nome` varchar(50) NOT NULL,
  `aluno_id_turma` int(200) NOT NULL,
  `aluno_email` varchar(30) NOT NULL,
  `aluno_telefone` int(30) NOT NULL,
  `aluno_data` date NOT NULL,
  PRIMARY KEY (`aluno_id_aluno`),
  KEY `fk_aluno/turma` (`aluno_id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_chamada`
--

DROP TABLE IF EXISTS `tb_chamada`;
CREATE TABLE IF NOT EXISTS `tb_chamada` (
  `chamada_id_chamda` int(200) NOT NULL AUTO_INCREMENT,
  `chamada_id_aluno` int(200) NOT NULL,
  `chamada_id_turma` int(200) NOT NULL,
  `chamada_pressenca` tinyint(1) NOT NULL,
  `chamada_data` date NOT NULL,
  PRIMARY KEY (`chamada_id_chamda`),
  KEY `id_aluno` (`chamada_id_aluno`),
  KEY `fk_chamada/turma` (`chamada_id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE IF NOT EXISTS `tb_login` (
  `login_id_login` int(200) NOT NULL AUTO_INCREMENT,
  `login_id_usuario` int(30) NOT NULL,
  `login_nome_usuario` varchar(30) NOT NULL,
  `login_senha` int(30) NOT NULL,
  `login_data` date NOT NULL,
  PRIMARY KEY (`login_id_login`),
  KEY `fk_login/usuario` (`login_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nota`
--

DROP TABLE IF EXISTS `tb_nota`;
CREATE TABLE IF NOT EXISTS `tb_nota` (
  `nota_id_nota` bigint(255) NOT NULL AUTO_INCREMENT,
  `nota_id_aluno` int(200) NOT NULL,
  `nota_id_turma` int(200) NOT NULL,
  `nota_nota` int(20) NOT NULL,
  PRIMARY KEY (`nota_id_nota`),
  KEY `fk_notas/IdAluno` (`nota_id_aluno`),
  KEY `fk_notas/turma` (`nota_id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de Notas e avaliações.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano_de_aula`
--

DROP TABLE IF EXISTS `tb_plano_de_aula`;
CREATE TABLE IF NOT EXISTS `tb_plano_de_aula` (
  `tb_plano_de_aula_id_plano_de_aula` int(200) NOT NULL AUTO_INCREMENT,
  `tb_plano_de_aula_id_turma` int(30) NOT NULL,
  `tb_plano_de_aula_tema` varchar(30) NOT NULL,
  `tb_plano_de_aula_conteudo` longtext NOT NULL,
  `tb_plano_de_aula_metodologia_de_ensino` varchar(100) NOT NULL,
  `tb_plano_de_aula_objetivo` varchar(100) NOT NULL,
  `tb_plano_de_aula_recursos_necessarios` varchar(100) NOT NULL,
  `tb_plano_de_aula_referencias` varchar(100) NOT NULL,
  `tb_plano_de_aula_data` date NOT NULL,
  PRIMARY KEY (`tb_plano_de_aula_id_plano_de_aula`),
  KEY `fk_planos_de_aula/turma` (`tb_plano_de_aula_id_turma`)
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
  `id_usuario` int(200) NOT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `fk_turma/usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela referente a turma do usuário';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
CREATE TABLE IF NOT EXISTS `tb_usuario` (
  `tb_usuario_id_usuario` int(200) NOT NULL AUTO_INCREMENT,
  `tb_usuario_nome` varchar(30) NOT NULL,
  `tb_usuario_data_nascimento` date NOT NULL,
  `tb_usuario_email` varchar(30) NOT NULL,
  `tb_usuario_data` date NOT NULL,
  PRIMARY KEY (`tb_usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabela de dados de usuário.';

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_aluno`
--
ALTER TABLE `tb_aluno`
  ADD CONSTRAINT `fk_aluno/turma` FOREIGN KEY (`aluno_id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_anotacao`
--
ALTER TABLE `tb_anotacao`
  ADD CONSTRAINT `fk_anotacoes/usuario` FOREIGN KEY (`anotacao_id_usuario`) REFERENCES `tb_usuario` (`tb_usuario_id_usuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_chamada`
--
ALTER TABLE `tb_chamada`
  ADD CONSTRAINT `fk_chamada/turma` FOREIGN KEY (`chamada_id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_chamada_ibfk_1` FOREIGN KEY (`chamada_id_aluno`) REFERENCES `tb_aluno` (`aluno_id_aluno`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `fk_login/usuario` FOREIGN KEY (`login_id_usuario`) REFERENCES `tb_usuario` (`tb_usuario_id_usuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD CONSTRAINT `fk_notas/IdAluno` FOREIGN KEY (`nota_id_aluno`) REFERENCES `tb_aluno` (`aluno_id_aluno`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notas/turma` FOREIGN KEY (`nota_id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_plano_de_aula`
--
ALTER TABLE `tb_plano_de_aula`
  ADD CONSTRAINT `fk_planos_de_aula/turma` FOREIGN KEY (`tb_plano_de_aula_id_turma`) REFERENCES `tb_turma` (`id_turma`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `fk_turma/usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`tb_usuario_id_usuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
