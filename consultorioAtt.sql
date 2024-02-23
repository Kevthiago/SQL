-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/11/2023 às 00:26
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
-- Banco de dados: `consultorio`
--
CREATE DATABASE IF NOT EXISTS `consultorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `consultorio`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta` (
  `Cod_Consulta` int(11) NOT NULL,
  `Dta_Consulta` datetime NOT NULL,
  `Val_Consulta` decimal(20,2) DEFAULT NULL,
  `Cod_Medico` int(11) NOT NULL,
  `Cod_Paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`Cod_Consulta`, `Dta_Consulta`, `Val_Consulta`, `Cod_Medico`, `Cod_Paciente`) VALUES
(1, '2023-11-01 08:00:00', 165.00, 2, 2),
(2, '2023-11-01 09:00:00', 220.00, 1, 3),
(3, '2023-11-01 10:00:00', 275.00, 3, 1),
(4, '2023-12-01 10:00:00', 275.00, 1, 3),
(5, '2023-12-01 08:00:00', 165.00, 2, 2),
(6, '2024-01-01 08:00:00', 165.00, 2, 2),
(7, '2024-01-01 10:00:00', 275.00, 1, 3),
(8, '2023-12-01 14:00:00', 220.00, 3, 1),
(9, '2024-01-01 14:00:00', 220.00, 3, 1),
(10, '2024-02-01 08:00:00', 275.00, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade` (
  `Cod_Especialidade` smallint(6) NOT NULL,
  `Nom_Especialidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`Cod_Especialidade`, `Nom_Especialidade`) VALUES
(1, 'Neurocirugião'),
(2, 'Dermatoogista'),
(3, 'Cirurgião Geral'),
(4, 'Pediatra'),
(5, 'Anestesiologista');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `Cod_Medico` int(11) NOT NULL,
  `Nom_Medico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`Cod_Medico`, `Nom_Medico`) VALUES
(1, 'Kevin'),
(2, 'Jucelio'),
(3, 'Vitor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico_especialidade`
--

DROP TABLE IF EXISTS `medico_especialidade`;
CREATE TABLE `medico_especialidade` (
  `Cod_Medico_Especialidade` int(11) NOT NULL,
  `Cod_Medico` int(11) NOT NULL,
  `Cod_Especialidade` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico_especialidade`
--

INSERT INTO `medico_especialidade` (`Cod_Medico_Especialidade`, `Cod_Medico`, `Cod_Especialidade`) VALUES
(1, 1, 2),
(2, 2, 5),
(3, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `Cod_Paciente` int(11) NOT NULL,
  `Nom_Paciente` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`Cod_Paciente`, `Nom_Paciente`) VALUES
(1, 'Gabriel'),
(2, 'Felipe'),
(3, 'Richard');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`Cod_Consulta`),
  ADD KEY `FK_Medico_Consulta` (`Cod_Medico`),
  ADD KEY `FK_Paciente_Consulta` (`Cod_Paciente`);

--
-- Índices de tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`Cod_Especialidade`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`Cod_Medico`);

--
-- Índices de tabela `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD PRIMARY KEY (`Cod_Medico_Especialidade`),
  ADD KEY `FK_Especialidade_Medico_Especialidade` (`Cod_Medico`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Cod_Paciente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK_Medico_Consulta` FOREIGN KEY (`Cod_Medico`) REFERENCES `medico` (`Cod_Medico`),
  ADD CONSTRAINT `FK_Paciente_Consulta` FOREIGN KEY (`Cod_Paciente`) REFERENCES `paciente` (`Cod_Paciente`);

--
-- Restrições para tabelas `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD CONSTRAINT `FK_Especialidade_Medico_Especialidade` FOREIGN KEY (`Cod_Medico`) REFERENCES `medico` (`Cod_Medico`),
  ADD CONSTRAINT `FK_Medico_Medico_Especialidade` FOREIGN KEY (`Cod_Medico`) REFERENCES `medico` (`Cod_Medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
