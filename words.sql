-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2026 at 12:33 AM
-- Server version: 8.4.6-6
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `content`, `seo_title`, `seo_description`, `seo_keywords`, `image_path`, `is_active`, `created_at`, `updated_at`, `category_id`) VALUES
(2, 'Bilingual Layouts: Designing for RTL and LTR Together', 'bilingual-layouts', '<article class=\"art-body\"><p class=\"art-lead\">A bilingual document isn\'t one layout with two languages — it\'s a design that has to read naturally in two opposite directions at once. Annual reports, menus, packaging, certificates, government forms: get the structure right and both languages feel native. Get it wrong and one always looks bolted on.</p><h2 class=\"display art-h2\">Decide the relationship first</h2><p class=\"art-p\">Before any design, decide how the two languages relate on the page. There are three common models, and the right one depends on the content and the binding.</p><div class=\"art-num\"><span class=\"art-num__n\">01</span><div class=\"art-num__txt\"><h3 class=\"art-num__h\">Mirrored / flip-book</h3><p class=\"art-p\">Arabic opens from one cover, English from the other, meeting in the middle. Common for reports and brochures. Each language gets a true, uncompromised layout in its own direction.</p></div></div><div class=\"art-num\"><span class=\"art-num__n\">02</span><div class=\"art-num__txt\"><h3 class=\"art-num__h\">Side-by-side</h3><p class=\"art-p\">Both languages on the same spread, Arabic on the right, English on the left. Good for certificates, contracts, and menus where readers compare directly.</p></div></div><div class=\"art-num\"><span class=\"art-num__n\">03</span><div class=\"art-num__txt\"><h3 class=\"art-num__h\">Stacked / sequential</h3><p class=\"art-p\">One language follows the other in the same flow. Simplest to produce, but needs care so the second language doesn\'t feel secondary.</p></div></div><h2 class=\"display art-h2\">Mirror the structure, not just the text</h2><p class=\"art-p\">In a bilingual layout the whole grid often needs to mirror: margins, gutters, the binding edge, page numbers, headers, and the direction of any diagrams or charts. Flipping only the text while leaving a left-to-right skeleton is the most common bilingual mistake — the Arabic reads correctly but sits in a frame that fights it.</p><h2 class=\"display art-h2\">Pair the type with intent</h2><div class=\"art-feat\"><span class=\"art-feat__mark\" aria-hidden=\"true\"></span><div><h3 class=\"art-feat__h\">Matched weight and tone</h3><p class=\"art-p\">The Arabic and Latin typefaces should feel like siblings — similar weight, contrast, and personality — so neither side looks heavier or more important than the other.</p></div></div><div class=\"art-feat\"><span class=\"art-feat__mark\" aria-hidden=\"true\"></span><div><h3 class=\"art-feat__h\">Aligned baselines and sizing</h3><p class=\"art-p\">Arabic and Latin have different natural sizes at the same point value. We tune size and baseline so the two languages feel balanced side by side, not mismatched.</p></div></div><div class=\"art-feat\"><span class=\"art-feat__mark\" aria-hidden=\"true\"></span><div><h3 class=\"art-feat__h\">Consistent color and hierarchy</h3><p class=\"art-p\">Headings, captions, and emphasis should map across both languages so a reader switching sides finds the same structure waiting for them.</p></div></div><h2 class=\"display art-h2\">Handle the in-line mixing</h2><p class=\"art-p\">Even in a “monolingual” Arabic block, Latin runs appear — brand names, URLs, model numbers, scientific terms. Proper bidirectional handling keeps these in the right place and direction. The same applies in reverse for Arabic terms inside English text. This is detail work, and it\'s where rushed bilingual files fall apart.</p><h2 class=\"display art-h2\">The test of a good bilingual layout</h2><p class=\"art-p\">Cover one language and the other should look like it was designed entirely on its own. Neither should read as a translation grafted onto a foreign grid. When both halves feel native, the document earns trust in both audiences at once — which is the entire point of going bilingual.</p><div class=\"art-outro\"><div class=\"art-outro__inner\"><h3 class=\"display art-outro__h\">Designing something in two languages?</h3><p class=\"art-outro__x\">We design and produce bilingual Arabic-English documents that read natively in both directions — reports, packaging, menus, and more.</p></div></div></article>', NULL, NULL, NULL, 'cms/articles/t6gk0Hc2BTLTmxr7z3VMnne4OrY3YGYqoi6g3xvm.png', 1, '2026-05-26 01:05:13', '2026-06-06 11:35:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `is_active`, `created_at`, `updated_at`, `seo_title`, `seo_description`, `seo_keywords`) VALUES
(1, 'General', 'general', 1, '2026-05-26 13:16:23', '2026-06-01 21:14:36', 'General', 'General', 'General');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_people` json DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_code`, `name`, `email`, `phone`, `agency`, `currency`, `notes`, `contact_people`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 'C_00001', 'Mohamed Taha', 'mohammad.taha@tarjama.com', '+962 7 9353 3343', 'Tarjama', 'USD', 'USD 0.5/Slide (DTP_L0)\r\nUSD 1/Slide (DTP_L1)\r\nUSD 2/Slide (DTP_L2)', '[{\"name\": \"Mohammad Taha\", \"email\": \"mohammad.taha@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Mahmoud Siyam\", \"email\": \"mahmoud.siyam@tarjama.com\", \"notes\": \"Project Coordinator\"}, {\"name\": \"Muna Siam\", \"email\": \"muna.siam@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Rand Shihab\", \"email\": \"Rand.Shihab@tarjama.com\", \"notes\": \"Assistant Project Lead\"}, {\"name\": \"Zain Rababah\", \"email\": \"zain.rababah@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Yaroub AlZghoul\", \"email\": \"Yaroub.AlZghoul@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Maria Abu Khader\", \"email\": \"Maria.Abu-Khader@tarjama.com\", \"notes\": \"Senior Design Manager\"}, {\"name\": \"Abdelhadi Abuhijleh\", \"email\": \"abdelhadi.abuhijleh@tarjama.com\", \"notes\": \"Senior Project Lead\"}, {\"name\": \"Anas Al Hakawati\", \"email\": \"anas.alhakawati@tarjama.com\", \"notes\": \"Ops Team Lead\"}, {\"name\": \"Nizar Abdelhaleem\", \"email\": \"Nizar.Abdelhaleem@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Samar AbuAloush\", \"email\": \"Samar.AbuAloush@tarjama.com\", \"notes\": \"Project Lead\"}, {\"name\": \"Rania Shadid\", \"email\": \"rania.shadid@tarjama.com\", \"notes\": \"Sr. Project Coordinator\"}, {\"name\": \"Elena Istrati\", \"email\": \"elena.istrati@tarjama.com\", \"notes\": \"Senior Vendor Manager & Support Specialist\"}, {\"name\": \"Nouran Zoghly   (Vendor Relation)\", \"email\": \"vendor.relations@tarjama.com\", \"notes\": \"Senior Vendor Manager\"}]', 1, '2026-01-27 08:46:38', '2026-04-22 07:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `client_invoices`
--

CREATE TABLE `client_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `client_po_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_partners`
--

CREATE TABLE `client_partners` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_partners`
--

INSERT INTO `client_partners` (`id`, `name`, `image_path`, `order`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Coursera', 'clients/d9613f0d-2f4d-4f68-9c61-44d25f299bde.webp', 0, 1, '2026-01-10 11:19:05', '2026-01-10 11:19:05'),
(3, 'CISCO', 'clients/372c8b36-7d7e-4ec2-a5a6-018e4ac9b763.webp', 0, 1, '2026-01-10 11:19:13', '2026-01-10 11:19:13'),
(4, 'Cigna', 'clients/fce4fc0f-c5b7-439a-a90e-2857a5f97c87.webp', 0, 1, '2026-01-10 11:19:21', '2026-01-10 11:19:21'),
(5, 'Ford', 'clients/1391d1a2-80a0-4186-91bf-723bf627a081.webp', 0, 1, '2026-01-10 11:19:32', '2026-01-10 11:19:32'),
(7, 'IKON', 'clients/6a5528fd-36fa-4cad-bfce-0cf3cadca423.webp', 0, 1, '2026-01-10 11:19:55', '2026-01-10 11:19:55'),
(10, 'Microsoft', 'clients/a791f0fe-5664-4cf0-8c7e-4a8cac2b12f5.webp', 0, 1, '2026-01-10 11:20:29', '2026-01-10 11:20:29'),
(11, 'Phzer', 'clients/b7c1d896-5df6-400f-80f4-12ae0ecb340e.webp', 0, 1, '2026-01-10 11:20:39', '2026-01-10 11:20:39'),
(13, 'Saudi Vision 2030', 'clients/e7782064-e52b-4efd-9469-957c31220d43.webp', 0, 1, '2026-01-10 11:21:03', '2026-01-10 11:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `client_pos`
--

CREATE TABLE `client_pos` (
  `id` bigint UNSIGNED NOT NULL,
  `task_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_20` date NOT NULL,
  `date_80` date NOT NULL,
  `payment_20` decimal(10,2) NOT NULL,
  `payment_80` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_po_service`
--

CREATE TABLE `client_po_service` (
  `client_po_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_capitals`
--

CREATE TABLE `company_capitals` (
  `id` bigint UNSIGNED NOT NULL,
  `total_capital_egp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_capital_usd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `temporary_capital_egp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `temporary_capital_usd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_capital_egp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_capital_usd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_capitals`
--

INSERT INTO `company_capitals` (`id`, `total_capital_egp`, `total_capital_usd`, `temporary_capital_egp`, `temporary_capital_usd`, `emergency_capital_egp`, `emergency_capital_usd`, `created_at`, `updated_at`) VALUES
(1, '0', '0', '0', '0', '0', '0', '2026-01-21 07:30:42', '2026-05-24 00:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(56, 'Olamide Azeez', 'olamidefreelancee@gmail.com', '+498111346676', 'Application – Freelance Translator (DE/EN/FR)', 'Dear Hiring Manager,\r\n\r\nI’m a multilingual translator working with German, English, and\r\nFrench, with solid experience across legal, medical, financial, and\r\ngeneral content.\r\n\r\nBeyond translation, I also handle proofreading, MTPE, subtitling,\r\ntranscription, and LQA, using tools like Trados Studio, memoQ, Phrase,\r\nand Wordfast to ensure consistency and quality.\r\n\r\nI’d be happy to collaborate with your agency and support your projects\r\nwith reliable and accurate work.\r\n\r\nThank you for your time.\r\n\r\nKind regards,\r\nOlamide A.', '2026-05-17 04:07:25', '2026-05-17 04:07:25'),
(57, 'Shahana Malikova', 'shahanamalikova@gmail.com', '+994559755334', 'Translation', 'Dear, \r\nMy name is Shahana, and I am a professional technical translator working with English–Azerbaijani–Turkish language pairs.\r\n\r\nI specialize in technical and engineering documentation, including user manuals, technical specifications, and compliance materials. I work with SDL Trados Studio and ensure terminology consistency and high-quality localization.\r\n\r\nI would be pleased to be considered for inclusion in your vendor database for future projects.\r\nI would be happy to complete any required forms or translation tests.\r\n\r\nThank you for your time and consideration.\r\n\r\nKind regards,\r\nShahana', '2026-05-20 17:01:49', '2026-05-20 17:01:49'),
(58, 'Yosef Zekariyas', 'jossyaloefave@gmail.com', '+251911811745', 'Translator Role Job', 'Dear Words Tie,\r\n         I am writing to express my interest in collaborating with your organization on translation projects. My name is Yosef Zekariyas, and I currently serve as a translator with JW.org, a non-profit religious organization dedicated to translating Bible-based literature and multimedia into more than a thousand languages.\r\n\r\n          For over ten years, I have specialized in translating books, brochures, videos, audios, and web materials from English into Afan Oromo and Amharic. This work has honed my ability to deliver precise, culturally sensitive translations that resonate with diverse audiences.\r\n         I am eager to extend my expertise beyond my current role, as I wish to support my elderly parents by working additional hours. I believe my extensive experience, linguistic skills, and dedication to quality make me a strong candidate to assist with your translation needs.\r\n        I would welcome the opportunity to discuss how my skills can contribute to your projects. Thank you for considering my application.\r\n\r\n                                                                                             Sincerely,\r\n                                                                                         Yosef Zekariyas', '2026-05-22 20:39:16', '2026-05-22 20:39:16'),
(59, 'King Robson', 'robson.king8@hotmail.com', '7857146995', 'Dear words-tie.com Webmaster!', 'Hi,\r\n\r\nIt is 2026 — and human written content is still the KING of SEO.\r\n\r\nNow imagine this:\r\n\r\nWhat happens to your website if you publish one high-quality 2000-word SEO content every single day?\r\n\r\nOver time, your website becomes a SUPER authority website in your industry with Huge Organic Traffic and leads.\r\n\r\nAnd we don’t stop with content.\r\n\r\nWe also build backlinks directly to every newly created article to strengthen rankings even faster.\r\n\r\nWe call this Everyday SEO OR “Take A Small Step Everyday” SEO\r\n\r\nBecause small consistent SEO actions create massive long-term growth.\r\n\r\nWe offer 3 plans. Ready to grow your website authority consistently?\r\n\r\nClick here to choose your Content SEO Plan. https://supersupportstaff.com/s/?site=words-tie.com\r\n\r\n– Hire SEO Geek', '2026-05-23 23:53:48', '2026-05-23 23:53:48'),
(60, 'aaaa', 'admin@words-tie.com', '+123 45 678 9201', 'sss', 'sssssssssssssssssssssssssssssssss', '2026-06-02 00:52:27', '2026-06-02 00:52:27'),
(61, 'Jude Loveth', 'judelovethh@gmail.com', '+34867619819', 'Professional Spanish, French & English Translator | Accurate Human Translation & Localization', 'Dear Hiring Manager,\r\n\r\nI am excited to apply for your translation project. As a professional Spanish, French, and English translator with several years of experience working with international translation agencies, I specialize in delivering accurate, culturally adapted, and high-quality translations that help businesses communicate effectively across global markets.\r\n\r\nThroughout my career, I have translated business documents, websites, marketing materials, articles, corporate communications, and multilingual content for clients from diverse industries. My focus goes beyond simple word-for-word translation I ensure that every text preserves its original meaning, tone, and intent while sounding completely natural to the target audience.\r\n\r\nWhat I can offer:\r\n\r\n• Accurate human translation without machine-generated errors\r\n• Cultural localization for Spanish and French audiences\r\n• Proofreading and quality assurance before delivery\r\n• Consistent terminology management across projects\r\n• Fast turnaround times and reliable communication\r\n• Complete confidentiality of all client materials\r\n\r\nI am proficient with industry-leading CAT tools, including SDL Trados Studio, MemoQ, Memsource, Smartcat, Wordfast Pro, Phrase, MateCat, OmegaT, and Déjà Vu, allowing me to maintain consistency and efficiency across projects.\r\n\r\nMy goal is simple: to help you reach international audiences with content that reads naturally and professionally in every language.\r\n\r\nI would welcome the opportunity to discuss your project and demonstrate how my expertise can contribute to its success.\r\n\r\nThank you for your time and consideration.\r\n\r\nKind regards,\r\n\r\nJude Loveth\r\nProfessional Spanish, French & English Translator', '2026-06-06 14:27:26', '2026-06-06 14:27:26'),
(62, 'Zita Kincade', 'zita.kincade@gmail.com', NULL, 'Hello words-tie.com Owner!', 'AI-generated code not working?\r\n\r\nWe fix apps, websites built with ChatGPT, Lovable, Claude, Cursor, Bolt and Replit.\r\n\r\n> Debugging\r\n> Feature completion\r\n> Database fixes\r\n> Deployment support\r\n> Production-ready code\r\n\r\nSend us your project and get it fixed by experienced developers.\r\n\r\nWhatsApp Now or Click to know more https://supersupportstaff.com/w/?s=words-tie.com', '2026-06-07 01:05:32', '2026-06-07 01:05:32'),
(63, 'Peace Emmanuel', 'emmanuellpeacee@gmail.com', '+4531246890', 'Translator Application', 'Dear Words Tie Team,\r\n\r\nI hope you are doing well.\r\n\r\nI am writing to express my interest in collaborating with your company as a freelance translator. I have experience in translation, proofreading, and localization across various fields, including legal, business, education, and marketing content. I am committed to delivering accurate, culturally appropriate, and high-quality translations within deadlines.\r\n\r\nI would be grateful for the opportunity to join your pool of freelance linguists. Please let me know if you require any additional information or supporting documents, and I will be happy to provide them upon request.\r\n\r\nThank you for your time and consideration. I look forward to hearing from you.\r\n\r\nKind regards,', '2026-06-08 15:00:14', '2026-06-08 15:00:14'),
(64, 'Ronaldwes', 'achf26@atomicmail.io', '81943467354', 'Possible Deal Resource for Your Site', 'Hi, we wanted to share AlwaysCheckHereFirst.com, \r\na free savings resource with thousands of online \r\noffers, deals, and discounts from popular companies. \r\nIt may be useful for your visitors, customers, or readers \r\nbefore they shop online. \r\nPlease take a quick look: https://alwayscheckherefirst.com', '2026-06-11 17:32:00', '2026-06-11 17:32:00'),
(65, 'Joanna Riggs', 'joannariggs278@gmail.com', '915416620', 'Explainer Video for words-tie.com', 'Hi,\r\n\r\nI just visited words-tie.com and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\r\n\r\nOur prices start from just $195 (USD).\r\n\r\nLet me know if you\'re interested in seeing samples of our previous work.\r\n\r\nRegards,\r\nJoanna', '2026-06-11 19:44:22', '2026-06-11 19:44:22'),
(66, 'RussellInfit', 'dianneurbayne@gmail.com', '88777662853', 'THE $27,000,000 JACKPOT IS A SYSTEM OF SUCCESS', 'How to Turn Today Into Payday With the $27,000,000 Jackpot http://bpl.kr/PKEN', '2026-06-12 00:39:27', '2026-06-12 00:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `total_usd` decimal(15,2) DEFAULT NULL,
  `total_egp` decimal(15,2) DEFAULT NULL,
  `month` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_client_invoices`
--

CREATE TABLE `finance_client_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `task_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_20` date DEFAULT NULL,
  `date_80` date DEFAULT NULL,
  `payment_20` decimal(12,2) DEFAULT NULL,
  `payment_80` decimal(12,2) DEFAULT NULL,
  `total_price` decimal(12,2) NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_freelancer_invoices`
--

CREATE TABLE `finance_freelancer_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finance_freelancer_invoices`
--

INSERT INTO `finance_freelancer_invoices` (`id`, `freelancer_code`, `task_code`, `project_name`, `page_number`, `price`, `start_date`, `payment_date`, `note`, `status`, `created_at`, `updated_at`) VALUES
(2, 'F_00001', 'T_00001', 'awdadwadwa', '22', 150.00, '2026-04-28', '2026-05-27', 'adawda', 'in_progress', '2026-05-14 22:33:32', '2026-05-14 22:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `freelancers`
--

CREATE TABLE `freelancers` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_pair` json NOT NULL,
  `quota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_hr` decimal(8,2) NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `freelancers`
--

INSERT INTO `freelancers` (`id`, `freelancer_code`, `name`, `email`, `phone`, `language_pair`, `quota`, `price_hr`, `currency`, `notes`, `created_at`, `updated_at`) VALUES
(11, 'F_00001', 'Sameh Mohamed', 'vsamehmohamed@gmail.com', '01111284831', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:33:44', '2026-05-22 05:33:44'),
(12, 'F_00002', 'I-A', 'I-A@gmail.com', '010', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:36:03', '2026-05-24 08:54:21'),
(13, 'F_00003', 'A-S', 'A-S@gmail.com', '0106', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:37:53', '2026-05-24 08:54:41'),
(14, 'F_00004', 'R-A', 'R-A@gmail.com', '0127', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:39:32', '2026-05-24 08:54:50'),
(15, 'F_00005', 'A-M', 'A-M@gmail.com', '01156', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:41:10', '2026-05-24 08:54:55'),
(16, 'F_00006', 'M-Z', 'M-Z@gmail.com', '0115', '[{\"source\": \"EN\", \"target\": \"AR\"}]', '0000', 0.00, '0000', NULL, '2026-05-22 05:42:41', '2026-05-24 08:55:03'),
(17, 'F_00007', 'Jermaine Delos - Transfective', 'jermainedelossantos@gmail.com', '+639304616411', '[{\"source\": \"English\", \"target\": \"Tagalog\"}]', '2000 words/day', 0.05, 'USD', 'Fields: Medical, Health and Wellness, UI/UX, Technology, Software, Entertainment, Video Games, eSports, iGaming/Casino\r\n\r\nWorking Days: Mo, Tu, We, Th, Fr', '2026-05-22 05:50:17', '2026-05-22 05:51:37'),
(18, 'F_00008', 'Emmanuel Ngarukiyintwali - Transfective', 'ngwemma@gmail.com', '+250788218323', '[{\"source\": \"English\", \"target\": \"French\"}, {\"source\": \"English\", \"target\": \"Kinyarwanda\"}, {\"source\": \"English\", \"target\": \"Swahili\"}, {\"source\": \"French\", \"target\": \"Spanish\"}, {\"source\": \"Russian\", \"target\": \"French\"}, {\"source\": \"English\", \"target\": \"Spanish\"}, {\"source\": \"English\", \"target\": \"Kirundi\"}, {\"source\": \"French\", \"target\": \"Kinyarwanda\"}]', '2000 words/day', 0.05, 'USD', '[ Fields: Medical, Education, Telecommunication, Gaming, etc ]\r\n-----\r\n[ English → French:\r\n  - Translation: $0.053/word | 2000 words/day\r\n  - Editing: $0.042/word | 7000 words/day\r\n  - Proofreading: $0.021/word | 7000 words/day\r\n  - Transcription: $0.021/word | 1500 words/day ] \r\n-----\r\n[ English → Kinyarwanda:\r\n  - Translation: $0.063/word | 4000 words/day\r\n  - Editing: $0.032/word | 7000 words/day\r\n  - Proofreading: $0.032/word | 7000 words/day ] \r\n-----\r\n[ English → Swahili:\r\n  - Translation: $0.053/word | 3500 words/day\r\n  - Editing: $0.032/word | 5000 words/day\r\n  - Proofreading: $0.032/word | 5000 words/day ] \r\n-----\r\n[ French → Spanish:\r\n  - Translation: $0.063/word | 3000 words/day\r\n  - Proofreading: $0.042/word | 4000 words/day ]\r\n\r\n[ Russian → French:\r\n  - Translation: $0.063/word | 2000 words/day ]\r\n-----\r\n[ English → Spanish:\r\n  - Translation: $0.053/word | 3500 words/day\r\n  - Proofreading: $0.032/word | 5000 words/day ]\r\n-----\r\n[ English → Kirundi:\r\n  - Translation: $0.063/word | 3000 words/day\r\n  - Editing: $0.042/word | 3500 words/day\r\n  - Proofreading: $0.042/word | 3500 words/day ]\r\n-----\r\n[ French→ Kinyarwanda:\r\n  - Translation: $0.053/word | 2000 words/day\r\n  - Editing: $0.032/word | 7000 words/day\r\n  - Proofreading: $0.032/word | 7000 words/day ]', '2026-05-22 06:25:50', '2026-05-22 06:33:02'),
(19, 'F_00009', 'Korkut İsisag - Transfective', 'kisisag@gmail.com', '+905326280439', '[{\"source\": \"English\", \"target\": \"Turkish\"}]', '3000 words/day', 0.03, 'USD', 'Fields: \r\n- AI training and UI/UX content\r\n- Information technology content\r\n- Patent and legal content\r\n- Technical and mechanical documentation\r\n- Medical, clinical and pedagogical materials\r\n- Finance, crypto, blockchain and marketing content\r\n- E-commerce and marketing platforms\r\n- Website and app localization\r\n\r\nEnglish → Turkish:\r\n  - Translation: $0.032/word | 3000 words/day\r\n  - Editing: $0.016/word | 3000 words/day\r\n  - Proofreading: $0.016/word | 3000 words/day\r\n  - Translation review: $0.016/word | 3000 words/day', '2026-05-22 06:40:52', '2026-05-22 06:40:52'),
(20, 'F_00010', 'Mihretab Solomon - Transfective', 'mihretabsolomon@gmail.com', '+31687792816', '[{\"source\": \"English\", \"target\": \"Amharic\"}, {\"source\": \"English\", \"target\": \"Tigrinya\"}]', '2000', 0.05, 'USD', 'Fields: Legal Medicine Politics and society; IT and telecom Education\r\n\r\nEnglish → Tigrinya:\r\n  - Translation: $0.053/word | 2000 words/day\r\n  - Editing: $0.026/word | 6000 words/day\r\n  - Proofreading: $0.026/word | 6000 words/day\r\n  - Translation review: $0.026/word | 6000 words/day\r\n\r\nEnglish → Amharic:\r\n  - Translation: $0.053/word | 2000 words/day\r\n  - Editing: $0.026/word | 6000 words/day\r\n  - Proofreading: $0.026/word | 6000 words/day\r\n  - Translation review: $0.026/word | 6000 words/day', '2026-05-22 06:46:21', '2026-05-22 06:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_invoices`
--

CREATE TABLE `freelancer_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_po_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_pos`
--

CREATE TABLE `freelancer_pos` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `payment_date` date NOT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_po_service`
--

CREATE TABLE `freelancer_po_service` (
  `freelancer_po_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_service`
--

CREATE TABLE `freelancer_service` (
  `id` bigint UNSIGNED NOT NULL,
  `freelancer_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `freelancer_service`
--

INSERT INTO `freelancer_service` (`id`, `freelancer_id`, `service_id`, `created_at`, `updated_at`) VALUES
(11, 11, 11, NULL, NULL),
(12, 12, 11, NULL, NULL),
(13, 13, 11, NULL, NULL),
(14, 14, 11, NULL, NULL),
(15, 15, 11, NULL, NULL),
(16, 16, 11, NULL, NULL),
(17, 17, 14, NULL, NULL),
(18, 18, 9, NULL, NULL),
(19, 18, 13, NULL, NULL),
(20, 18, 14, NULL, NULL),
(21, 19, 9, NULL, NULL),
(22, 19, 14, NULL, NULL),
(23, 20, 9, NULL, NULL),
(24, 20, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `freelancer_task`
--

CREATE TABLE `freelancer_task` (
  `freelancer_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `freelancer_task`
--

INSERT INTO `freelancer_task` (`freelancer_code`, `task_id`) VALUES
('F_00001', 4);

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `name`, `slug`, `description`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Military', 'military', '<p class=\"MsoNormal\">We provide precise and confidential language solutions\r\ntailored to the highly specialized needs of the military and defense sector.\r\nOur team ensures accuracy, security, and cultural sensitivity across all\r\nmission-critical content to support global communication and operational\r\nreadiness.</p><p class=\"MsoNormal\"><o:p></o:p></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We provide precise and confidential language solutions tailored to the highly sensitive nature of the defense and military sector. Accuracy, discretion, and security define every project we handle in this field.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Military and defense content demands the highest standards of precision and confidentiality. Our vetted linguists handle sensitive material with strict security and exacting accuracy, where there is no margin for error.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Defense content is highly sensitive, technically exact, and security-critical. Terminology must be precise, confidentiality is absolute, and material often combines technical specification with operational significance. Trust, discretion, and accuracy are the baseline — not the exception.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Technical documentation — specifications, manuals, and equipment material.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Official &amp; strategic — reports, agreements, and sensitive documentation.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Training material — instructional and procedural content.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Communications — official and inter-organizational correspondence.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.<span style=\"white-space:pre\">	</span>Vetted specialists — linguists experienced in defense and security content.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.<span style=\"white-space:pre\">	</span>Absolute confidentiality — strict data protection and NDA on every file.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.<span style=\"white-space:pre\">	</span>Exact terminology — precision and consistency throughout.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.<span style=\"white-space:pre\">	</span>Secure handling — controlled processes from receipt to delivery.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Defense and military translation handled with absolute precision, discretion, and security — accurate and confidential, every time.</span></p><div><br></div><p class=\"MsoNormal\"><o:p></o:p></p>', '2026-01-10 11:06:40', '2026-06-12 06:50:02'),
(2, 'Automotive', 'automotive', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help automotive brands, manufacturers, and dealerships\r\ncommunicate technical and marketing content clearly across global markets.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help automotive brands, manufacturers, and dealerships communicate technical and marketing content across languages. From owner\'s manuals to campaigns, we keep your engineering precise and your brand compelling worldwide.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Automotive content spans the technical and the creative — and both have to be right. Our linguists handle dense specifications and persuasive marketing alike, keeping terminology exact and brand voice consistent across every market.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Automotive content blends two worlds: highly technical documentation that must be exact, and marketing that must persuade. Terminology has to stay consistent across huge document sets, while brand messaging needs to feel local — a rare mix of precision and creativity in one industry.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Technical documentation — owner\'s manuals, service guides, and specs.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Marketing &amp; brand — campaigns, brochures, and dealership content.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Software &amp; interfaces — in-vehicle systems and digital content.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Training material — dealer and technician training localized.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Dual-skill linguists — technical accuracy and brand-aware writing.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Consistent terminology — uniform terms across technical document sets.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">On-brand adaptation — marketing tuned to each local audience.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Reviewed &amp; tested — technical and creative content both verified.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Automotive content that\'s technically precise and brand-compelling at once — consistent, persuasive, and right in every market.</span></p><div><br></div>', '2026-01-10 11:07:21', '2026-06-12 06:49:24'),
(3, 'Manufacturing & Engineering', 'manufacturing-engineering', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help manufacturers and engineering firms communicate\r\ncomplex technical information clearly and accurately across languages.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help manufacturers and engineering firms communicate complex technical information clearly and accurately across languages. From specifications to safety documentation, we make sure precise technical content is understood exactly as intended.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Technical documents leave no room for ambiguity, and consistent terminology is critical to safety and compliance. Our linguists understand engineering content, preserving accuracy across manuals, drawings, and specifications.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Technical content is precise, terminology-heavy, and often safety-critical. A single inconsistent term across a manual can cause errors, documents are dense with specifications and standards, and compliance depends on exactness. Consistency across large document sets is everything.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Manuals &amp; guides — operation, maintenance, and user documentation.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Specifications — technical specs, datasheets, and standards.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Safety documentation — instructions, warnings, and compliance material.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Engineering content — drawings, labels, and technical reports.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.<span style=\"white-space:pre\">	</span>Technical linguists — translators with engineering knowledge.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.<span style=\"white-space:pre\">	</span>Strict terminology control — glossaries that keep terms uniform across sets.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.<span style=\"white-space:pre\">	</span>Format-aware — manuals, tables, and drawings handled cleanly.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.<span style=\"white-space:pre\">	</span>Verified accuracy — specialist review for technical correctness.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Technical documentation that\'s accurate, consistent, and compliant — understood exactly as intended, in every language and market.</span></p><div><br></div>', '2026-01-10 11:08:56', '2026-06-12 06:48:34'),
(4, 'E-Commerce', 'e-commerce', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help online retailers and digital brands communicate\r\nclearly and effectively across global markets.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help online retailers and digital brands communicate clearly and effectively with customers worldwide. From product listings to checkout, we localize the entire shopping experience so customers buy with confidence in their own language.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Online shoppers trust what they understand. We adapt your catalog, content, and customer journey to each market — keeping descriptions accurate, persuasive, and consistent across thousands of products.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">E-commerce content is high-volume, conversion-driven, and detail-heavy. Thousands of product descriptions must stay accurate and persuasive, formats like prices and sizes differ by market, and a confusing checkout loses the sale. Scale and quality have to coexist.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Product listings — titles, descriptions, and specs at scale.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Store &amp; checkout — the full shopping journey localized for trust.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Marketing content — campaigns, emails, and promotions per market.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Formats &amp; conventions — prices, sizes, and units adapted locally.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.<span style=\"white-space:pre\">	</span>Commerce-savvy linguists — translators who write to convert.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.<span style=\"white-space:pre\">	</span>Consistency at scale — glossaries that keep large catalogs uniform.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.<span style=\"white-space:pre\">	</span>Local formats — currencies, sizes, and conventions adapted.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.<span style=\"white-space:pre\">	</span>Tested experience — the customer journey verified end to end.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">A shopping experience that feels local everywhere — accurate, persuasive, and trustworthy, turning global visitors into customers.</span></p><div><br></div>', '2026-01-10 11:09:49', '2026-06-12 06:47:55'),
(5, 'Marketing', 'marketing', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help brands communicate creatively and effectively across\r\nlanguages and cultures.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help brands communicate creatively and effectively across languages and cultures. From campaigns to content, we make sure your message persuades and resonates in every market — not just gets understood.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Marketing lives on emotion and nuance, and that\'s exactly what a literal translation loses. Our creative linguists adapt your message so it keeps its impact, stays on-brand, and connects with local audiences everywhere it runs.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Marketing content is persuasive, emotional, and culturally loaded. Puns, tone, and references rarely survive a literal translation, brand voice must stay consistent across markets, and what wins one audience can fall flat — or offend — another. It takes creative adaptation, not word-swapping.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Campaigns &amp; ads — messaging adapted to land with each audience.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Brand &amp; web content — websites, social, and copy kept on-voice everywhere.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Slogans &amp; taglines — transcreated to keep their punch in any language.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Collateral — brochures, presentations, and product messaging.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.<span style=\"white-space:pre\">	</span>Creative linguists — part translator, part copywriter.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.<span style=\"white-space:pre\">	</span>On-brand adaptation — voice and impact preserved across markets.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.<span style=\"white-space:pre\">	</span>Cultural fit — references and tone tuned to local audiences.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.<span style=\"white-space:pre\">	</span>Refine together — options and back-translation so you stay in control.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Marketing that performs in every market — emotionally resonant, culturally on-point, and unmistakably your brand, in any language.</span></p><div><br></div>', '2026-01-10 11:10:37', '2026-06-12 06:46:54'),
(6, 'Sciences', 'sciences', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help researchers, laboratories, and scientific\r\norganizations communicate complex ideas clearly across languages and cultures.</span></p>', '<div><span style=\"font-size: 18px;\">We help researchers, laboratories, and scientific organizations communicate complex information clearly across languages. From research papers to technical reports, we make rigorous science accessible to a global audience.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Scientific communication depends on precision and clarity. Our linguists understand the terminology and conventions of research, preserving accuracy while making findings readable for international readers and reviewers.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></div><div><span style=\"font-size: 18px;\">Scientific content is dense, specialized, and precise. Terminology must be exact, conventions vary by discipline, and the same paper may be read by specialists and reviewers worldwide. Clarity cannot come at the cost of accuracy — both have to hold.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\"><b>What we localize</b></span></div><div><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Research papers — journal articles, abstracts, and academic submissions.</span></div><div><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Technical reports — lab documentation, studies, and findings.</span></div><div><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Conference material — presentations, posters, and proceedings.</span></div><div><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Grants &amp; proposals — funding applications and research documentation.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\"><b>Our approach</b></span></div><div><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Field-specific linguists — translators who understand your discipline.</span></div><div><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Exact terminology — scientific conventions and accuracy maintained.</span></div><div><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Readable &amp; rigorous — clarity for global readers without losing precision.</span></div><div><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Expert review — a second specialist verifies the work.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\"><b>The result</b></span></div><div><span style=\"font-size: 18px;\">Research that travels — accurate, clear, and conventions-correct, so your findings reach and convince a global audience.</span></div><div><br></div>', '2026-01-10 11:11:23', '2026-06-12 06:46:03'),
(7, 'Legal', 'legal', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We provide precise, reliable, and culturally aware legal\r\nlanguage solutions.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We provide precise, reliable, and culturally aware legal language solutions. From contracts and agreements to court documents and compliance materials, we handle legal content with the accuracy and confidentiality it demands.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">In law, every word carries weight, and a single ambiguity can change meaning entirely. Our legal linguists understand both the language and the legal systems behind it, preserving intent and terminology with absolute care.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Legal language is exact, system-specific, and unforgiving. A term that exists in one legal system may have no direct equivalent in another, ambiguity can change obligations, and confidentiality is paramount. Faithfulness to meaning and intent matters more than literal wording.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Contracts &amp; agreements — commercial, employment, and partnership documents.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Court &amp; litigation — filings, judgments, and evidentiary documents.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Compliance — policies, regulations, and corporate governance.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸<span style=\"white-space:pre\">	</span>Certified translation — official documents where certification is required.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.<span style=\"white-space:pre\">	</span>Legal specialists — linguists who understand law and legal systems.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.<span style=\"white-space:pre\">	</span>Faithful to intent — meaning and obligation preserved precisely.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.<span style=\"white-space:pre\">	</span>Consistent terminology — validated legal glossaries throughout.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.<span style=\"white-space:pre\">	</span>Confidential handling — strict security and NDA on every file.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Legal translation you can rely on — precise, faithful to intent, and fully confidential, in every jurisdiction and language.</span></p><div><br></div>', '2026-01-10 11:12:04', '2026-06-12 06:45:08'),
(8, 'Government', 'government', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Accurate Translation of Official Documents Policies,\r\nregulations, circulars, and legal texts delivered with full linguistic and\r\ncontextual accuracy.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We support government bodies and public institutions with accurate translation of official documents — policies, regulations, circulars, and public communications — delivered with the formality and precision the public sector requires.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Public-sector language must be authoritative, consistent, and accessible to citizens. We translate sensitive official content with discretion, ensuring meaning and legal intent are preserved exactly across languages.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Government content is formal, legally significant, and often public-facing. Terminology must be consistent and authoritative, intent must be preserved exactly, and sensitive material requires discretion. The same document may need to serve both officials and ordinary citizens.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Policies &amp; regulations — laws, circulars, and official directives.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Public communications — announcements, campaigns, and citizen information.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Official documentation — reports, agreements, and administrative material.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Forms &amp; services — public-facing documents and digital services.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Qualified linguists — translators experienced in official and legal language.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Consistent terminology — authoritative, uniform phrasing across documents.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Discretion &amp; security — sensitive content handled confidentially.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Careful review — intent and accuracy verified before delivery.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Official content that\'s accurate, authoritative, and consistent — preserving legal intent and serving citizens in every language.</span></p><div><br></div>', '2026-01-10 11:12:32', '2026-06-12 06:44:28'),
(9, 'Finance', 'finance', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">In the fast-paced world of finance, clarity and precision\r\nare everything. At Words Tie, we provide finance-focused linguistic solutions\r\nthat ensure every document, report, and communication is accurate, compliant,\r\nand globally accessible.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">In the fast-paced world of finance, clarity and precision are everything. At Words Tie, we help banks, investment firms, and financial institutions communicate complex information accurately and confidentially across languages.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Financial documents leave no room for approximation. Our linguists pair language expertise with financial literacy, keeping your figures, terminology, and tone exact — and your sensitive information secure.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Financial content is precise, time-sensitive, and confidential. Numbers, terminology, and legal phrasing must be exact across every language, formatting conventions differ by market, and sensitive data demands strict protection. Errors here aren\'t just embarrassing — they\'re costly.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Reports &amp; statements — annual reports, audits, and financial statements.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Banking &amp; investment — product documents, prospectuses, and disclosures.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Compliance — regulatory and legal-financial documentation.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Corporate communications — investor relations and market-facing content.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Finance-literate linguists — translators who understand the numbers and the terms.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Exact terminology — glossaries and formats matched to each market.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Confidentiality first — strict data protection and NDA on every file.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Reviewed for accuracy — a second specialist confirms every figure and phrase.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Financial communication that\'s precise, consistent, and secure — clear in every market, with your figures and reputation intact.</span></p><div><br></div>', '2026-01-10 11:13:07', '2026-06-12 06:43:44'),
(10, 'Medical', 'medical', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help healthcare providers, pharmaceutical companies, and\r\nmedical institutions communicate clearly and accurately across languages.</span></p>', '<p class=\"MsoNormal\">We help healthcare providers, pharmaceutical companies, and medical institutions communicate accurately across languages. In medicine, a single mistranslated word can carry real consequences — so precision and expertise are non-negotiable.</p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\">Our medical linguists combine language skill with clinical knowledge, handling sensitive documentation with the accuracy, confidentiality, and regulatory awareness this field demands.</p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b>The challenge in this sector</b></p><p class=\"MsoNormal\">Medical content is high-stakes and heavily regulated. Terminology must be exact, documents often must meet strict regulatory standards, and patient-facing material has to be both accurate and understandable. There is no room for ambiguity — and confidentiality is essential throughout.</p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b>What we localize</b></p><p class=\"MsoNormal\">▸<span style=\"white-space:pre\">	</span>Clinical &amp; regulatory — trial documentation, submissions, and compliance materials.</p><p class=\"MsoNormal\">▸<span style=\"white-space:pre\">	</span>Pharmaceutical — packaging, labeling, and instructions for use.</p><p class=\"MsoNormal\">▸<span style=\"white-space:pre\">	</span>Patient-facing — records, consent forms, and information leaflets.</p><p class=\"MsoNormal\">▸<span style=\"white-space:pre\">	</span>Medical devices — manuals, interfaces, and technical documentation.</p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b>Our approach</b></p><p class=\"MsoNormal\">1.<span style=\"white-space:pre\">	</span>Specialist linguists — translators with clinical and pharmaceutical expertise.</p><p class=\"MsoNormal\">2.<span style=\"white-space:pre\">	</span>Terminology accuracy — validated medical glossaries and consistency checks.</p><p class=\"MsoNormal\">3.<span style=\"white-space:pre\">	</span>Regulatory awareness — content handled with the standards your market requires.</p><p class=\"MsoNormal\">4.<span style=\"white-space:pre\">	</span>Confidential review — expert second-pass and strict data protection.</p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b>The result</b></p><p class=\"MsoNormal\">Accurate, compliant, and confidential medical translation that protects patients, supports regulators, and earns trust in every language.</p><div><br></div>', '2026-01-10 11:13:44', '2026-06-12 06:42:21'),
(11, 'Gaming', 'gaming', '<p class=\"MsoNormal\">We bring games to life for players everywhere. Our gaming\r\nlocalization service blends linguistic expertise with cultural insight to\r\ndeliver immersive, player-first experiences across every platform.</p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We bring games to life for players everywhere. Our gaming localization service adapts every element — dialogue, interface, story, and culture — so players feel the game was made for them, in their language.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Great games create worlds, and a clumsy translation shatters the immersion instantly. Our linguists are players themselves: they preserve the humor, tone, and personality that make your game unforgettable, no matter where it\'s played.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Games are immersive, creative, and full of personality — slang, jokes, lore, and character voices that a literal translation flattens completely. Add tight UI space, voice-over timing, and cultural references that don\'t travel, and localization becomes as much creative craft as it is translation.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">In-game text &amp; dialogue — scripts and narrative adapted to keep tone and personality.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">UI &amp; menus — interface text localized to fit on-screen space and context.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Voice-over &amp; subtitles — recorded and synced for natural delivery.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Culturalization — references, humor, and content adapted for each region.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Linguists who play — translators who understand games and your genre.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Preserve the experience — tone, humor, and immersion kept intact.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Fit the constraints — text adapted to UI space and voice timing.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Test in-game — localized builds checked for context and display.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">A game that feels native to players in every market — immersive, fun, and culturally on-point, with nothing lost in translation.</span></p><p class=\"MsoNormal\"><br></p>', '2026-01-10 11:14:25', '2026-06-12 06:43:00'),
(12, 'Technology', 'technology', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Technology moves fast, and your content needs to move with\r\nit. At Words Tie, we help tech companies communicate clearly, consistently, and\r\nglobally by localizing complex digital experiences with precision and cultural\r\nfluency.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Technology moves fast, and your content needs to move with it. At Words Tie, we help software companies, SaaS platforms, and tech brands localize their products and content so they reach global users without slowing down release cycles.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">From interface strings to documentation, we combine linguistic precision with technical understanding — keeping your terminology consistent, your releases on schedule, and your users at home in their own language.</span></p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b><span style=\"font-size: 18px;\">The challenge in this sector</span></b></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Tech content is fast-moving, highly technical, and tightly coupled to the product itself. Strings have character limits, terminology must stay consistent across releases, and a single mistranslation in an interface can confuse thousands of users. Speed and precision both matter — at the same time.</span></p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b><span style=\"font-size: 18px;\">What we localize</span></b></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Software &amp; UI — interface strings localized within character and context limits.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Documentation — help centers, guides, and API docs kept accurate and consistent.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Websites &amp; marketing — product pages and campaigns adapted for each market.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Release content — release notes and updates localized to keep pace with development.</span></p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b><span style=\"font-size: 18px;\">Our approach</span></b></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Tech-savvy linguists — translators fluent in your product\'s domain.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Terminology management — glossaries that keep terms consistent across every release.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Fit the workflow — we work with your strings, formats, and release cadence.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">QA in context — localized builds tested so nothing breaks on screen.</span></p><p class=\"MsoNormal\"><br></p><p class=\"MsoNormal\"><b><span style=\"font-size: 18px;\">The result</span></b></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Products and content that feel native in every market, localized at the speed your release cycle demands — accurate, consistent, and on time.</span></p><div><br></div>', '2026-01-10 11:15:04', '2026-06-12 06:42:49'),
(13, 'E-Learning & Education', 'e-learning-education', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help educational institutions and corporate training\r\nteams deliver learning experiences that resonate globally.</span></p>', '<p class=\"MsoNormal\"><span style=\"font-size: 18px;\">We help educational institutions and corporate training teams deliver learning experiences that resonate globally. From university courses to onboarding modules, we make sure knowledge crosses languages without losing clarity or impact.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Education is built on understanding, and understanding depends on language that feels natural to the learner. We adapt every layer of your content — text, audio, visuals, and assessments — so students and trainees learn just as effectively in their own language.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The challenge in this sector</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Educational content is dense, structured, and built for engagement. A literal translation breaks the learning experience — examples stop making sense, interactions lose their flow, and assessments no longer measure what they should. The material has to be adapted, not just translated.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>What we localize</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Courses &amp; curricula — lessons, modules, and full programs adapted for new audiences.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Training &amp; onboarding — corporate learning, compliance, and HR content localized and tested.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Assessments &amp; quizzes — tests and interactive elements adapted to stay fair and accurate.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">▸</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Multimedia — voice-over, subtitles, and on-screen text synced and natural.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Our approach</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">1.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Subject-matter linguists — translators who understand pedagogy and your field.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">2.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Adapt, don\'t just translate — examples and references localized to fit the learner.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">3.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Rebuild &amp; sync — timing, navigation, and assessments verified in the platform.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">4.</span><span style=\"white-space: pre; font-size: 18px;\">	</span><span style=\"font-size: 18px;\">Test before launch — the full learning experience checked across devices.</span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>The result</b></span></p><p class=\"MsoNormal\"><span style=\"font-size: 18px;\">Courses and training that teach as effectively in the new language as the original — engaging, clear, and built to help every learner succeed.</span></p><div><br></div>', '2026-01-10 11:15:45', '2026-06-12 06:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `ios_images`
--

CREATE TABLE `ios_images` (
  `id` bigint UNSIGNED NOT NULL,
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `mediaable_id` bigint UNSIGNED NOT NULL,
  `mediaable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `mediaable_id`, `mediaable_type`, `type`, `path`, `original_name`, `mime_type`, `size`, `note`, `file_status`, `created_at`, `updated_at`) VALUES
(4, 1, 'App\\Models\\Industry', 'webp', 'industries/9ec1ba85-e23a-47d6-a99b-8464a063ab94.webp', 'Military.webp', 'image/webp', 1436786, NULL, NULL, '2026-01-10 11:06:40', '2026-01-10 11:06:40'),
(5, 1, 'App\\Models\\Industry', 'webp', 'industries/0edf2f17-1189-4a2b-95d0-affd4b773e23.webp', 'Military.webp', 'image/webp', 11626, NULL, 'icon', '2026-01-10 11:06:40', '2026-01-10 11:06:40'),
(6, 2, 'App\\Models\\Industry', 'webp', 'industries/1a37ef48-17cf-4d7a-8f1a-dc47d7e8bfc8.webp', 'Automotive.webp', 'image/webp', 647134, NULL, NULL, '2026-01-10 11:07:21', '2026-01-10 11:07:21'),
(7, 2, 'App\\Models\\Industry', 'webp', 'industries/c0c93911-ae79-437d-baf6-058433621794.webp', 'automotive.webp', 'image/webp', 8118, NULL, 'icon', '2026-01-10 11:07:21', '2026-01-10 11:07:21'),
(8, 3, 'App\\Models\\Industry', 'webp', 'industries/f6af6bc2-8a24-4946-8df5-cbbc79bbc6e1.webp', 'Manufacturing & Engineering.webp', 'image/webp', 429134, NULL, NULL, '2026-01-10 11:08:56', '2026-01-10 11:08:56'),
(9, 3, 'App\\Models\\Industry', 'webp', 'industries/1420e91e-0c98-40b0-a5af-ef64d5cde4ea.webp', 'engineering.webp', 'image/webp', 8336, NULL, 'icon', '2026-01-10 11:08:56', '2026-01-10 11:08:56'),
(10, 4, 'App\\Models\\Industry', 'webp', 'industries/cf35c5cf-770d-4b88-a74e-f6841761d171.webp', 'E-Commerce.webp', 'image/webp', 280828, NULL, NULL, '2026-01-10 11:09:49', '2026-01-10 11:09:49'),
(11, 4, 'App\\Models\\Industry', 'webp', 'industries/19234be9-8728-4bd8-9720-c39f29557a79.webp', 'E-Commerce.webp', 'image/webp', 8302, NULL, 'icon', '2026-01-10 11:09:49', '2026-01-10 11:09:49'),
(12, 5, 'App\\Models\\Industry', 'webp', 'industries/d147da17-91a3-4dcd-b9c4-52373143ac67.webp', 'Marketing.webp', 'image/webp', 992598, NULL, NULL, '2026-01-10 11:10:37', '2026-01-10 11:10:37'),
(13, 5, 'App\\Models\\Industry', 'webp', 'industries/6fa8d5dd-2a30-46e5-aaac-2aabfb196e4a.webp', 'Marketing.webp', 'image/webp', 9410, NULL, 'icon', '2026-01-10 11:10:37', '2026-01-10 11:10:37'),
(14, 6, 'App\\Models\\Industry', 'webp', 'industries/09d60c07-c762-4c1e-bc09-b113b93cc967.webp', 'Sciences.webp', 'image/webp', 1385302, NULL, NULL, '2026-01-10 11:11:23', '2026-01-10 11:11:23'),
(15, 6, 'App\\Models\\Industry', 'webp', 'industries/262db8cf-8747-4c88-b84f-4baf0d994c61.webp', 'Sciences.webp', 'image/webp', 8420, NULL, 'icon', '2026-01-10 11:11:23', '2026-01-10 11:11:23'),
(16, 7, 'App\\Models\\Industry', 'webp', 'industries/0bd4908c-a0bf-4f90-91ad-31af0a1668bf.webp', 'Legal.webp', 'image/webp', 1255364, NULL, NULL, '2026-01-10 11:12:04', '2026-01-10 11:12:04'),
(17, 7, 'App\\Models\\Industry', 'webp', 'industries/c0699c3a-365f-4f51-a723-eb6c24fbe8e9.webp', 'Legal.webp', 'image/webp', 7230, NULL, 'icon', '2026-01-10 11:12:04', '2026-01-10 11:12:04'),
(18, 8, 'App\\Models\\Industry', 'webp', 'industries/f0b957e8-bf3f-4f69-ab64-eccad85e0737.webp', 'Government.webp', 'image/webp', 312376, NULL, NULL, '2026-01-10 11:12:32', '2026-01-10 11:12:32'),
(19, 8, 'App\\Models\\Industry', 'webp', 'industries/ad31ee38-1ee2-4d66-b079-cbdd21cf1bee.webp', 'Government.webp', 'image/webp', 6984, NULL, 'icon', '2026-01-10 11:12:32', '2026-01-10 11:12:32'),
(20, 9, 'App\\Models\\Industry', 'webp', 'industries/6eac3d32-9a80-40c2-9ded-1a7db11d8ce7.webp', 'Finance.webp', 'image/webp', 963010, NULL, NULL, '2026-01-10 11:13:07', '2026-01-10 11:13:07'),
(21, 9, 'App\\Models\\Industry', 'webp', 'industries/a46c8bdd-be56-43b6-9865-269c3d26fdd7.webp', 'Finance.webp', 'image/webp', 12868, NULL, 'icon', '2026-01-10 11:13:07', '2026-01-10 11:13:07'),
(22, 10, 'App\\Models\\Industry', 'webp', 'industries/b17d681e-926f-4d7e-8ade-99024c008b3e.webp', 'Medical.webp', 'image/webp', 1320678, NULL, NULL, '2026-01-10 11:13:44', '2026-01-10 11:13:44'),
(23, 10, 'App\\Models\\Industry', 'webp', 'industries/ea670cc3-b3eb-4e24-ad8a-d8502218de59.webp', 'Medical.webp', 'image/webp', 9906, NULL, 'icon', '2026-01-10 11:13:44', '2026-01-10 11:13:44'),
(24, 11, 'App\\Models\\Industry', 'webp', 'industries/a348e662-6740-471a-89b3-2d18725199e0.webp', 'Gaming.webp', 'image/webp', 675096, NULL, NULL, '2026-01-10 11:14:25', '2026-01-10 11:14:25'),
(25, 11, 'App\\Models\\Industry', 'webp', 'industries/7458f544-7742-4478-a0a3-abcf82a0d498.webp', 'Gaming.webp', 'image/webp', 6382, NULL, 'icon', '2026-01-10 11:14:25', '2026-01-10 11:14:25'),
(26, 12, 'App\\Models\\Industry', 'webp', 'industries/f7d09ac9-0230-497c-a9ea-f2a7281bfc7c.webp', 'Tognology.webp', 'image/webp', 537122, NULL, NULL, '2026-01-10 11:15:04', '2026-01-10 11:15:04'),
(27, 12, 'App\\Models\\Industry', 'png', 'industries/a625fcd7-d66c-4183-ae74-03adb0d9439b.png', 'Technology.png', 'image/png', 28021, NULL, 'icon', '2026-01-10 11:15:04', '2026-01-10 11:15:04'),
(28, 13, 'App\\Models\\Industry', 'webp', 'industries/cda57d9a-1c3b-437d-acbf-ab041ddb9711.webp', 'Learning-_-Education.webp', 'image/webp', 432164, NULL, NULL, '2026-01-10 11:15:45', '2026-01-10 11:15:45'),
(29, 13, 'App\\Models\\Industry', 'webp', 'industries/67b295c9-b625-4273-a740-d366ac2f48dd.webp', 'E-Learning & Education.webp', 'image/webp', 12100, NULL, 'icon', '2026-01-10 11:15:45', '2026-01-10 11:15:45'),
(34, 2, 'App\\Models\\FinanceFreelancerInvoice', 'pdf', 'finance-freelancer-invoices/5aeb0456-163e-423f-ab94-7d29fbc45348.pdf', 'NDA-Translators-E.pdf', 'application/pdf', 305120, NULL, NULL, '2026-05-14 22:33:32', '2026-05-14 22:33:32'),
(37, 17, 'App\\Models\\Freelancer', 'pdf', 'freelancers/007c25c0-81bb-4f5d-8e03-cad84be9f354.pdf', 'NDA-Translators.pdf', 'application/pdf', 328760, NULL, NULL, '2026-05-22 05:50:17', '2026-05-22 05:50:17'),
(38, 18, 'App\\Models\\Freelancer', 'pdf', 'freelancers/15e77eaa-909e-4561-83fb-d66943da5a9b.pdf', 'NDA-Translators.pdf', 'application/pdf', 330874, NULL, NULL, '2026-05-22 06:25:50', '2026-05-22 06:25:50'),
(39, 19, 'App\\Models\\Freelancer', 'pdf', 'freelancers/27590464-969b-4e18-8c05-56f6bec8dd31.pdf', 'Korkut eng CV.pdf', 'application/pdf', 236977, NULL, NULL, '2026-05-22 06:40:52', '2026-05-22 06:40:52'),
(40, 19, 'App\\Models\\Freelancer', 'pdf', 'freelancers/e91458a0-c5f1-444c-b01d-49b737835eb4.pdf', 'NDA-Translators.pdf', 'application/pdf', 351455, NULL, NULL, '2026-05-22 06:40:52', '2026-05-22 06:40:52'),
(41, 20, 'App\\Models\\Freelancer', 'pdf', 'freelancers/299426f7-ae1d-400c-afac-30bde8a35724.pdf', 'Mihretab Gebru CV.pdf', 'application/pdf', 533270, NULL, NULL, '2026-05-22 06:46:21', '2026-05-22 06:46:21'),
(42, 20, 'App\\Models\\Freelancer', 'png', 'freelancers/49ea1b9a-2c97-45d6-b316-024653828f89.png', 'Mihretab-Solomon-Gebru-—-Smartcat-Freelance-Translators-Database.png', 'image/png', 487880, NULL, NULL, '2026-05-22 06:46:21', '2026-05-22 06:46:21'),
(43, 20, 'App\\Models\\Freelancer', 'pdf', 'freelancers/6db29c1a-9ce8-47da-bd11-90f8380dcc66.pdf', 'NDA-Translators.pdf', 'application/pdf', 383336, NULL, NULL, '2026-05-22 06:46:21', '2026-05-22 06:46:21'),
(44, 19, 'App\\Models\\Freelancer', 'png', 'freelancers/1278049f-d1c2-42ba-bde5-558f1a10d7b5.png', 'Korkut-İsisag-—-Smartcat-Freelance-Translators-Database.png', 'image/png', 426570, NULL, NULL, '2026-05-22 06:47:26', '2026-05-22 06:47:26'),
(45, 18, 'App\\Models\\Freelancer', 'png', 'freelancers/a3205317-9dff-469f-b359-45fb8f2c56b6.png', 'Emmanuel-NGARUKIYINTWALI-—-Smartcat-Freelance-Translators-Database.png', 'image/png', 1029559, NULL, NULL, '2026-05-22 06:48:06', '2026-05-22 06:48:06'),
(46, 17, 'App\\Models\\Freelancer', 'png', 'freelancers/d0334868-6b85-4e33-b9c3-5a83191d824f.png', 'Jermaine-Delos-Santos-—-Smartcat-Freelance-Translators-Database.png', 'image/png', 226809, NULL, NULL, '2026-05-22 06:48:55', '2026-05-22 06:48:55'),
(48, 5, 'App\\Models\\ProjectRequest', 'png', 'project-requests/8457293c-f920-48d6-9428-dea8f8a5b819.png', 'logo-white.png', 'image/png', 42628, NULL, NULL, '2026-06-02 13:45:18', '2026-06-02 13:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_11_16_004504_create_roles_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_11_16_001844_create_clients_table', 1),
(6, '2025_11_16_002832_create_freelancers_table', 1),
(7, '2025_11_16_003033_create_ios_images_table', 1),
(8, '2025_11_16_003144_create_testimonials_table', 1),
(9, '2025_11_16_003441_create_industries_table', 1),
(10, '2025_11_16_004010_create_revenues_table', 1),
(11, '2025_11_16_004137_create_expenses_table', 1),
(12, '2025_11_16_004304_create_company_capitals_table', 1),
(13, '2025_11_16_004610_create_permissions_table', 1),
(14, '2025_11_16_004718_create_role_permission_table', 1),
(15, '2025_11_16_010315_create_media_table', 1),
(16, '2025_11_16_010952_create_services_table', 1),
(17, '2025_11_16_011100_create_project_requests_table', 1),
(18, '2025_11_16_011200_create_request_service_table', 1),
(19, '2025_11_16_011300_create_tasks_table', 1),
(20, '2025_11_16_011400_create_task_service_table', 1),
(21, '2025_11_16_011500_create_task_languages_table', 1),
(22, '2025_11_16_011600_create_freelancer_task_table', 1),
(23, '2025_11_16_011700_create_freelancer_pos_table', 1),
(24, '2025_11_16_011800_create_freelancer_po_service_table', 1),
(25, '2025_11_16_011900_create_client_pos_table', 1),
(26, '2025_11_16_012000_create_client_po_service_table', 1),
(27, '2025_11_16_012100_create_client_invoices_table', 1),
(28, '2025_11_16_012200_create_freelancer_invoices_table', 1),
(29, '2025_11_16_090000_add_file_metadata_to_media_table', 1),
(30, '2025_11_17_193704_add_note_and_file_status_to_media_table', 1),
(31, '2025_11_18_050059_modify_reference_number_in_tasks_table', 1),
(32, '2025_11_18_130000_create_freelancer_service_table', 1),
(33, '2025_11_18_150000_create_contact_messages_table', 1),
(34, '2025_11_24_034222_create_settings_table', 1),
(35, '2025_12_01_024036_create_client_partners_table', 1),
(36, '2025_12_02_000001_add_project_link_to_project_requests_table', 1),
(37, '2025_12_09_124744_add_link_to_tasks_table', 1),
(38, '2026_01_07_000001_add_notes_to_clients_and_freelancers', 1),
(39, '2026_01_07_000006_create_finance_client_invoices_table', 1),
(40, '2026_01_07_000007_create_finance_freelancer_invoices_table', 1),
(41, '2026_02_18_000001_add_contact_people_to_clients_table', 2),
(42, '2026_05_25_162814_create_pages_table', 3),
(43, '2026_05_25_162821_create_articles_table', 3),
(44, '2026_05_25_162831_add_seo_fields_to_services_table', 3),
(45, '2026_05_25_230133_create_categories_table', 4),
(46, '2026_05_25_230727_add_category_id_to_articles_table', 4),
(47, '2026_05_27_231509_add_details_to_categories_table', 5),
(48, '2026_05_28_133335_add_slug_to_industries_table', 6),
(49, '2026_06_04_150730_add_content_to_services_and_industries', 7);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `seo_title`, `seo_description`, `seo_keywords`, `image_path`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Privacy Policy', 'privacy-policy', '<h2>Introduction</h2>\r\n<p>Welcome to <strong>Words Tie</strong>. We respect your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or use our professional translation and localization services.</p>\r\n\r\n<h2>Information We Collect</h2>\r\n<p>To provide you with accurate language solutions, we may collect the following types of information:</p>\r\n\r\n<h3>Personal Identification Information</h3>\r\n<ul>\r\n    <li>Full name, email address, phone number, and company details when you request a quote or contact us.</li>\r\n    <li>Billing and payment information necessary to process your translation projects.</li>\r\n</ul>\r\n\r\n<h3>Project and Source Materials</h3>\r\n<ul>\r\n    <li>Documents, texts, and multimedia files submitted for translation, localization, or proofreading.</li>\r\n    <li>Specific guidelines, glossaries, or brand voice instructions provided by you.</li>\r\n</ul>\r\n\r\n<h2>How We Use Your Information</h2>\r\n<p>Words Tie uses the collected data strictly to deliver high-quality translation services. Specifically, we use your information to:</p>\r\n<ul>\r\n    <li>Analyze your source files to provide accurate quotes and project timelines.</li>\r\n    <li>Perform translation, localization, and desktop publishing (DTP) services.</li>\r\n    <li>Communicate with you regarding project updates, revisions, and deliveries.</li>\r\n    <li>Process payments and manage invoicing.</li>\r\n    <li>Improve our website performance and user experience.</li>\r\n</ul>\r\n\r\n<h2>Data Security and Confidentiality</h2>\r\n<p>As a professional translation agency, confidentiality is our top priority. We implement robust technical and organizational security measures to protect your documents and personal data against unauthorized access, alteration, or disclosure. All our linguists and staff are bound by strict Non-Disclosure Agreements (NDAs).</p>\r\n\r\n<h2>Sharing Your Data</h2>\r\n<p>We do not sell, trade, or rent your personal information to third parties. We may share your data only with:</p>\r\n<ul>\r\n    <li><strong>Trusted Linguists:</strong> Vetted professional translators assigned to your specific project under strict confidentiality terms.</li>\r\n    <li><strong>Service Providers:</strong> Secure payment gateways and IT hosting services that assist us in operating our business.</li>\r\n    <li><strong>Legal Obligations:</strong> When required by law or to protect the rights and safety of Words Tie and our clients.</li>\r\n</ul>\r\n\r\n<h2>Cookies and Tracking Technologies</h2>\r\n<p>Our website uses cookies to enhance your browsing experience, analyze site traffic, and understand where our audience comes from. You can choose to disable cookies through your browser settings, though this may affect certain functionalities of our site.</p>\r\n\r\n<h2>Your Privacy Rights</h2>\r\n<p>Depending on your location, you may have the right to access, update, correct, or delete your personal data stored with us. If you wish to exercise any of these rights, please contact our support team.</p>\r\n\r\n<h2>Contact Us</h2>\r\n<p>If you have any questions or concerns about this Privacy Policy or how we handle your documents, please contact us at:</p>\r\n<ul>\r\n    <li><strong>Email:</strong> info@words-tie.com</li>\r\n    <li><strong>Website:</strong> www.words-tie.com</li>\r\n</ul>', NULL, NULL, NULL, NULL, 1, '2026-05-29 00:44:07', '2026-05-29 01:10:15'),
(3, 'Terms and Conditions', 'terms-and-conditions', '<h2>Agreement to Terms</h2>\r\n<p>These Terms and Conditions constitute a legally binding agreement made between you (the \"Client\") and <strong>Words Tie</strong>. By accessing our website or requesting our translation, localization, or DTP services, you agree that you have read, understood, and agreed to be bound by all of these terms.</p>\r\n\r\n<h2>Scope of Services</h2>\r\n<p>Words Tie provides professional language services, including but not limited to document translation, website localization, proofreading, and Desktop Publishing (DTP). All services are executed by qualified linguists to ensure the highest quality and cultural accuracy.</p>\r\n\r\n<h3>Quotes and Pricing</h3>\r\n<p>Quotes provided via our website or email are estimates based on the word count, language pair, subject matter complexity, and requested turnaround time. A quote is only considered binding once we have reviewed the final source files and both parties have agreed on the price and delivery date.</p>\r\n\r\n<h2>Client Obligations</h2>\r\n<p>To ensure the best possible outcome for your project, you agree to:</p>\r\n<ul>\r\n    <li>Provide clear, legible, and complete source materials.</li>\r\n    <li>Supply any relevant reference materials, glossaries, or specific formatting instructions prior to the start of the project.</li>\r\n    <li>Respond promptly to any queries our project managers or linguists may have during the translation process.</li>\r\n</ul>\r\n\r\n<h2>Confidentiality and Non-Disclosure</h2>\r\n<p>We understand the sensitive nature of the documents you share with us. Words Tie agrees to hold all client materials in strict confidence. Information will only be shared with personnel and linguists directly involved in the execution of your project, all of whom are bound by confidentiality agreements.</p>\r\n\r\n<h2>Intellectual Property Rights</h2>\r\n<p>The Client guarantees that they own or have the right to use and translate the source materials provided. Once full payment has been received by Words Tie, all intellectual property rights pertaining to the translated (target) text will be transferred to the Client.</p>\r\n\r\n<h2>Revisions and Quality Assurance</h2>\r\n<p>We strive for excellence in every project. If you find any objective errors or omissions in the delivered translation, you must notify Words Tie within a specified period (usually 14 days) after delivery. We will correct any justified errors at no additional cost. Preferential or stylistic changes that deviate from the original text are not considered errors.</p>\r\n\r\n<h2>Limitation of Liability</h2>\r\n<p>While Words Tie makes every effort to provide accurate and culturally appropriate translations, we shall not be held liable for any indirect, incidental, consequential, or punitive damages arising from the use of our translated materials. Our maximum liability shall not exceed the total amount paid by the Client for the specific project in question.</p>\r\n\r\n<h2>Governing Law</h2>\r\n<p>These Terms and Conditions shall be governed by and construed in accordance with the applicable laws of the jurisdiction in which Words Tie is registered, without regard to its conflict of law principles.</p>\r\n\r\n<h2>Contact Information</h2>\r\n<p>If you have any questions regarding these Terms and Conditions or wish to discuss a project, please reach out to our team through the contact form on our website or email us directly.</p>', NULL, NULL, NULL, NULL, 1, '2026-05-29 00:44:37', '2026-05-29 01:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Create User', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(2, 'View User', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(3, 'Update User', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(4, 'Delete User', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(5, 'Create Role', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(6, 'View Role', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(7, 'Update Role', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(8, 'Delete Role', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(9, 'Create Permission', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(10, 'View Permission', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(11, 'Update Permission', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(12, 'Delete Permission', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(13, 'Create Client', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(14, 'View Client', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(15, 'Update Client', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(16, 'Delete Client', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(17, 'Download Client Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(18, 'Delete Client Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(19, 'Create Freelancer', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(20, 'View Freelancer', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(21, 'Update Freelancer', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(22, 'Delete Freelancer', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(23, 'Download Freelancer Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(24, 'Delete Freelancer Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(25, 'Create Service', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(26, 'View Service', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(27, 'Update Service', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(28, 'Delete Service', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(29, 'Create Industry', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(30, 'View Industry', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(31, 'Update Industry', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(32, 'Delete Industry', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(33, 'Create Task', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(34, 'View Task', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(35, 'Update Task', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(36, 'Delete Task', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(37, 'Upload Task Files', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(38, 'Store Task Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(39, 'Download Task Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(40, 'Delete Task Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(41, 'Find Client Or Freelancer', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(42, 'Find Task', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(43, 'View Vendor PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(44, 'Create Vendor PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(45, 'Download Vendor PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(46, 'View Client PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(47, 'Create Client PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(48, 'Download Client PO', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(49, 'Create Testimonial', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(50, 'View Testimonial', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(51, 'Update Testimonial', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(52, 'Delete Testimonial', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(53, 'View Contact Message', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(54, 'Delete Contact Message', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(55, 'Create IOS Image', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(56, 'View IOS Image', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(57, 'Update IOS Image', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(58, 'Delete IOS Image', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(59, 'View Project Request', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(60, 'Delete Project Request', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(61, 'Download Project Request Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(62, 'Delete Project Request Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(63, 'Store Project Request Attachment', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(64, 'Update Project Request Status', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(65, 'View Finance', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(66, 'View Invoices', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(67, 'Update Company Capital', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(68, 'Create Revenue', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(69, 'View Revenue', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(70, 'Update Revenue', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(71, 'Delete Revenue', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(72, 'Upload Revenue Sheet', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(73, 'Download Revenue Sheet', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(74, 'Create Expense', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(75, 'View Expense', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(76, 'Update Expense', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(77, 'Delete Expense', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(78, 'Upload Expense Sheet', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(79, 'Download Expense Sheet', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(80, 'View Vendor Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(81, 'Create Vendor Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(82, 'Update Vendor Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(83, 'Delete Vendor Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(84, 'Download Finance Freelancer Invoice File', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(85, 'Delete Finance Freelancer Invoice File', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(86, 'View Client Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(87, 'Create Client Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(88, 'Update Client Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(89, 'Delete Client Invoice', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(90, 'Download Finance Client Invoice File', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(91, 'Delete Finance Client Invoice File', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(92, 'View Setting', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(93, 'Update Setting', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(94, 'Create Client Partner', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(95, 'View Client Partner', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(96, 'Update Client Partner', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(97, 'Delete Client Partner', '2026-01-07 18:09:24', '2026-01-07 18:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `project_requests`
--

CREATE TABLE `project_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `start_date_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_date_time` time NOT NULL,
  `preferred_payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_requests`
--

INSERT INTO `project_requests` (`id`, `first_name`, `last_name`, `email`, `project_name`, `project_link`, `description`, `time_zone`, `start_date`, `start_date_time`, `end_date`, `end_date_time`, `preferred_payment_type`, `source_language`, `target_language`, `status`, `currency`, `created_at`, `updated_at`) VALUES
(3, 'ggggggggggggg', 'ggggggggggggg', 'admin@words-tie.com', 'ggggggggggg', 'https://w1.ostazplus.com/price-request', 'cscccscscsc', 'Africa/Cairo', '2026-06-02', '01:14:00', '2026-06-04', '01:17:00', 'PayPal', 'gggggggg', 'cdcdcs', 'pending', 'AED', '2026-06-02 02:14:18', '2026-06-02 02:14:18'),
(4, 'ggggggggggggg', 'ggggggggggggg', 'admin@words-tie.com', 'ggggggggggg', 'https://w1.ostazplus.com/price-request', 'SDVDBSDB', 'Africa/Asmara', '2026-06-02', '13:33:00', '2026-06-03', '01:38:00', 'PayPal', 'gggggggg', 'FGGWG', 'pending', 'AUD', '2026-06-02 02:36:41', '2026-06-02 02:36:41'),
(5, 'ssss', 'ssss', 'superadmin@gmail.com', 'ssssssss', 'https://w1.ostazplus.com/price-request', 'ddddddddddddd', 'Africa/Cairo', '2026-06-03', '12:46:00', '2026-06-04', '12:45:00', 'Wise', 'English', 'العربية', 'pending', 'EUR', '2026-06-02 13:45:18', '2026-06-02 13:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `request_service`
--

CREATE TABLE `request_service` (
  `project_request_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `request_service`
--

INSERT INTO `request_service` (`project_request_id`, `service_id`) VALUES
(3, 2),
(3, 7),
(3, 5),
(3, 13),
(4, 2),
(4, 10),
(4, 6),
(4, 9),
(4, 8),
(4, 14),
(4, 1),
(4, 4),
(4, 3),
(5, 2),
(5, 7),
(5, 6),
(5, 8),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint UNSIGNED NOT NULL,
  `total_usd` decimal(15,2) DEFAULT NULL,
  `total_egp` decimal(15,2) DEFAULT NULL,
  `month` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2026-01-07 18:09:24', '2026-01-07 18:09:24'),
(2, 'PM', '2026-04-21 16:40:29', '2026-04-21 16:40:29'),
(3, 'VM', '2026-04-21 17:40:14', '2026-04-21 17:40:14'),
(4, 'Sales', '2026-04-21 17:43:58', '2026-04-21 17:43:58'),
(5, 'Finance', '2026-04-21 17:48:41', '2026-04-21 17:48:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 1, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 1, 19, NULL, NULL),
(20, 1, 20, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(25, 1, 25, NULL, NULL),
(26, 1, 26, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 1, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 1, 30, NULL, NULL),
(31, 1, 31, NULL, NULL),
(32, 1, 32, NULL, NULL),
(33, 1, 33, NULL, NULL),
(34, 1, 34, NULL, NULL),
(35, 1, 35, NULL, NULL),
(36, 1, 36, NULL, NULL),
(37, 1, 37, NULL, NULL),
(38, 1, 38, NULL, NULL),
(39, 1, 39, NULL, NULL),
(40, 1, 40, NULL, NULL),
(41, 1, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 1, 43, NULL, NULL),
(44, 1, 44, NULL, NULL),
(45, 1, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 1, 47, NULL, NULL),
(48, 1, 48, NULL, NULL),
(49, 1, 49, NULL, NULL),
(50, 1, 50, NULL, NULL),
(51, 1, 51, NULL, NULL),
(52, 1, 52, NULL, NULL),
(53, 1, 53, NULL, NULL),
(54, 1, 54, NULL, NULL),
(55, 1, 55, NULL, NULL),
(56, 1, 56, NULL, NULL),
(57, 1, 57, NULL, NULL),
(58, 1, 58, NULL, NULL),
(59, 1, 59, NULL, NULL),
(60, 1, 60, NULL, NULL),
(61, 1, 61, NULL, NULL),
(62, 1, 62, NULL, NULL),
(63, 1, 63, NULL, NULL),
(64, 1, 64, NULL, NULL),
(65, 1, 65, NULL, NULL),
(66, 1, 66, NULL, NULL),
(67, 1, 67, NULL, NULL),
(68, 1, 68, NULL, NULL),
(69, 1, 69, NULL, NULL),
(70, 1, 70, NULL, NULL),
(71, 1, 71, NULL, NULL),
(72, 1, 72, NULL, NULL),
(73, 1, 73, NULL, NULL),
(74, 1, 74, NULL, NULL),
(75, 1, 75, NULL, NULL),
(76, 1, 76, NULL, NULL),
(77, 1, 77, NULL, NULL),
(78, 1, 78, NULL, NULL),
(79, 1, 79, NULL, NULL),
(80, 1, 80, NULL, NULL),
(81, 1, 81, NULL, NULL),
(82, 1, 82, NULL, NULL),
(83, 1, 83, NULL, NULL),
(84, 1, 84, NULL, NULL),
(85, 1, 85, NULL, NULL),
(86, 1, 86, NULL, NULL),
(87, 1, 87, NULL, NULL),
(88, 1, 88, NULL, NULL),
(89, 1, 89, NULL, NULL),
(90, 1, 90, NULL, NULL),
(91, 1, 91, NULL, NULL),
(92, 1, 92, NULL, NULL),
(93, 1, 93, NULL, NULL),
(94, 1, 94, NULL, NULL),
(95, 1, 95, NULL, NULL),
(96, 1, 96, NULL, NULL),
(97, 1, 97, NULL, NULL),
(98, 2, 33, NULL, NULL),
(99, 2, 37, NULL, NULL),
(100, 2, 13, NULL, NULL),
(101, 2, 14, NULL, NULL),
(102, 2, 17, NULL, NULL),
(103, 2, 19, NULL, NULL),
(104, 2, 20, NULL, NULL),
(105, 2, 21, NULL, NULL),
(106, 2, 23, NULL, NULL),
(107, 2, 34, NULL, NULL),
(108, 2, 35, NULL, NULL),
(109, 2, 36, NULL, NULL),
(110, 2, 38, NULL, NULL),
(111, 2, 39, NULL, NULL),
(112, 2, 40, NULL, NULL),
(113, 2, 41, NULL, NULL),
(114, 2, 42, NULL, NULL),
(115, 2, 43, NULL, NULL),
(116, 2, 44, NULL, NULL),
(117, 2, 45, NULL, NULL),
(118, 2, 46, NULL, NULL),
(119, 2, 47, NULL, NULL),
(120, 2, 48, NULL, NULL),
(121, 2, 53, NULL, NULL),
(122, 2, 59, NULL, NULL),
(123, 2, 60, NULL, NULL),
(124, 2, 61, NULL, NULL),
(125, 2, 63, NULL, NULL),
(126, 2, 64, NULL, NULL),
(127, 2, 66, NULL, NULL),
(128, 2, 80, NULL, NULL),
(129, 2, 86, NULL, NULL),
(130, 3, 19, NULL, NULL),
(131, 3, 20, NULL, NULL),
(132, 3, 21, NULL, NULL),
(133, 3, 22, NULL, NULL),
(134, 3, 23, NULL, NULL),
(135, 3, 24, NULL, NULL),
(136, 4, 13, NULL, NULL),
(137, 4, 14, NULL, NULL),
(138, 4, 15, NULL, NULL),
(139, 4, 16, NULL, NULL),
(140, 4, 17, NULL, NULL),
(141, 4, 18, NULL, NULL),
(142, 4, 46, NULL, NULL),
(143, 4, 47, NULL, NULL),
(144, 4, 48, NULL, NULL),
(145, 4, 53, NULL, NULL),
(146, 4, 54, NULL, NULL),
(147, 4, 59, NULL, NULL),
(148, 4, 60, NULL, NULL),
(149, 4, 61, NULL, NULL),
(150, 4, 62, NULL, NULL),
(151, 4, 63, NULL, NULL),
(152, 4, 64, NULL, NULL),
(153, 4, 86, NULL, NULL),
(154, 4, 87, NULL, NULL),
(155, 4, 88, NULL, NULL),
(156, 4, 89, NULL, NULL),
(157, 4, 90, NULL, NULL),
(158, 4, 91, NULL, NULL),
(159, 5, 14, NULL, NULL),
(160, 5, 20, NULL, NULL),
(161, 5, 34, NULL, NULL),
(162, 5, 41, NULL, NULL),
(163, 5, 42, NULL, NULL),
(164, 5, 43, NULL, NULL),
(165, 5, 44, NULL, NULL),
(166, 5, 45, NULL, NULL),
(167, 5, 46, NULL, NULL),
(168, 5, 47, NULL, NULL),
(169, 5, 48, NULL, NULL),
(170, 5, 65, NULL, NULL),
(171, 5, 66, NULL, NULL),
(172, 5, 67, NULL, NULL),
(173, 5, 68, NULL, NULL),
(174, 5, 69, NULL, NULL),
(175, 5, 70, NULL, NULL),
(176, 5, 71, NULL, NULL),
(177, 5, 72, NULL, NULL),
(178, 5, 73, NULL, NULL),
(179, 5, 74, NULL, NULL),
(180, 5, 75, NULL, NULL),
(181, 5, 76, NULL, NULL),
(182, 5, 77, NULL, NULL),
(183, 5, 78, NULL, NULL),
(184, 5, 79, NULL, NULL),
(185, 5, 80, NULL, NULL),
(186, 5, 81, NULL, NULL),
(187, 5, 82, NULL, NULL),
(188, 5, 83, NULL, NULL),
(189, 5, 84, NULL, NULL),
(190, 5, 85, NULL, NULL),
(191, 5, 86, NULL, NULL),
(192, 5, 87, NULL, NULL),
(193, 5, 88, NULL, NULL),
(194, 5, 89, NULL, NULL),
(195, 5, 90, NULL, NULL),
(196, 5, 91, NULL, NULL),
(197, 3, 41, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `slug`, `name`, `icon`, `description`, `content`, `status`, `created_at`, `updated_at`, `seo_title`, `seo_description`, `seo_keywords`, `image_path`) VALUES
(1, 'typing', 'Typing', 'services/f69b0541-35cf-48b8-9153-682365cc15e8.webp', '<span style=\"font-size: 18px;\">From handwritten notes to scanned documents, we tie precision with speed, delivering clean, well-formatted digital text ready to use.</span>', '<div><span style=\"font-size: 18px;\">Turning handwritten notes, scanned pages, or printed documents into clean digital text sounds simple — until accuracy, formatting, and the script itself get in the way. Our professional typing service produces precise, properly formatted digital documents in Arabic and 150+ other languages.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Arabic typing in particular demands real expertise: correct letterforms, proper diacritics where needed, right-to-left formatting, and careful handling of mixed Arabic-English content. Our typists are native speakers who read the source correctly and reproduce it faithfully — not approximations that need fixing later.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We work from handwritten manuscripts, scanned files, image PDFs, and printed material, delivering editable documents that match your required layout — headings, tables, columns, and styling intact. Where the source is a scanned or image file, we can combine typing with our OCR service for faster, more accurate results.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Fast turnaround, strict confidentiality, and an NDA on every file. Whatever format your content starts in, you get back a clean, accurate, ready-to-use digital document — typed right the first time.</span></div><div><br></div>', 'active', '2026-01-10 11:01:32', '2026-06-12 06:56:05', 'Typing Services | Arabic & Multilingual | Words Tie', 'Accurate Arabic & multilingual typing. Handwritten, scanned or PDF content turned into clean, editable, properly formatted documents. NDA on every file.', 'typing services, Arabic typing, document typing, multilingual typing, data entry, manuscript typing', NULL),
(2, 'ai-solutions', 'Ai Solutions', 'services/0974fcab-9a5a-4217-8146-f6b21b0811a7.webp', 'We leverage the power of Artificial Intelligence to enhance translation, localization, and multilingual communication. Our AI-driven solutions accelerate projects, maintain consistency, and improve accuracy, while still benefiting from human expertise to ensure natural, culturally relevant content.', 'We leverage the power of Artificial Intelligence to enhance translation, localization, and multilingual communication. Our AI-driven solutions accelerate projects, maintain consistency, and improve accuracy, while still benefiting from human expertise to ensure natural, culturally relevant content.', 'inactive', '2026-01-10 11:01:52', '2026-06-12 06:56:14', NULL, NULL, NULL, NULL),
(3, 'voiceover', 'Voiceover', 'services/f80497f7-e4f8-42fa-8c89-650b1dbdd96b.webp', '<span style=\"font-size: 18px;\">We combine talented native speakers with professional audio production, ensuring your message is clear, engaging, and true to your brand.</span>', '<div><span style=\"font-size: 18px;\">A great voiceover does more than read a script — it carries tone, warmth, and intent, so your message is felt as much as heard. At Words Tie, we provide professional multilingual voiceover with native voice talent who sound natural to local ears, never translated.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">From e-learning narration and explainer videos to commercials, documentaries, IVR phone systems, and corporate presentations, we cast the right voice for your content and your audience. Male or female, formal or conversational, Modern Standard Arabic or a specific dialect — we match the delivery to the message.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Every recording is handled end to end: script adaptation for spoken delivery, professional voice talent, studio-quality recording, direction, and audio editing. We sync timing to your video or slides so narration lands exactly where it should, and deliver in the audio formats your platforms require.</span></div><div><span style=\"font-size: 18px;\">Across 150+ languages, with deep Arabic specialization, your video, course, or campaign gets a voice that sounds like it was made for the market it speaks to — clear, professional, and perfectly in sync.</span></div><div><br></div>', 'active', '2026-01-10 11:02:12', '2026-06-12 06:53:12', 'Voiceover Services | Arabic & Multilingual | Words Tie', 'Professional Arabic & multilingual voiceover by native talent. E-learning, video, ads & IVR, recorded, directed & synced across 150+ languages.', 'voiceover services, multilingual voiceover, Arabic voice over, e-learning narration, voice talent', NULL),
(4, 'video-editing', 'Video Editing', 'services/b743ba21-143a-4f78-9ef8-60b92559c28a.webp', '<span style=\"font-size: 18px;\">Our video editing service ensures your content is visually compelling, culturally adapted, and ready for any platform.</span>', '<div><div><span style=\"font-size: 18px;\">Video is the most engaging format there is — but only when it is edited well and adapted properly for each audience. Our Video Editing service turns raw footage and source files into polished, publish-ready video, and rebuilds it cleanly for every language you release in.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Localizing video is more than swapping subtitles. On-screen text, captions, graphics, lower-thirds, and timing all change when a new language comes in — especially with right-to-left scripts like Arabic. We re-edit every element so the finished video looks intentional in each language, not patched together.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We handle the full process: cutting and assembling footage, integrating voiceover and subtitles, adapting on-screen graphics and motion text, syncing audio precisely, and exporting in the formats your platforms need. Your brand styling — fonts, colors, pacing — stays consistent across every version.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">From training videos and product demos to ads and social content, you get a finished, on-brand video that feels native everywhere it plays — clean, professional, and ready to publish in any market.</span></div></div><div><br></div>', 'active', '2026-01-10 11:02:26', '2026-06-12 06:53:26', 'Video Editing & Localization | Multilingual | Words Tie', 'Professional video editing & localization: subtitles, voiceover, graphics & on-screen text adapted for every market. Polished, on-brand video, any language.', 'video editing, video localization, multilingual video, subtitle integration, Arabic video editing', NULL),
(5, 'subtitling', 'Subtitling', 'services/1839eb9b-178e-4ddb-95cb-bedc7382c38b.webp', '<span style=\"font-size: 18px;\">Subtitling isn’t just adding text to a screen. It’s the delicate art of syncing meaning, timing, and emotion, making sure every line feels natural, readable, and true to your brand’s voice. From training videos and eLearning modules to ads, social media content, and corporate communication, we help your story travel farther.</span>', '<div><span style=\"font-size: 18px;\">Subtitling isn’t just adding text to a screen — it’s the delicate art of syncing meaning, timing, and readability so viewers follow every moment without missing a beat. Done well, subtitles disappear into the experience; done poorly, they pull viewers right out of it.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Our linguists condense spoken language into clear, natural subtitles that fit the reading speed and rhythm of each scene. Meaning, humor, and emotion are preserved, while timing is matched precisely to the audio so nothing feels rushed or out of place.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We handle the full process: transcription, translation, timing, and formatting, delivered in the subtitle formats your platforms require. From films and ads to training videos and social content, your message stays clear in any language.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">With professional subtitling, your video reaches a global audience — and every viewer feels like it was made for them.</span></div><div><br></div>', 'active', '2026-01-10 11:02:39', '2026-06-12 06:52:19', 'Subtitling Services | Arabic & Multilingual | Words Tie', 'Professional subtitling synced to picture for film, ads, training & social video. Natural, readable Arabic & multilingual subtitles in every format.', 'subtitling services, video subtitling, Arabic subtitles, subtitle translation, closed captions', NULL),
(6, 'localization', 'Localization', 'services/412904ec-5fdf-4ea3-9cc9-51f9517d0399.webp', '<span style=\"font-size: 18px;\">Our Localization service adapts your digital content to the language, culture, and preferences of each target region.</span>', '<div><span style=\"font-size: 18px;\">Our Localization service adapts your digital content to the language, culture, and expectations of each market you enter. It takes a product built for one audience and makes it feel native to many — so users feel at home from the very first screen.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Localization reaches deeper than translation. We adapt dates, currencies, units, formats, imagery, and cultural references, and adjust tone and design to match local norms. The goal is content that doesn’t feel imported — it feels made for them.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">From websites and apps to software and digital products, we handle the language and the technical details together: managing strings, respecting character limits, and keeping everything consistent across every screen and platform.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">The payoff is reach without friction. When your product speaks each market’s language — literally and culturally — trust, engagement, and growth follow.</span></div><div><br></div>', 'active', '2026-01-10 11:03:00', '2026-06-12 06:52:49', 'Localization Services | Web, App & Software | Words Tie', 'Adapt your product to each market, not just its words. Website, app & software localization with full RTL Arabic support for the GCC and beyond.', 'localization services, website localization, app localization, software localization, Arabic localization', NULL),
(7, 'e-learning', 'E-Learning', 'services/18b35d1e-19c5-42e9-ac8a-0b6b3628ccd3.webp', '<span style=\"font-size: 18px;\">From corporate training and onboarding modules to interactive courses, simulations, and multimedia lessons, we make your content globally ready and learner-friendly.</span>', '<div><span style=\"font-size: 18px;\">From corporate training and onboarding modules to interactive courses and simulations, we adapt your learning content so it teaches just as effectively in any language. E-learning localization is about more than translating slides — it’s about preserving the learning experience.</span></div><div><span style=\"font-size: 18px;\">We translate and adapt every layer of a course: on-screen text, narration scripts, voice-over, subtitles, quizzes, and interactive elements. Examples and references are adjusted so they make sense to local learners, keeping the material relevant and relatable.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Working within standard authoring tools and platforms, we rebuild modules so timing, navigation, and assessments work flawlessly in the new language. Audio, visuals, and interactions stay perfectly in sync.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Wherever your teams or students are, they get the same clear, engaging, and effective learning experience — in the language they understand best.</span></div><div><br></div>', 'active', '2026-01-10 11:03:14', '2026-06-12 06:53:46', 'E-Learning Localization | Storyline & Captivate | Words Tie', 'Localize courses that teach as well in every language. Full RTL e-learning in Storyline & Captivate: text, audio, quizzes & interactions rebuilt and tested.', 'e-learning localization, course translation, Storyline localization, Captivate Arabic, RTL e-learning', NULL),
(8, 'qa-testing', 'QA & Testing', 'services/bf55224a-b28e-4600-81e4-9cd0e0d32b33.webp', '<span style=\"font-size: 18px;\">Every project is reviewed meticulously, ensuring your audience experiences accuracy, clarity, and professionalism.</span>', '<div><span style=\"font-size: 18px;\">Every project is reviewed meticulously, so your audience experiences accuracy from the first word to the last click. Our QA &amp; Testing service goes past the text itself to verify that translated and localized content actually works in its real environment.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">For software, apps, and websites, we check that nothing breaks once another language is in place: no cut-off buttons, overlapping text, broken links, or misplaced characters. Functionality and language are tested together, the way your users will encounter them.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Linguistic QA confirms accuracy, consistency, and cultural fit, while functional testing confirms everything displays and behaves correctly across devices and screens. Issues are documented clearly and fixed before launch — not discovered by your customers.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">The result is a release you can trust: content that’s correct, complete, and seamless in every language you ship.</span></div><div><br></div>', 'active', '2026-01-10 11:03:29', '2026-06-12 06:55:48', 'Localization QA & Testing | Words Tie', 'Verify that localized content actually works. Linguistic & functional QA for software, apps & websites, no cut-off text, broken links or display errors.', 'localization QA, linguistic testing, functional testing, software localization QA, localization testing', NULL),
(9, 'proofreading', 'Proofreading', 'services/d719ee75-1ebe-4460-8eb3-74c31f2429ef.webp', '<span style=\"font-size: 18px;\">Every text is carefully reviewed by expert linguists who preserve your voice while perfecting your words.</span>', '<div><span style=\"font-size: 18px;\">Every text we touch is carefully reviewed by expert linguists who preserve your voice while polishing away the flaws. Proofreading is the final layer of quality that separates content that’s “fine” from content that’s flawless.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Our reviewers catch the things that slip past everyone else: typos, grammar slips, awkward phrasing, inconsistent terminology, and punctuation errors. They check not only that the words are correct, but that they read smoothly and sound right.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We can proofread your own content or add a dedicated review pass to any translation, so a second professional always confirms the work before it reaches your audience. Consistency in style, tone, and terminology is checked across the entire document.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Whether it’s a published article, a legal contract, or a marketing page, proofreading gives you the confidence that nothing embarrassing is hiding in the details.</span></div><div><br></div>', 'active', '2026-01-10 11:03:41', '2026-06-12 06:55:29', 'Proofreading Services | Expert Linguist Review | Words Tie', 'A final expert eye on every word. Professional Arabic & multilingual proofreading for typos, grammar, terminology & consistency before you publish.', 'proofreading services, professional proofreading, editing services, Arabic proofreading, language review', NULL),
(10, 'design-book', 'Design Book', 'services/7d10950d-d8c1-45e5-9690-b4a72f78c283.webp', '<span style=\"font-size: 18px;\">We transform your translated content into visually compelling, ready-to-publish materials. Our Design Book services ensure that layout, typography, and graphics are perfectly adapted for every language, maintaining your brand identity and professional appearance.</span>', '<div><span style=\"font-size: 18px;\">Our Design Book service transforms your translated content into visually compelling, ready-to-publish layouts. It’s where language meets design — turning raw text into a finished book, report, or catalog that people actually want to open.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We handle the full visual journey: typography, page composition, imagery, and structure, all built around your content and your brand. Every spread is crafted for readability and impact, whether it’s a corporate report, an educational title, or a product catalog.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Multilingual layout is its own discipline, and we treat it that way. Scripts that read right-to-left, languages with longer words, and complex character sets are all accommodated without compromising the design’s balance or beauty.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">You receive a complete, press-ready file — a book that looks intentional in every language, not just translated into it.</span></div><div><br></div>', 'active', '2026-01-10 11:03:55', '2026-06-12 06:55:08', 'Book Design | Multilingual & Press-Ready | Words Tie', 'Turn translated content into publish-ready books, reports & catalogs. Multilingual layout & typography, including RTL Arabic, crafted for print and screen.', 'book design, multilingual book layout, press-ready design, Arabic typesetting, catalog design', NULL),
(11, 'desktop-publishing-dtp', 'Desktop Publishing (DTP)', 'services/e0708f43-b98c-4dc6-80e4-ca3edebc89ce.webp', '<span style=\"font-size: 18px;\">Our Desktop Publishing service ensures that your documents, brochures, manuals, and marketing materials look flawless and read naturally, no matter the language.</span>', '<div><span style=\"font-size: 18px;\">Translation often changes more than words — it changes length, direction, and layout. Our Desktop Publishing service makes sure your documents, brochures, manuals, and presentations look just as polished after translation as they did before.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">When text expands, shrinks, or flows right-to-left, layouts break. Our DTP specialists rebuild them: adjusting spacing, fonts, images, and page flow so every element sits exactly where it should, in any language and any script.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">We work in the industry-standard tools your designers already use, delivering print-ready and screen-ready files that match your brand guidelines down to the detail. Fonts, colors, and styling stay consistent across every language version.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">The outcome is a finished file you can publish, print, or share with confidence — professional, on-brand, and free of the formatting headaches that come with multilingual content.</span></div><div><br></div>', 'active', '2026-01-10 11:04:11', '2026-06-12 06:54:53', 'Desktop Publishing (DTP) | Arabic & RTL & LTR | Words Tie', 'Multilingual DTP that keeps translated documents print-perfect. Arabic & RTL layout, LTR layout, typography & formatting in InDesign and your designers\' tools.', 'desktop publishing, DTP services, multilingual DTP, Arabic DTP, RTL layout, LTR layout, InDesign localization', NULL),
(12, 'transcreation', 'Transcreation', 'services/a02c5053-8384-4684-8a51-f2718e064284.webp', 'Transcreation goes beyond translation. It’s the craft of reshaping your content so it feels native, inspiring, and culturally relevant without losing the spark that made it powerful in the first place.', '<div><span style=\"font-size: 18px;\">Transcreation goes beyond translation. It’s the craft of reshaping your content so it feels native to a new audience — keeping the emotion, the wit, and the persuasion intact, even when a literal translation would fall flat.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Slogans, taglines, ad campaigns, and brand stories rarely survive a word-for-word approach. A pun that lands in English may mean nothing elsewhere; a cultural reference that resonates at home can confuse audiences abroad. Transcreation rewrites the idea, not just the sentence.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">Our creative linguists are part translator, part copywriter. They study your brand voice, your goals, and your audience, then craft messaging that hits the same emotional note in another language and culture — so your campaign performs everywhere it runs.</span></div><div><span style=\"font-size: 18px;\"><br></span></div><div><span style=\"font-size: 18px;\">If your words are meant to sell, inspire, or move people, transcreation makes sure they still do — no matter where in the world they’re read.</span></div><div><br></div>', 'active', '2026-01-10 11:04:26', '2026-06-12 06:51:54', 'Transcreation | Creative Marketing Translation | Words Tie', 'Reshape slogans, taglines & campaigns so they land in every culture. Creative Arabic & multilingual transcreation that keeps your message persuasive.', 'transcreation, creative translation, marketing translation, Arabic transcreation, slogan adaptation', NULL),
(13, 'transcription', 'Transcription', 'services/c5e5ae3d-2b26-4ee0-807e-80b553ae9470.webp', 'Our transcription service captures every detail tone, meaning, and nuance ensuring your audio or video content becomes accurate, ready-to-use written material.', '<div><span style=\"font-size: 18px;\">Our transcription service turns audio and video into clean, accurate text — capturing not just the words, but the tone, meaning, and nuance behind them. From interviews and meetings to lectures, podcasts, and legal recordings, we deliver transcripts you can actually use.</span></div><div><br></div><div><span style=\"font-size: 18px;\">Every file is handled by trained human transcribers, not raw machine output. That means correct speaker labels, proper punctuation, and the judgment to tell a meaningful pause from background noise — details automated tools routinely miss.</span></div><div><br></div><div><span style=\"font-size: 18px;\">You choose the style that fits your needs: verbatim, when every “um” and false start matters, or clean and readable, when clarity comes first. We can add timestamps, speaker IDs, and formatting tailored to how you’ll use the final document.</span></div><div><br></div><div><span style=\"font-size: 18px;\">Fast turnaround, strict confidentiality, and an NDA on every recording. Whatever you’ve recorded, we’ll make sure none of it gets lost in the writing down.</span></div><div><br></div>', 'active', '2026-01-10 11:04:44', '2026-06-12 06:51:38', 'Transcription Services | Audio & Video to Text | Words Tie', 'Accurate human transcription of audio & video: interviews, meetings, podcasts, legal. Verbatim or clean-read, with speaker labels, timestamps & NDA.', 'transcription services, audio transcription, video transcription, Arabic transcription, verbatim transcription', NULL),
(14, 'translation', 'Translation', 'services/2a4f2859-ac2f-4213-b7b8-6c4e5dbbf394.webp', 'Translation is more than switching words from one language to another, it’s the art of carrying meaning, tone, and intention across cultures with precision and elegance.', '<div><div><span style=\"font-size: 18px;\">Translation is far more than swapping words from one language into another. It’s the craft of carrying meaning, tone, and intent across a border so your message lands exactly the way you meant it. At Words Tie, every project is handled by professional linguists who translate into their native language and know the subject inside out.</span></div><div><br></div><div><span style=\"font-size: 18px;\">Whether it’s a single contract, a marketing campaign, or a full product line, we match each file with the right specialist. Legal, medical, technical, financial, creative — the words change, but the standard never does: accurate, consistent, and faithful to your original.</span></div><div><br></div><div><span style=\"font-size: 18px;\">We work across 150+ languages and pair human expertise with smart tools and glossaries, so your terminology stays consistent across every document, every time. The result reads as if it were written in the target language from the start — never translated.</span></div><div><br></div><div><span style=\"font-size: 18px;\">Pricing is per word and fully transparent, with no hidden fees and an NDA on every file. Send us your text and get a real quote in 30 minutes, not a vague estimate days later.</span></div></div><div><br></div>', 'active', '2026-01-10 11:04:55', '2026-06-12 06:51:01', 'Translation Services | 150+ Languages | Words Tie', 'Professional translation in 150+ languages by native expert linguists. Legal, medical, technical & marketing. Accurate, consistent, NDA on every file.', 'translation services, professional translation, Arabic translation, document translation, 150 languages', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1Pcf41eLtM9UII0nztLcsUUJosbUff6ciRZRzpfT', NULL, '112.32.241.194', 'User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUXVrcWZLRXdWcGJ4Z3FOVmtjOEt2ZmM4Y1VoUmVWNjVSZGZOMTBBayI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781299725),
('2VNHNxw9WI58FaApSRwu3gOKNGZYlLeVfKoWpkgv', NULL, '196.155.207.247', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUkR1THd5amlIWHJacVZXTU5OcGtHOTVMMHRXYXBaSXdEMHRDclhqYSI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781281156),
('5RHSpTqRpohi4dV9mYE6lNkObrEv4QdO3k4bB6av', 1, '41.47.117.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN24xbzlyVkZCdzdUaHlFYmdOYzZIUEdCUUhGRWZLN3pHZUZhWWJLTiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781292267),
('7Bffo92jl9ssgelE5u10JVJl4TdTctgF6DE27H1c', NULL, '103.170.85.225', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYlZHRHZpY3REVFM2QzNsaHo3Qlh3RHNiZTZ1NG1XWFg0NG1UR2tMdSI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly93b3Jkcy10aWUuY29tL2NvbnRhY3QiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781285501),
('9GlTIVi45ppvAGHF0kks27a9yqPoBd96XRChyFu1', NULL, '34.245.106.7', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXZMeWJCS2Z5NHMwTmY5c21PZldKSHpmZ3dSWlJtYnpWTHlZN2tPQiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781281379),
('BpZsrXfcS9IYmJwkXiz8Y3LGxq5luakdkZArdtYi', NULL, '17.246.23.209', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieHl2d0puY3BDUjN1VXM4aW1mc1U5dUpkU3dKNEZiSDc4TVNGTlJtUiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781285906),
('BsPqVvsoAltffzaZCQNjKGoxEVmBGpnBEiqarluF', NULL, '66.249.64.67', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.7778.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSlJhZ0VlNW10Q3BkWGY5enVzRW9Yb2NYY2x4cG5EWDdxZDJuWW1vYyI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0MzoiaHR0cHM6Ly93b3Jkcy10aWUuY29tL2luZHVzdHJpZXMvYXV0b21vdGl2ZSI7czo1OiJyb3V0ZSI7czoxNToiaW5kdXN0cmllcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781280231),
('BXnHh2Gj8vmu3MiQqWwG0LFYGHI9HkUZaiBhas9S', NULL, '204.14.105.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM09UTnJZV09GNFhma1ZCMWFRUHgxQ0wyYmVIblZOYWtRcHZjQVFpNiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781301410),
('e0lsHukjiT0radfEFnU6otiDAqxtwoZluHNnACeg', NULL, '41.43.243.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS0pDbHgwUkZPMUVsZkl2TzVBbHllNklsVXR0bFpQWktOQXJNcWtxbyI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781288250),
('fkJu1NWuRGGbJvY8QlNzQuAqjqfpBg1jPxfLvrXD', NULL, '81.161.59.17', 'Python/3.12 aiohttp/3.9.3', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidGlwN3RXQXBSbEpNNEdnOGhRS0FWaTJmWExFUFROYjNYS2FDTUlrSyI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781285982),
('FmdU82Jegr8YkqEYLlOyrrcwHkCvxLcDZ2LUHUnB', NULL, '184.72.121.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.1.25 (KHTML, like Gecko) Version/8.0 Safari/600.1.25', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHdRUVlJVHQ4WVlvVml2eFR1ZmpRMXRCeEJjMzBNdURJbk5sOHlkbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd29yZHMtdGllLmNvbS9yb2JvdHMudHh0IjtzOjU6InJvdXRlIjtzOjk6InBhZ2Uuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781293419),
('M2dDjpCCEmY3xhH1v8iIQD9uhxLZH4TOjTSnHSUZ', NULL, '41.41.83.211', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibXBkbkdveGc1Wnpsa251aFJKeXFTSkE5RXRFemd5VmlRMDZWRHV2aiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781294364),
('PGW8Us08cxRbAcmpGMltzauXxD9i5jGuQmqC0yJC', NULL, '184.72.121.156', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.1.25 (KHTML, like Gecko) Version/8.0 Safari/600.1.25', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYUhrOXNySzQyV3pDMG1IOG10TnhGeWlXNW1LcnVjdmt2RXJRQnRzcSI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly93b3Jkcy10aWUuY29tL2NvbnRhY3QiO3M6NToicm91dGUiO3M6NzoiY29udGFjdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781293419),
('SiFKV4WEKrozVOXS1D7KVaTovMCC85TvvjcZqLG0', NULL, '104.210.140.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.0; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnpIU3VSMG9Edk1oa1AxWEx0ZHRzS3JXVTFqcTZ5aTZRYkVLSzRWRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd29yZHMtdGllLmNvbS9yb2JvdHMudHh0IjtzOjU6InJvdXRlIjtzOjk6InBhZ2Uuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781298447),
('VXn0hZ9CtapgLjtZ1cOsIrbxfWKCpdyUrSWiREok', NULL, '104.210.140.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.0; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3ZYUzdiam42cFIyVzR5NVJwRlI5d1A3NmtBVUlRWTcyN1lSSUtGeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd29yZHMtdGllLmNvbS9yb2JvdHMudHh0IjtzOjU6InJvdXRlIjtzOjk6InBhZ2Uuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781298442),
('XAZnxlVSQWMWFOKWvRdpWQVaXOFmQIQNUDoevVdb', NULL, '41.43.243.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMTVpcElhVWREaHVYck14blI2RGl6a1FDcGlJbHgyZzUxdmE3UG8xbiI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cHM6Ly93b3Jkcy10aWUuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781288292);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `label`, `type`, `created_at`, `updated_at`) VALUES
(1, 'address', 'Suez canal st. El Mansoura, Egypt', 'Address', 'textarea', '2026-01-07 18:09:24', '2026-04-22 09:03:16'),
(2, 'email', 'info@words-tie.com', 'Email', 'email', '2026-01-07 18:09:24', '2026-05-04 18:37:30'),
(3, 'phone', '(+20) 1024672838', 'Phone', 'text', '2026-01-07 18:09:24', '2026-05-14 16:54:54'),
(4, 'linkedin', 'https://www.linkedin.com/company/words-tie/posts/?feedView=all', 'LinkedIn', 'url', '2026-01-07 18:09:24', '2026-05-14 16:55:37'),
(5, 'x', NULL, 'X (Twitter)', 'url', '2026-01-07 18:09:24', '2026-04-22 07:41:10'),
(6, 'facebook', NULL, 'Facebook', 'url', '2026-01-07 18:09:24', '2026-04-22 07:41:10'),
(7, 'instagram', NULL, 'Instagram', 'url', '2026-01-07 18:09:24', '2026-04-21 12:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `task_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` bigint UNSIGNED DEFAULT NULL,
  `page_numbers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `words_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_pair` json NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `closed_by` bigint UNSIGNED DEFAULT NULL,
  `status` enum('pending','in_progress','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `task_number`, `reference_number`, `page_numbers`, `words_count`, `client_code`, `language_pair`, `start_date`, `end_date`, `start_time`, `end_time`, `notes`, `link`, `created_by`, `closed_by`, `status`, `created_at`, `updated_at`) VALUES
(4, 'T_00001', NULL, '118', NULL, 'C_00001', '[{\"source\": \"en\", \"target\": \"ar\"}]', '2026-05-05', '2026-05-05', '13:20:00', '17:18:00', 'assasasaas', 'https://www.youtube.com/', 1, NULL, 'in_progress', '2026-05-05 10:18:43', '2026-05-05 10:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `task_languages`
--

CREATE TABLE `task_languages` (
  `language_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_service`
--

CREATE TABLE `task_service` (
  `service_id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_service`
--

INSERT INTO `task_service` (`service_id`, `task_id`) VALUES
(11, 4),
(14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `role_id`, `phone`, `agency`, `currency`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@words-tie.com', 'active', 1, NULL, NULL, NULL, '2026-01-07 18:09:24', '$2y$12$qsQQgXUiiQUFUIxUSD8NTenaWrXbXSb90h6D4pwk3wQAwZ65r59Ve', '8JMgb3IB6vYRIue33YqaPHCt4nenjE0i2oscAZFcXeSm2K4CfBjC6mwRYfca', '2026-01-07 18:09:24', '2026-04-21 17:17:10'),
(7, 'Sameh Mohamed', 'vm@words-tie.com', 'active', 3, NULL, NULL, NULL, NULL, '$2y$12$XQ.wcrz86.cEQwZfjhm5MOZiWMATTgUn/U4uB24H0GbO4FuuyQq6y', 'kICXPXXPoPsswKY1rlvn6SNAy4Zycp0UbxEwMq5gn2oS7ywlNGZqLk9jzi5b', '2026-05-13 13:15:26', '2026-05-13 13:15:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_client_code_unique` (`client_code`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_phone_unique` (`phone`),
  ADD KEY `clients_created_by_foreign` (`created_by`);

--
-- Indexes for table `client_invoices`
--
ALTER TABLE `client_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_invoices_client_po_id_foreign` (`client_po_id`);

--
-- Indexes for table `client_partners`
--
ALTER TABLE `client_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_pos`
--
ALTER TABLE `client_pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_po_service`
--
ALTER TABLE `client_po_service`
  ADD UNIQUE KEY `client_po_service_client_po_id_service_id_unique` (`client_po_id`,`service_id`),
  ADD KEY `client_po_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `company_capitals`
--
ALTER TABLE `company_capitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finance_client_invoices`
--
ALTER TABLE `finance_client_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_freelancer_invoices`
--
ALTER TABLE `finance_freelancer_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freelancers`
--
ALTER TABLE `freelancers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freelancers_freelancer_code_unique` (`freelancer_code`);

--
-- Indexes for table `freelancer_invoices`
--
ALTER TABLE `freelancer_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freelancer_invoices_freelancer_po_id_foreign` (`freelancer_po_id`);

--
-- Indexes for table `freelancer_pos`
--
ALTER TABLE `freelancer_pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `freelancer_pos_created_by_foreign` (`created_by`);

--
-- Indexes for table `freelancer_po_service`
--
ALTER TABLE `freelancer_po_service`
  ADD UNIQUE KEY `freelancer_po_service_freelancer_po_id_service_id_unique` (`freelancer_po_id`,`service_id`),
  ADD KEY `freelancer_po_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `freelancer_service`
--
ALTER TABLE `freelancer_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `freelancer_service_freelancer_id_service_id_unique` (`freelancer_id`,`service_id`),
  ADD KEY `freelancer_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `freelancer_task`
--
ALTER TABLE `freelancer_task`
  ADD UNIQUE KEY `freelancer_task_freelancer_code_task_id_unique` (`freelancer_code`,`task_id`),
  ADD KEY `freelancer_task_task_id_foreign` (`task_id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `industries_slug_unique` (`slug`);

--
-- Indexes for table `ios_images`
--
ALTER TABLE `ios_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `project_requests`
--
ALTER TABLE `project_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_service`
--
ALTER TABLE `request_service`
  ADD KEY `request_service_project_request_id_foreign` (`project_request_id`),
  ADD KEY `request_service_service_id_foreign` (`service_id`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission_role_id_permission_id_unique` (`role_id`,`permission_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tasks_task_number_unique` (`task_number`),
  ADD KEY `tasks_created_by_foreign` (`created_by`),
  ADD KEY `tasks_closed_by_foreign` (`closed_by`),
  ADD KEY `tasks_reference_number_foreign` (`reference_number`);

--
-- Indexes for table `task_languages`
--
ALTER TABLE `task_languages`
  ADD KEY `task_languages_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_service`
--
ALTER TABLE `task_service`
  ADD KEY `task_service_service_id_foreign` (`service_id`),
  ADD KEY `task_service_task_id_foreign` (`task_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client_invoices`
--
ALTER TABLE `client_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_partners`
--
ALTER TABLE `client_partners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `client_pos`
--
ALTER TABLE `client_pos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_capitals`
--
ALTER TABLE `company_capitals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_client_invoices`
--
ALTER TABLE `finance_client_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finance_freelancer_invoices`
--
ALTER TABLE `finance_freelancer_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freelancers`
--
ALTER TABLE `freelancers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `freelancer_invoices`
--
ALTER TABLE `freelancer_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `freelancer_pos`
--
ALTER TABLE `freelancer_pos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `freelancer_service`
--
ALTER TABLE `freelancer_service`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ios_images`
--
ALTER TABLE `ios_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `project_requests`
--
ALTER TABLE `project_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `client_invoices`
--
ALTER TABLE `client_invoices`
  ADD CONSTRAINT `client_invoices_client_po_id_foreign` FOREIGN KEY (`client_po_id`) REFERENCES `client_pos` (`id`);

--
-- Constraints for table `client_po_service`
--
ALTER TABLE `client_po_service`
  ADD CONSTRAINT `client_po_service_client_po_id_foreign` FOREIGN KEY (`client_po_id`) REFERENCES `client_pos` (`id`),
  ADD CONSTRAINT `client_po_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `freelancer_invoices`
--
ALTER TABLE `freelancer_invoices`
  ADD CONSTRAINT `freelancer_invoices_freelancer_po_id_foreign` FOREIGN KEY (`freelancer_po_id`) REFERENCES `freelancer_pos` (`id`);

--
-- Constraints for table `freelancer_pos`
--
ALTER TABLE `freelancer_pos`
  ADD CONSTRAINT `freelancer_pos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `freelancer_po_service`
--
ALTER TABLE `freelancer_po_service`
  ADD CONSTRAINT `freelancer_po_service_freelancer_po_id_foreign` FOREIGN KEY (`freelancer_po_id`) REFERENCES `freelancer_pos` (`id`),
  ADD CONSTRAINT `freelancer_po_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `freelancer_service`
--
ALTER TABLE `freelancer_service`
  ADD CONSTRAINT `freelancer_service_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `freelancer_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `freelancer_task`
--
ALTER TABLE `freelancer_task`
  ADD CONSTRAINT `freelancer_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `request_service`
--
ALTER TABLE `request_service`
  ADD CONSTRAINT `request_service_project_request_id_foreign` FOREIGN KEY (`project_request_id`) REFERENCES `project_requests` (`id`),
  ADD CONSTRAINT `request_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_reference_number_foreign` FOREIGN KEY (`reference_number`) REFERENCES `tasks` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_languages`
--
ALTER TABLE `task_languages`
  ADD CONSTRAINT `task_languages_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_service`
--
ALTER TABLE `task_service`
  ADD CONSTRAINT `task_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `task_service_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
