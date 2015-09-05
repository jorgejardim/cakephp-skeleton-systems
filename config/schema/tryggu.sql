-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 27/07/2015 às 03:33
-- Versão do servidor: 5.5.44-0ubuntu0.14.10.1
-- Versão do PHP: 5.5.12-2ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tryggu`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `locale` varchar(7) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `sort` int(10) unsigned DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `categories`
--

INSERT INTO `categories` (`id`, `domain_id`, `locale`, `name`, `slug`, `description`, `type`, `sort`, `status`) VALUES
(2, 1, NULL, 'Categoria 1', 'categoria-1', 'Descrição da Categoria', 'blog', 1, 1),
(3, 1, NULL, 'Categoria 2', 'categoria-2', 'Descrição da Categoria 2', 'blog', 2, 1),
(4, 1, NULL, 'Categoria 3', 'categoria-3', 'Descrição da Categoria 3', 'blog', 1, 1),
(5, 1, 'pt_BR', 'Gestão de Projetos', 'gestao-de-projetos', NULL, 'videos', NULL, 1),
(6, 1, 'pt_BR', 'Coaching', 'coaching', NULL, 'videos', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) unsigned NOT NULL,
  `domain_id` int(11) unsigned NOT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `template_id` int(11) unsigned DEFAULT NULL,
  `locale_related_id` int(11) unsigned DEFAULT NULL,
  `locale` varchar(7) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` text,
  `slug` varchar(100) DEFAULT NULL,
  `excerpt` text,
  `content` longtext,
  `images` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `contents`
--

INSERT INTO `contents` (`id`, `domain_id`, `parent_id`, `user_id`, `template_id`, `locale_related_id`, `locale`, `name`, `title`, `slug`, `excerpt`, `content`, `images`, `comments`, `sort`, `type`, `password`, `auxiliary`, `auxiliary_2`, `start`, `end`, `metadata`, `status`, `created`, `modified`) VALUES
(1, 1, NULL, NULL, NULL, NULL, 'pt_BR', NULL, 'Quem Somos', 'quem-somos', NULL, 'Lorem ipsum dolor sit amet, oblique postulant vix te. Labores nostrum pri cu. In nibh soluta epicuri pro. In audire iisque viderer pri, cum ut theophrastus disputationi. Hinc viris has in, ea nam quidam petentium deseruisse.<br><br>Ut semper molestie sed, sed sale apeirian constituto ne. Ex graeco deleniti efficiantur pro, mel facilis salutatus eu. Per ad adipisci efficiendi theophrastus, habeo mundi explicari et sed. Lorem nihil equidem eam ei. Audiam dolorem has et, ea platonem sapientem ius, alia quas ullamcorper ut eam. Et quodsi fuisset moderatius mel. Erant mundi dissentiunt id sit.<br><br>Alii deseruisse concludaturque et mei, sit te explicari accommodare. Te est unum nemore persius, posse nullam volutpat te vim. Facete tibique pro an, mel te recteque persequeris, no quo munere salutatus. An simul dictas everti est, has suas perfecto te, ne errem viris sed.<br><br>Ornatus definiebas nam eu. Quodsi denique adipisci vel eu. Ut autem euismod sed, vix ex iriure assentior disputationi. Id atomorum cotidieque eum, no modo disputationi per.<br><br>Posse nostro dolores id cum. Legere dolores ad mei, choro dicam nam ad. Epicurei antiopam eam an. Ad meis tantas pri.', '1/pages/1/Eric_Chartiot_Imagem_Principal_20150628.png', 'yes', NULL, 'page', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-07-24 22:06:13', '2015-07-25 01:10:01'),
(2, 1, NULL, 1, NULL, NULL, 'pt_BR', NULL, 'Blog', 'blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis. Pellentesque cursus arcu id magna euismod in elementum purus molestie.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis. Pellentesque cursus arcu id magna euismod in elementum purus molestie.', 'Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.Aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.<br><br>Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.Aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.<br><br>Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.<br><br>Nemo enim ipsam voluptatem quia voluptas sit aspernatur.Aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur.<br>', '1/blog/2/Eric_Chartiot_Imagem_Principal_20150628.png', 'yes', NULL, 'blog', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-07-25 01:38:38', '2015-07-25 06:17:16'),
(3, 1, NULL, 1, NULL, NULL, 'pt_BR', NULL, 'Blog3', 'blog3', 'esdfasd', 'asdfasdfasdf', '1/blog/3/no-photo.png', 'yes', NULL, 'blog', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-07-25 05:26:10', '2015-07-25 05:36:01'),
(4, 1, NULL, NULL, NULL, NULL, 'pt_BR', NULL, 'sdfasdf', 'sdfasdf', 'asdfasdfasdf', NULL, '1/sliders/4/logo.png', 'yes', 7, 'sliders', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-07-26 01:02:18', '2015-07-26 01:02:18'),
(5, 1, NULL, NULL, NULL, NULL, 'pt_BR', NULL, 'eqfqwef', 'eqfqwef', 'qwefqwefqwe', NULL, '1/sliders/5/images.jpeg', 'yes', 2, 'sliders', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2015-07-26 01:10:04', '2015-07-26 01:10:04'),
(6, 1, NULL, NULL, NULL, NULL, 'pt_BR', 'slider_home', 'werqwerqwer', 'werqwerqwer', 'qwerqwerqwerqwerq', NULL, '1/sliders/6/image2.png', 'yes', 1, 'sliders', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-07-26 01:15:02', '2015-07-26 01:15:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents_categories`
--

CREATE TABLE IF NOT EXISTS `contents_categories` (
  `id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `category_id` int(11) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `contents_categories`
--

INSERT INTO `contents_categories` (`id`, `content_id`, `category_id`, `sort`) VALUES
(8, 3, 2, NULL),
(9, 3, 4, NULL),
(11, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contents_comments`
--

CREATE TABLE IF NOT EXISTS `contents_comments` (
  `id` int(11) unsigned NOT NULL,
  `content_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `comment` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `contents_comments`
--

INSERT INTO `contents_comments` (`id`, `content_id`, `user_id`, `parent_id`, `level`, `lft`, `rght`, `name`, `email`, `comment`, `ip`, `status`, `created`, `modified`) VALUES
(13, 2, NULL, 24, 1, 2, 7, 'JORGE JARDIM', 'jorge@conteudodinamico.com.br', 'teste', '127.0.0.1', 0, '2015-07-25 14:56:40', '2015-07-25 14:56:40'),
(14, 2, NULL, NULL, 0, 9, 10, 'JORGE JARDIM', 'jorge@conteudodinamico.com.br', 'O trecho padrão original de Lorem Ipsum, usado desde o século XVI, está reproduzido abaixo para os interessados. Seções 1.10.32 e 1.10.33 de "de Finibus Bonorum et Malorum" de.\r\n\r\nCicero também foram reproduzidas abaixo em sua forma exata original, acompanhada das versões para o inglês da tradução feita por H. Rackham em 1914.', '127.0.0.1', 0, '2015-07-25 14:57:18', '2015-07-25 21:58:29'),
(15, 2, NULL, 13, 2, 3, 4, 'JORGE JARDIM 2', 'jorge@conteudodinamico.com.br', 'dfasdfasdfads', '127.0.0.1', 0, '2015-07-25 15:27:14', '2015-07-25 15:27:14'),
(16, 2, NULL, 13, 2, 5, 6, 'JORGE JARDIM 2', 'jorge@conteudodinamico.com.br', 'asdfasdfsdf', '127.0.0.1', 0, '2015-07-25 15:31:21', '2015-07-25 15:31:21'),
(24, 2, NULL, NULL, 0, 1, 8, 'JORGE JARDIM', 'jorge@conteudodinamico.com.br', 'stste', '127.0.0.1', 0, '2015-07-25 14:28:48', '2015-07-25 14:28:48');

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
  `level` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL COMMENT 'top, header, sidebar_left, sidebar_right, footer, bottom, ...',
  `target` varchar(20) DEFAULT NULL COMMENT 'self, iframe, blank, ...',
  `type` varchar(20) DEFAULT NULL COMMENT 'external, force_download, ...',
  `locale` varchar(7) NOT NULL DEFAULT 'pt_BR',
  `sort` int(10) unsigned DEFAULT NULL,
  `access` varchar(20) DEFAULT NULL COMMENT 'public, private, ...',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `menus`
--

INSERT INTO `menus` (`id`, `domain_id`, `parent_id`, `level`, `lft`, `rght`, `title`, `slug`, `link`, `position`, `target`, `type`, `locale`, `sort`, `access`, `status`) VALUES
(1, 1, NULL, NULL, 1, 10, 'Menu Header', 'menu-header', NULL, NULL, NULL, NULL, 'pt_BR', NULL, NULL, 1),
(4, 1, 1, 1, 2, 3, 'Home', 'home', '/', NULL, NULL, NULL, 'pt_BR', NULL, NULL, 1),
(5, 1, 1, 1, 4, 5, 'Quem Somos', 'quem-somos', 'quem-somos', NULL, NULL, NULL, 'pt_BR', NULL, NULL, 1),
(6, 1, 1, 1, 6, 7, 'Blog', 'blog', '/blog', NULL, NULL, NULL, 'pt_BR', NULL, NULL, 1),
(7, 1, 1, 1, 8, 9, 'Contato', 'contato', '/contato', NULL, NULL, NULL, 'pt_BR', NULL, NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `options`
--

INSERT INTO `options` (`id`, `domain_id`, `name`, `value`, `autoload`) VALUES
(2, 1, 'site_name', 'Tryggu', 1),
(3, 1, 'site_description', 'Site Tryggu', 1),
(4, 1, 'social_facebook', 'https://www.facebook.com/', 1),
(5, 1, 'social_twitter', 'https://twitter.com/?lang=pt', 1),
(6, 1, 'social_google_plus', 'https://plus.google.com/', 1),
(7, 1, 'social_pinterest', 'https://br.pinterest.com/', 1),
(10, 1, 'site_logo', 'logo.gif', 1),
(12, 1, 'social_linkedin', 'https://br.linkedin.com/', 1),
(13, 1, 'social_youtube', 'https://www.youtube.com/?hl=pt&gl=BR', 1),
(14, 1, 'social_dribbble', 'https://dribbble.com/', 1),
(15, 1, 'footer_text', '<p>Todos os direitos reservados &copy; Tryggu | By <a class="ln-tr" href="http://www.jdig.com.br/" target="_blank">JDig</a></p>', 1),
(16, 1, 'header_text', '<ul class="clearfix">\r\n                            <li class="fl"><i class="fa fa-phone"></i><span class="text">Telefone: 11 55555-55555</span></li>\r\n                            <li class="fl divider"><span>|</span></li>\r\n                            <li class="fl"><i class="fa fa-envelope"></i><span class="text">E-mail: <a href="mailto:email@gmail.com">email@gmail.com</a></span></li>\r\n                        </ul>', 1),
(17, 1, 'social_vimeo', 'https://vimeo.com/', 1),
(18, 1, 'google_metatag', '<meta name="google-site-verification" content="asdfASDFADFsdfr9hE5lF4V9hYCGnQsXiTxWF03_zhfmk" />', 1),
(19, 1, 'google_analytics', '<script>\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-12341234-1'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n</script>', 1),
(20, 1, 'robots_txt', 'User-agent: *\r\nDisallow:', 1),
(21, 1, 'contact_email', 'jorge@conteudodinamico.com.br', 1),
(22, 1, 'contact_information', 'Av. Paulista, 2345\r\n1º Andar, Conj 20\r\nCEP 02469-020', 1),
(23, 1, 'contact_latitude', '-23.5636279', 1),
(24, 1, 'contact_longitude', '-46.6537184', 1);

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
(1, NULL, 'Jorge', 'jorge@jorgejardim.com.br', 'jorge@jorgejardim.com.br', 'Hs@|dDRyNXpqag==', 'oauth-provider', 'oauth-uid', 'pt_BR', 'root', NULL, 'b92d1324-5a1a-425e-a291-25439dec0086', 1, '2015-05-30 07:16:18', '2015-07-27 02:29:20');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_id` (`domain_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `locale_related_id` (`locale_related_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Índices de tabela `contents_categories`
--
ALTER TABLE `contents_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices de tabela `contents_comments`
--
ALTER TABLE `contents_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Índices de tabela `contents_ratings`
--
ALTER TABLE `contents_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices de tabela `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Índices de tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `domain_id` (`domain_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Índices de tabela `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_id` (`domain_id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domain_id` (`domain_id`);

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
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `oauth_uid` (`oauth_uid`),
  ADD KEY `password` (`password`),
  ADD KEY `oauth_provider` (`oauth_provider`),
  ADD KEY `status` (`status`),
  ADD KEY `domain_id` (`domain_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `contents_categories`
--
ALTER TABLE `contents_categories`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de tabela `contents_comments`
--
ALTER TABLE `contents_comments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
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
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
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
  ADD CONSTRAINT `contents_ratings_contents` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contents_ratings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
