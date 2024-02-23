-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/11/2023 às 01:40
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_appchef`
--
CREATE DATABASE IF NOT EXISTS `db_appchef` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_appchef`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE `avaliacao` (
  `ID_Avaliacao` tinyint(4) NOT NULL,
  `Cod_Receita` tinyint(4) NOT NULL,
  `Nota_Avaliacao` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacao`
--

INSERT INTO `avaliacao` (`ID_Avaliacao`, `Cod_Receita`, `Nota_Avaliacao`) VALUES
(1, 1, 10.00),
(2, 2, 9.00),
(3, 3, 6.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE `chef` (
  `ID_Chef` tinyint(4) NOT NULL,
  `Email_Chef` varchar(100) NOT NULL,
  `Senha_Chef` varchar(20) NOT NULL,
  `Tel_Chef` bigint(14) NOT NULL,
  `Nome_Chef` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `chef`
--

INSERT INTO `chef` (`ID_Chef`, `Email_Chef`, `Senha_Chef`, `Tel_Chef`, `Nome_Chef`) VALUES
(1, 'erickjacquin@db.com', '159753', 31996599659, 'Érick Jacquin'),
(2, 'henriquefogaça@db.com', '957153', 31985656585, 'Henrique Fogaça'),
(3, 'paolacarosella@db.com', '854123', 31995741425, 'Paola Carosella');

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `ID_Comentarios` tinyint(4) NOT NULL,
  `Cod_Receita` tinyint(4) NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`ID_Comentarios`, `Cod_Receita`, `Descricao`) VALUES
(1, 1, 'Um irresistível bolo de chocolate, úmido e indulgente, perfeito para os amantes de doce.'),
(2, 2, 'Um clássico bolo de fubá, com sua textura macia e sabor reconfortante, ideal para um café da tarde especial.'),
(3, 3, 'Um bolo natural, leve e saudável, repleto de ingredientes frescos e sabores puros para uma opção nutritiva.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhar_receita`
--

DROP TABLE IF EXISTS `detalhar_receita`;
CREATE TABLE `detalhar_receita` (
  `Cod_Receita` tinyint(4) NOT NULL,
  `Cod_Ingredientes` tinyint(4) NOT NULL,
  `Qnt_Ingredientes` float(50,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `detalhar_receita`
--

INSERT INTO `detalhar_receita` (`Cod_Receita`, `Cod_Ingredientes`, `Qnt_Ingredientes`) VALUES
(1, 6, 300.00),
(2, 8, 2.00),
(3, 1, 2.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE `ingredientes` (
  `Cod_Ingrediente` tinyint(4) NOT NULL,
  `Nom_Ingrediente` varchar(100) DEFAULT NULL,
  `Medida_Ingrediente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ingredientes`
--

INSERT INTO `ingredientes` (`Cod_Ingrediente`, `Nom_Ingrediente`, `Medida_Ingrediente`) VALUES
(1, 'Leite', '2 xícaras'),
(2, 'Ovo', '3 unidades'),
(3, 'Farinha de Trigo', '2 xícaras'),
(4, 'Óleo', '2 colheres de sopa'),
(5, 'Açucar', '2 xícaras'),
(6, 'Chocolate', '300 gramas'),
(7, 'Sal', 'à gosto'),
(8, 'Fubá', '2 xícaras'),
(9, 'Fermento', '50 gramas'),
(10, 'Polvilho', '1 xícaras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `ID_Login` tinyint(4) NOT NULL,
  `ID_Chef` tinyint(4) NOT NULL,
  `Data_Hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `receita`
--

DROP TABLE IF EXISTS `receita`;
CREATE TABLE `receita` (
  `Cod_Receita` tinyint(4) NOT NULL,
  `Modo_Preparo` varchar(250) NOT NULL,
  `Tipo_Receita` varchar(250) NOT NULL,
  `Nome_Receita` varchar(250) NOT NULL,
  `Qta_Pessoas_Servidas` tinyint(4) NOT NULL,
  `Tipo_Servir` varchar(100) DEFAULT NULL,
  `Tempo_Total_Preparo` time NOT NULL,
  `Nota_Receita` float(10,2) NOT NULL,
  `Comentarios` varchar(250) DEFAULT NULL,
  `Foto_Receita` blob DEFAULT NULL,
  `ID_Chef` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `receita`
--

INSERT INTO `receita` (`Cod_Receita`, `Modo_Preparo`, `Tipo_Receita`, `Nome_Receita`, `Qta_Pessoas_Servidas`, `Tipo_Servir`, `Tempo_Total_Preparo`, `Nota_Receita`, `Comentarios`, `Foto_Receita`, `ID_Chef`) VALUES
(1, 'Receita de bolo simples e prático.', 'Assado', 'Bolo de Fubá', 5, 'Sirva em fatias.', '01:00:00', 10.00, 'Delicioso!', 0x6e756c6c, 3),
(2, 'Receita de bolo simples e prático.', 'Assado', 'Bolo de Chocolate', 5, 'Sirva em fatias.', '01:00:00', 9.00, 'Muito bom!', 0x6e756c6c, 2),
(3, 'Receita de bolo simples e prático.', 'Assado', 'Bolo', 5, 'Sirva em fatias.', '01:00:00', 6.00, 'Razoável', 0x6e756c6c, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_receita`
--

DROP TABLE IF EXISTS `tipo_receita`;
CREATE TABLE `tipo_receita` (
  `ID_Registro` tinyint(4) NOT NULL,
  `Desc_Tipo_Receita` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_servir`
--

DROP TABLE IF EXISTS `tipo_servir`;
CREATE TABLE `tipo_servir` (
  `ID_Servir` tinyint(4) NOT NULL,
  `Desc_Tipo_Servir` text NOT NULL,
  `Tipo_Servir` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_servir`
--

INSERT INTO `tipo_servir` (`ID_Servir`, `Desc_Tipo_Servir`, `Tipo_Servir`) VALUES
(1, 'Rende 10 fatias.', 'Sirva em Fatias.'),
(2, 'Rende 8 pedaços.', 'Sirva em Fatias.'),
(3, 'Rende 3 porções.', 'Sirva em Fatias.');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`ID_Avaliacao`),
  ADD KEY `FK_Receita_Avalicao` (`Cod_Receita`);

--
-- Índices de tabela `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`ID_Chef`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_Comentarios`),
  ADD KEY `FK_Receita_Comentarios` (`Cod_Receita`);

--
-- Índices de tabela `detalhar_receita`
--
ALTER TABLE `detalhar_receita`
  ADD PRIMARY KEY (`Cod_Receita`);

--
-- Índices de tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`Cod_Ingrediente`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_Login`);

--
-- Índices de tabela `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`Cod_Receita`),
  ADD KEY `FK_RECEITA_CHEF` (`ID_Chef`);

--
-- Índices de tabela `tipo_receita`
--
ALTER TABLE `tipo_receita`
  ADD PRIMARY KEY (`ID_Registro`);

--
-- Índices de tabela `tipo_servir`
--
ALTER TABLE `tipo_servir`
  ADD PRIMARY KEY (`ID_Servir`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `FK_Receita_Avalicao` FOREIGN KEY (`Cod_Receita`) REFERENCES `receita` (`Cod_Receita`);

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_Receita_Comentarios` FOREIGN KEY (`Cod_Receita`) REFERENCES `receita` (`Cod_Receita`);

--
-- Restrições para tabelas `detalhar_receita`
--
ALTER TABLE `detalhar_receita`
  ADD CONSTRAINT `FK_Detalhar_Receita_Receita` FOREIGN KEY (`Cod_Receita`) REFERENCES `receita` (`Cod_Receita`),
  ADD CONSTRAINT `FK_Receita_Detalhar_Receita` FOREIGN KEY (`Cod_Receita`) REFERENCES `receita` (`Cod_Receita`);

--
-- Restrições para tabelas `receita`
--
ALTER TABLE `receita`
  ADD CONSTRAINT `FK_RECEITA_CHEF` FOREIGN KEY (`ID_Chef`) REFERENCES `chef` (`ID_Chef`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
