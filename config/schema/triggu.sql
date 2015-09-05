-- phpMyAdmin SQL Dump
-- version 4.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 20/07/2015 às 23:51
-- Versão do servidor: 5.5.43-0ubuntu0.14.04.1-log
-- Versão do PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `triggu`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(10) unsigned NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `categories`
--

INSERT INTO `categories` (`id`, `domain_id`, `name`, `slug`, `description`, `sort`, `status`) VALUES
(2, 1, 'Categoria 1', 'categoria-1', 'Descrição da Categoria', 1, 1),
(3, 1, 'Categoria 2', 'categoria-2', 'Descrição da Categoria 2', 2, 2),
(4, 1, 'Categoria 3', 'categoria-3', 'Descrição da Categoria 3', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `template_id` int(11) unsigned DEFAULT NULL,
  `locale_related_id` int(11) unsigned DEFAULT NULL,
  `locale` varchar(7) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` text,
  `slug` varchar(100) DEFAULT NULL,
  `excerpt` text,
  `content` longtext,
  `comments` varchar(20) DEFAULT 'yes' COMMENT 'yes, no, logged, ...',
  `sort` int(10) unsigned DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'post',
  `password` varchar(20) DEFAULT NULL,
  `auxiliary` varchar(255) DEFAULT NULL,
  `auxiliary_2` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `metadata` text,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents_categories`
--

CREATE TABLE IF NOT EXISTS `contents_categories` (
  `id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents_comments`
--

CREATE TABLE IF NOT EXISTS `contents_comments` (
  `id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents_ratings`
--

CREATE TABLE IF NOT EXISTS `contents_ratings` (
  `id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `value` int(1) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT 'User main - Contractor',
  `name` varchar(200) NOT NULL,
  `fantasy_name` varchar(200) DEFAULT NULL,
  `cnpj_cpf` varchar(20) NOT NULL,
  `is_company` tinyint(1) unsigned NOT NULL COMMENT 'pessoa fisica ou juridica',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `contracts`
--

INSERT INTO `contracts` (`id`, `user_id`, `name`, `fantasy_name`, `cnpj_cpf`, `is_company`, `status`) VALUES
(1, 1, 'Triggu Demo', NULL, '123456', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) unsigned NOT NULL,
  `contract_id` int(11) unsigned NOT NULL,
  `domain` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `domains`
--

INSERT INTO `domains` (`id`, `contract_id`, `domain`) VALUES
(1, 1, 'localhost');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL COMMENT 'top, header, sidebar_left, sidebar_right, footer, bottom, ...',
  `target` varchar(20) DEFAULT NULL COMMENT 'self, iframe, blank, ...',
  `type` varchar(20) DEFAULT NULL COMMENT 'external, force_download, ...',
  `locale` varchar(7) NOT NULL DEFAULT 'pt_BR',
  `sort` int(10) unsigned NOT NULL,
  `access` varchar(20) NOT NULL DEFAULT 'public' COMMENT 'public, private, ...',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `menus`
--

INSERT INTO `menus` (`id`, `domain_id`, `parent_id`, `title`, `slug`, `link`, `position`, `target`, `type`, `locale`, `sort`, `access`, `status`) VALUES
(1, 1, NULL, 'Menu', 'menu', '#', 'header', '', '', 'pt_BR', 1, 'public', 1),
(2, 1, 1, 'Sub Menu 1', 'sub-menu-1', '#', 'header', '', '', 'pt_BR', 1, 'public', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `module` varchar(30) NOT NULL COMMENT 'site, juridico, hotel, curso, cursos, projetos',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `modules`
--

INSERT INTO `modules` (`id`, `domain_id`, `module`, `status`) VALUES
(1, 1, 'site', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `autoload` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `options`
--

INSERT INTO `options` (`id`, `domain_id`, `name`, `value`, `autoload`) VALUES
(1, 1, 'Opção', '12', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `metadata` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `templates`
--

INSERT INTO `templates` (`id`, `domain_id`, `name`, `metadata`) VALUES
(1, 1, 'Template 1', 'metadata');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `domain_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `oauth_provider` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `oauth_uid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `locale` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'pt_BR',
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `activation` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`id`, `domain_id`, `name`, `email`, `username`, `password`, `oauth_provider`, `oauth_uid`, `locale`, `role`, `activation`, `auth_token`, `status`, `created`, `modified`) VALUES
(1, NULL, 'Jorge', 'jorge@jorgejardim.com.br', 'jorge@jorgejardim.com.br', 'Hs@|dDRyNXpqag==', 'oauth-provider', 'oauth-uid', 'pt_BR', 'root', NULL, 'f49d3c3a-a6ad-45c5-af8a-760996176bb7', 1, '2015-05-30 07:16:18', '2015-07-20 19:50:35');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`), ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`), ADD KEY `domain_id` (`domain_id`), ADD KEY `parent_id` (`parent_id`), ADD KEY `locale_related_id` (`locale_related_id`), ADD KEY `template_id` (`template_id`);

--
-- Índices de tabela `contents_categories`
--
ALTER TABLE `contents_categories`
  ADD PRIMARY KEY (`id`), ADD KEY `content_id` (`content_id`), ADD KEY `category_id` (`category_id`);

--
-- Índices de tabela `contents_comments`
--
ALTER TABLE `contents_comments`
  ADD PRIMARY KEY (`id`), ADD KEY `content_id` (`content_id`), ADD KEY `user_id` (`user_id`), ADD KEY `parent_id` (`parent_id`);

--
-- Índices de tabela `contents_ratings`
--
ALTER TABLE `contents_ratings`
  ADD PRIMARY KEY (`id`), ADD KEY `content_id` (`content_id`), ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`), ADD KEY `contract_id` (`contract_id`);

--
-- Índices de tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`), ADD KEY `status` (`status`), ADD KEY `domain_id` (`domain_id`), ADD KEY `parent_id` (`parent_id`);

--
-- Índices de tabela `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`), ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`), ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`), ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `oauth_uid` (`oauth_uid`), ADD KEY `password` (`password`), ADD KEY `oauth_provider` (`oauth_provider`), ADD KEY `status` (`status`), ADD KEY `domain_id` (`domain_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contents_categories`
--
ALTER TABLE `contents_categories`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contents_comments`
--
ALTER TABLE `contents_comments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contents_ratings`
--
ALTER TABLE `contents_ratings`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `domains`
--
ALTER TABLE `domains`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `categories`
--
ALTER TABLE `categories`
ADD CONSTRAINT `categories_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contents`
--
ALTER TABLE `contents`
ADD CONSTRAINT `contents_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `contents_templates` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `contents_categories`
--
ALTER TABLE `contents_categories`
ADD CONSTRAINT `contents_categories_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `contents_categories_contents` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contents_comments`
--
ALTER TABLE `contents_comments`
ADD CONSTRAINT `contents_comments_comments` FOREIGN KEY (`parent_id`) REFERENCES `contents_comments` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `contents_comments_contents` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `contents_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contents_ratings`
--
ALTER TABLE `contents_ratings`
ADD CONSTRAINT `contents_ratings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
ADD CONSTRAINT `contents_ratings_contents` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `contracts`
--
ALTER TABLE `contracts`
ADD CONSTRAINT `contracts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Restrições para tabelas `domains`
--
ALTER TABLE `domains`
ADD CONSTRAINT `domains_contratos` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `menus`
--
ALTER TABLE `menus`
ADD CONSTRAINT `menus_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `menus_parents` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `modules`
--
ALTER TABLE `modules`
ADD CONSTRAINT `modules_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `options`
--
ALTER TABLE `options`
ADD CONSTRAINT `options_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `templates`
--
ALTER TABLE `templates`
ADD CONSTRAINT `templates_domains` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
