-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/10/2023 às 01:33
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
-- Banco de dados: `db_empresa`
--
CREATE DATABASE IF NOT EXISTS `db_empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_empresa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `Cod_cargo` tinyint(4) NOT NULL,
  `Nom_cargo` varchar(100) NOT NULL,
  `Val_salario_base` float(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `formação_escolar`
--

DROP TABLE IF EXISTS `formação_escolar`;
CREATE TABLE `formação_escolar` (
  `Cod_Formacao` tinyint(4) NOT NULL,
  `Nom_Formação` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `Cod_Func` int(11) NOT NULL,
  `Nom_Func` varchar(50) NOT NULL,
  `Val_Salario` float(8,2) DEFAULT NULL,
  `Cod_Cargo` tinyint(4) NOT NULL,
  `Cod_Formacao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE `projeto` (
  `Cod_Projeto` smallint(6) NOT NULL,
  `Nom_Projeto` varchar(100) NOT NULL,
  `Dta_Inicio` date NOT NULL,
  `Dta_Fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
CREATE TABLE `trabalha_em` (
  `Cod_Trabalha_Em` int(11) NOT NULL,
  `Cod_Func` int(11) NOT NULL,
  `Cod_Projeto` smallint(6) NOT NULL,
  `Num_Total_Horas` decimal(7,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`Cod_cargo`);

--
-- Índices de tabela `formação_escolar`
--
ALTER TABLE `formação_escolar`
  ADD PRIMARY KEY (`Cod_Formacao`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`Cod_Func`),
  ADD KEY `FK_Cargo_Funcionario` (`Cod_Cargo`),
  ADD KEY `FK_Formação_Escolar_Funcionario` (`Cod_Formacao`);

--
-- Índices de tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Cod_Projeto`);

--
-- Índices de tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`Cod_Trabalha_Em`),
  ADD KEY `FK_Funcionario_Trabalha_Em` (`Cod_Func`),
  ADD KEY `FK_Projeto_Trabalha_Em` (`Cod_Projeto`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FK_Cargo_Funcionario` FOREIGN KEY (`Cod_Cargo`) REFERENCES `cargo` (`Cod_cargo`),
  ADD CONSTRAINT `FK_Formação_Escolar_Funcionario` FOREIGN KEY (`Cod_Formacao`) REFERENCES `formação_escolar` (`Cod_Formacao`);

--
-- Restrições para tabelas `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `FK_Funcionario_Trabalha_Em` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`),
  ADD CONSTRAINT `FK_Projeto_Trabalha_Em` FOREIGN KEY (`Cod_Projeto`) REFERENCES `projeto` (`Cod_Projeto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
