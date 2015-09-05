-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 05/09/2015 às 06:05
-- Versão do servidor: 5.5.44-0ubuntu0.14.10.1
-- Versão do PHP: 5.5.12-2ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `advogados`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `id` int(11) unsigned NOT NULL,
  `action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ações';

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendas`
--

CREATE TABLE IF NOT EXISTS `agendas` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL COMMENT 'responsavel',
  `created_user_id` int(11) unsigned DEFAULT NULL COMMENT 'criado por',
  `process_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` text,
  `initial` datetime NOT NULL,
  `final` datetime NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agendas';

-- --------------------------------------------------------

--
-- Estrutura para tabela `audiences_types`
--

CREATE TABLE IF NOT EXISTS `audiences_types` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos de Audiências';

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) unsigned NOT NULL,
  `label_id` int(11) unsigned DEFAULT NULL,
  `company` tinyint(1) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `fantasy_name` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_office` varchar(50) DEFAULT NULL COMMENT 'cargo',
  `perfil` varchar(20) NOT NULL COMMENT 'cliente, contato',
  `cnpj` varchar(20) DEFAULT NULL,
  `ie` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `comments` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contatos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_address`
--

CREATE TABLE IF NOT EXISTS `contacts_address` (
  `id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'comercial, pessoal',
  `zip` varchar(9) NOT NULL,
  `address` varchar(200) NOT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contatos Endereços';

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_emails`
--

CREATE TABLE IF NOT EXISTS `contacts_emails` (
  `id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contatos Emails';

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_phones`
--

CREATE TABLE IF NOT EXISTS `contacts_phones` (
  `id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `number` varchar(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contatos Telefones';

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacts_sites`
--

CREATE TABLE IF NOT EXISTS `contacts_sites` (
  `id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `site` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contatos Sites';

-- --------------------------------------------------------

--
-- Estrutura para tabela `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documentos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(11) unsigned NOT NULL,
  `label_id` int(11) unsigned DEFAULT NULL,
  `number` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pastas';

-- --------------------------------------------------------

--
-- Estrutura para tabela `foros`
--

CREATE TABLE IF NOT EXISTS `foros` (
  `id` int(11) unsigned NOT NULL,
  `foro` varchar(10) NOT NULL,
  `local` varchar(100) NOT NULL,
  `zip` varchar(9) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Foro';

-- --------------------------------------------------------

--
-- Estrutura para tabela `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Etiquetas';

-- --------------------------------------------------------

--
-- Estrutura para tabela `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) unsigned NOT NULL,
  `type` varchar(30) NOT NULL COMMENT 'Ata, Andamento, ...',
  `action` varchar(30) NOT NULL COMMENT 'Trabalhista, Civil, ...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links';

-- --------------------------------------------------------

--
-- Estrutura para tabela `offices`
--

CREATE TABLE IF NOT EXISTS `offices` (
  `id` int(11) unsigned NOT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `ccm` varchar(20) DEFAULT NULL,
  `oab` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `phone_2` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `zip` varchar(9) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Escritório';

-- --------------------------------------------------------

--
-- Estrutura para tabela `processes`
--

CREATE TABLE IF NOT EXISTS `processes` (
  `id` int(11) unsigned NOT NULL,
  `folder_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL COMMENT 'cliente',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT 'advogado',
  `created_user_id` int(11) unsigned DEFAULT NULL COMMENT 'criado por',
  `vara_id` int(11) unsigned DEFAULT NULL,
  `foro_id` int(11) unsigned DEFAULT NULL,
  `action_id` int(11) unsigned DEFAULT NULL,
  `label_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `qualification` varchar(20) NOT NULL COMMENT 'cliente: requerente, requerido',
  `number` varchar(100) NOT NULL COMMENT 'numero do processo',
  `judgment` int(10) unsigned DEFAULT NULL COMMENT 'juizo',
  `link` varchar(255) DEFAULT NULL COMMENT 'link no tribunal',
  `object` text,
  `value` decimal(15,2) DEFAULT NULL COMMENT 'valor da causa',
  `distributed` date DEFAULT NULL COMMENT 'distribuido em',
  `observations` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Processos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `processes_involves`
--

CREATE TABLE IF NOT EXISTS `processes_involves` (
  `id` int(11) unsigned NOT NULL,
  `process_id` int(11) unsigned NOT NULL,
  `label_id` int(11) unsigned DEFAULT NULL,
  `company` tinyint(1) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `fantasy_name` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `contact_office` varchar(50) DEFAULT NULL COMMENT 'cargo',
  `qualification` varchar(20) NOT NULL COMMENT 'requerente, requerido',
  `cnpj` varchar(20) DEFAULT NULL,
  `ie` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Processos Envolvidos';

-- --------------------------------------------------------

--
-- Estrutura para tabela `processes_involves_address`
--

CREATE TABLE IF NOT EXISTS `processes_involves_address` (
  `id` int(11) unsigned NOT NULL,
  `processes_involve_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'comercial, pessoal',
  `zip` varchar(9) NOT NULL,
  `address` varchar(200) NOT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Processos Envolvidos Endereços';

-- --------------------------------------------------------

--
-- Estrutura para tabela `processes_involves_emails`
--

CREATE TABLE IF NOT EXISTS `processes_involves_emails` (
  `id` int(11) unsigned NOT NULL,
  `processes_involve_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Processos Envolvidos Emails';

-- --------------------------------------------------------

--
-- Estrutura para tabela `processes_involves_phones`
--

CREATE TABLE IF NOT EXISTS `processes_involves_phones` (
  `id` int(11) unsigned NOT NULL,
  `processes_involve_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `number` varchar(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Processos Envolvidos Telefones';

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL,
  `role` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `permissions` text COMMENT 'json com nome de controllers e actions'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Permissões';

--
-- Fazendo dump de dados para tabela `roles`
--

INSERT INTO `roles` (`id`, `role`, `name`, `permissions`) VALUES
(1, 'administrador', 'Administrador', '["Roles\\/edit","Roles\\/delete","Roles\\/add","Roles\\/index","Roles\\/view","Users\\/edit","Users\\/delete","Users\\/add","Users\\/index","Users\\/view"]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `locale` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `calendar` datetime NOT NULL,
  `hour` time NOT NULL,
  `currency` decimal(10,2) NOT NULL,
  `numeral` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tests`
--

INSERT INTO `tests` (`id`, `name`, `slug`, `text`, `locale`, `date`, `calendar`, `hour`, `currency`, `numeral`, `status`, `created`, `modified`) VALUES
(2, 'bJORGE JARDIM', 'teste', 'teste', 'pt_BR', '2015-08-21', '2015-08-21 18:50:00', '18:50:00', 213.00, 123, 1, '2015-08-21 18:51:21', '2015-09-04 06:14:29'),
(3, 'cJORGE JARDIM', 'teste', 'teste', 'pt_BR', '2015-08-21', '2015-08-21 18:50:00', '18:50:00', 213.00, 123, 1, '2015-08-21 18:51:21', '2015-09-04 06:14:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  `label_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `auth_token` varchar(64) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Usuários';

--
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `label_id`, `name`, `email`, `password`, `auth_token`, `status`, `created`, `modified`) VALUES
(1, 1, NULL, 'Jorge Jardim', 'jorge@jorgejardim.com.br', 'Hs@|dDRyNXpqag==', 'c8e60825-fee9-437e-b08e-8deab49fa8f5', 1, '2015-09-05 05:54:16', '2015-09-05 06:01:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `varas`
--

CREATE TABLE IF NOT EXISTS `varas` (
  `id` int(11) unsigned NOT NULL,
  `vara` varchar(10) NOT NULL,
  `local` varchar(100) NOT NULL,
  `zip` varchar(9) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Varas';

-- --------------------------------------------------------

--
-- Estrutura para tabela `witnesses`
--

CREATE TABLE IF NOT EXISTS `witnesses` (
  `id` int(11) unsigned NOT NULL,
  `created_user_id` int(11) unsigned DEFAULT NULL COMMENT 'criado por',
  `label_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Testemunhas';

-- --------------------------------------------------------

--
-- Estrutura para tabela `witnesses_address`
--

CREATE TABLE IF NOT EXISTS `witnesses_address` (
  `id` int(11) unsigned NOT NULL,
  `witness_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'comercial, pessoal',
  `zip` varchar(9) NOT NULL,
  `address` varchar(200) NOT NULL,
  `complement` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Testemunhas Endereços';

-- --------------------------------------------------------

--
-- Estrutura para tabela `witnesses_emails`
--

CREATE TABLE IF NOT EXISTS `witnesses_emails` (
  `id` int(11) unsigned NOT NULL,
  `witness_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Testemunhas Emails';

-- --------------------------------------------------------

--
-- Estrutura para tabela `witnesses_phones`
--

CREATE TABLE IF NOT EXISTS `witnesses_phones` (
  `id` int(11) unsigned NOT NULL,
  `witness_id` int(11) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `number` varchar(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Testemunhas Telefones';

-- --------------------------------------------------------

--
-- Estrutura para tabela `zip_tracks`
--

CREATE TABLE IF NOT EXISTS `zip_tracks` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `initial` varchar(9) NOT NULL,
  `final` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faixas de CEP';

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_user_id` (`created_user_id`),
  ADD KEY `process_id` (`process_id`);

--
-- Índices de tabela `audiences_types`
--
ALTER TABLE `audiences_types`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_id` (`label_id`);

--
-- Índices de tabela `contacts_address`
--
ALTER TABLE `contacts_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Índices de tabela `contacts_emails`
--
ALTER TABLE `contacts_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Índices de tabela `contacts_phones`
--
ALTER TABLE `contacts_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Índices de tabela `contacts_sites`
--
ALTER TABLE `contacts_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Índices de tabela `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_id` (`label_id`);

--
-- Índices de tabela `foros`
--
ALTER TABLE `foros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `created_user_id` (`created_user_id`),
  ADD KEY `vara_id` (`vara_id`),
  ADD KEY `foro_id` (`foro_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `label_id` (`label_id`);

--
-- Índices de tabela `processes_involves`
--
ALTER TABLE `processes_involves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_id` (`process_id`),
  ADD KEY `label_id` (`label_id`);

--
-- Índices de tabela `processes_involves_address`
--
ALTER TABLE `processes_involves_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processes_involve_id` (`processes_involve_id`);

--
-- Índices de tabela `processes_involves_emails`
--
ALTER TABLE `processes_involves_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processes_involve_id` (`processes_involve_id`);

--
-- Índices de tabela `processes_involves_phones`
--
ALTER TABLE `processes_involves_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processes_involve_id` (`processes_involve_id`);

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `label_id` (`label_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Índices de tabela `varas`
--
ALTER TABLE `varas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `witnesses`
--
ALTER TABLE `witnesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_user_id` (`created_user_id`),
  ADD KEY `label_id` (`label_id`);

--
-- Índices de tabela `witnesses_address`
--
ALTER TABLE `witnesses_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `witness_id` (`witness_id`);

--
-- Índices de tabela `witnesses_emails`
--
ALTER TABLE `witnesses_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `witness_id` (`witness_id`);

--
-- Índices de tabela `witnesses_phones`
--
ALTER TABLE `witnesses_phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `witness_id` (`witness_id`);

--
-- Índices de tabela `zip_tracks`
--
ALTER TABLE `zip_tracks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `audiences_types`
--
ALTER TABLE `audiences_types`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contacts_address`
--
ALTER TABLE `contacts_address`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contacts_emails`
--
ALTER TABLE `contacts_emails`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contacts_phones`
--
ALTER TABLE `contacts_phones`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contacts_sites`
--
ALTER TABLE `contacts_sites`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `foros`
--
ALTER TABLE `foros`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processes`
--
ALTER TABLE `processes`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processes_involves`
--
ALTER TABLE `processes_involves`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processes_involves_address`
--
ALTER TABLE `processes_involves_address`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processes_involves_emails`
--
ALTER TABLE `processes_involves_emails`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `processes_involves_phones`
--
ALTER TABLE `processes_involves_phones`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `varas`
--
ALTER TABLE `varas`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `witnesses`
--
ALTER TABLE `witnesses`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `witnesses_address`
--
ALTER TABLE `witnesses_address`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `witnesses_emails`
--
ALTER TABLE `witnesses_emails`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `witnesses_phones`
--
ALTER TABLE `witnesses_phones`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `zip_tracks`
--
ALTER TABLE `zip_tracks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `agendas`
--
ALTER TABLE `agendas`
  ADD CONSTRAINT `agendas_created_users` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `agendas_processes` FOREIGN KEY (`process_id`) REFERENCES `processes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `agendas_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `contacts_address`
--
ALTER TABLE `contacts_address`
  ADD CONSTRAINT `contacts_address_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contacts_emails`
--
ALTER TABLE `contacts_emails`
  ADD CONSTRAINT `contacts_emails_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contacts_phones`
--
ALTER TABLE `contacts_phones`
  ADD CONSTRAINT `contacts_phones_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contacts_sites`
--
ALTER TABLE `contacts_sites`
  ADD CONSTRAINT `contacts_sites_contacts` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_acoes` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_contatos` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `processes_created_users` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_folders` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`),
  ADD CONSTRAINT `processes_foros` FOREIGN KEY (`foro_id`) REFERENCES `foros` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_varas` FOREIGN KEY (`vara_id`) REFERENCES `varas` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `processes_involves`
--
ALTER TABLE `processes_involves`
  ADD CONSTRAINT `processes_involves_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `processes_involves_processes` FOREIGN KEY (`process_id`) REFERENCES `processes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `processes_involves_address`
--
ALTER TABLE `processes_involves_address`
  ADD CONSTRAINT `processes_involves_address_processes_involves` FOREIGN KEY (`processes_involve_id`) REFERENCES `processes_involves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `processes_involves_emails`
--
ALTER TABLE `processes_involves_emails`
  ADD CONSTRAINT `processes_involves_emails_processes_involves` FOREIGN KEY (`processes_involve_id`) REFERENCES `processes_involves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `processes_involves_phones`
--
ALTER TABLE `processes_involves_phones`
  ADD CONSTRAINT `processes_involves_phones_processes_involves` FOREIGN KEY (`processes_involve_id`) REFERENCES `processes_involves` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `witnesses`
--
ALTER TABLE `witnesses`
  ADD CONSTRAINT `witnesses_created_users` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `witnesses_labels` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `witnesses_address`
--
ALTER TABLE `witnesses_address`
  ADD CONSTRAINT `witnesses_address_witnesses` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `witnesses_emails`
--
ALTER TABLE `witnesses_emails`
  ADD CONSTRAINT `witnesses_emails_witnesses` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `witnesses_phones`
--
ALTER TABLE `witnesses_phones`
  ADD CONSTRAINT `witnesses_phones_witnesses` FOREIGN KEY (`witness_id`) REFERENCES `witnesses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
