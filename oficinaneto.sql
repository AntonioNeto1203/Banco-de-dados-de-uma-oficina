-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/04/2024 às 23:37
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `oficinaneto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoriaservico`
--

CREATE TABLE `categoriaservico` (
  `codigo` int(10) NOT NULL,
  `codigoFuncionario` int(10) UNSIGNED ZEROFILL NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `orcamento` decimal(8,2) NOT NULL,
  `maoObra` decimal(7,2) NOT NULL,
  `pecas` varchar(50) NOT NULL,
  `diasUteis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categoriaservico`
--

INSERT INTO `categoriaservico` (`codigo`, `codigoFuncionario`, `categoria`, `orcamento`, `maoObra`, `pecas`, `diasUteis`) VALUES
(30, 0000000005, 'Mudança de pintura', 1200.00, 1000.00, 'tinta: R$200.00', '5 dias'),
(31, 0000000002, 'Troca de óleo do motor', 85.00, 50.00, 'Oléo: R$34.99', '1 dia'),
(32, 0000000003, 'Adição de bodyKit', 12000.00, 2000.00, 'BodyKit: R$10000.00', '30 dias'),
(33, 0000000005, 'Alinhamento e balanceamento', 50.00, 50.00, 'Nenhuma peça extra', '2 dias'),
(34, 0000000004, 'Troca de pneu', 425.00, 24.99, 'Kit Pneu: R$400.00', '1 dia'),
(35, 0000000001, 'Troca de filtros', 130.00, 30.00, 'Filtro Novo: R$99.99', '1 dia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `CPF`, `celular`) VALUES
(0000000011, 'Jefferson Coutinho', '82605212509', '83992530912'),
(0000000012, 'Cleber Santos', '02598537409', '83991283419'),
(0000000013, 'Maria Joana', '81346825805', '83998256712'),
(0000000014, 'Junior Silva', '62809237812', '83994602158'),
(0000000015, 'Julia Simões', '09679310340', '83994210941');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(10) UNSIGNED ZEROFILL NOT NULL,
  `nome` varchar(50) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `celular` varchar(11) NOT NULL,
  `salario` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `CPF`, `celular`, `salario`) VALUES
(0000000001, 'Matheus Lima', '73898231210', '83982310672', 4100.00),
(0000000002, 'Lucas Wanderley', '92530739091', '83989478162', 4000.00),
(0000000003, 'Antonio Neto', '05826509212', '83981267568', 3200.00),
(0000000004, 'Helo Wanderley', '07303498681', '83983410946', 2500.00),
(0000000005, 'Guilherme Franca', '83608347601', '83982317423', 2000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `manutencao`
--

CREATE TABLE `manutencao` (
  `codigo` int(10) NOT NULL,
  `codigoFuncionario` int(10) UNSIGNED ZEROFILL NOT NULL,
  `idVeiculo` int(10) NOT NULL,
  `codigoCategoria` int(10) NOT NULL,
  `descricaoServ` varchar(100) NOT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `manutencao`
--

INSERT INTO `manutencao` (`codigo`, `codigoFuncionario`, `idVeiculo`, `codigoCategoria`, `descricaoServ`, `dataInicio`, `dataFinal`) VALUES
(41, 0000000003, 24, 32, 'Adição de um bodyKit no Nissan GTR', '2024-04-01', '2024-05-01'),
(42, 0000000002, 22, 31, 'Troca de oléo do motor do Honda Civic Type-R', '2024-04-02', '2024-04-03'),
(43, 0000000001, 23, 35, 'Troca do filtro do Toyota Supra', '2024-04-04', '2024-04-05'),
(44, 0000000005, 25, 33, 'Alinhamento e Balanceamento da BMW M4', '2024-04-08', '2024-04-09'),
(45, 0000000004, 26, 34, 'Troca dos pneus da Porshe 911 Turbo S', '2024-04-10', '2024-04-11'),
(46, 0000000005, 27, 33, 'Alinhamento e Balanceamento da Lamborghini Aventador SVJ', '2024-04-12', '2024-04-14'),
(47, 0000000003, 28, 32, 'Adição do bodyKit na Ferrari 488 Pista', '2024-05-02', '2024-06-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id` int(10) NOT NULL,
  `codigoCliente` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int(5) NOT NULL,
  `placa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`id`, `codigoCliente`, `marca`, `modelo`, `ano`, `placa`) VALUES
(22, 0000000014, 'Honda', 'Type-r', 2020, 'QYR0G89'),
(23, 0000000011, 'Toyota', 'Supra', 1995, 'ABC123'),
(24, 0000000012, 'Nissan', 'GT-R', 2019, 'XYZ456'),
(25, 0000000013, 'BMW', 'M4', 2022, 'DEF789'),
(26, 0000000014, 'Porsche', '911 Turbo S', 2020, 'GHI012'),
(27, 0000000015, 'Lamborghini', 'Aventador SVJ', 2021, 'LMN345'),
(28, 0000000012, 'Ferrari', '488 Pista', 2019, 'FER001');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoriaservico`
--
ALTER TABLE `categoriaservico`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoFuncionario` (`codigoFuncionario`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices de tabela `manutencao`
--
ALTER TABLE `manutencao`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoFuncionario` (`codigoFuncionario`),
  ADD KEY `idVeiculo` (`idVeiculo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigoCliente` (`codigoCliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `categoriaservico`
--
ALTER TABLE `categoriaservico`
  ADD CONSTRAINT `categoriaservico_ibfk_1` FOREIGN KEY (`codigoFuncionario`) REFERENCES `funcionario` (`codigo`);

--
-- Restrições para tabelas `manutencao`
--
ALTER TABLE `manutencao`
  ADD CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`codigoFuncionario`) REFERENCES `funcionario` (`codigo`),
  ADD CONSTRAINT `manutencao_ibfk_2` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`id`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`codigoCliente`) REFERENCES `cliente` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
