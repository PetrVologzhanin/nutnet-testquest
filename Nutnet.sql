-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 10 2023 г., 22:20
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Nutnet`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`%` PROCEDURE `add_album` (IN `name` VARCHAR(255), IN `executor` VARCHAR(255), IN `description` VARCHAR(255), IN `img_link` VARCHAR(255))   BEGIN
INSERT INTO `album`(`name`, `executor`, `description`, `img_link`) VALUES(name,executor,description,img_link);
END$$

CREATE DEFINER=`root`@`%` PROCEDURE `test_curs` (OUT `id_album_c` INT, OUT `name_c` VARCHAR(255))   BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE test_curs CURSOR FOR SELECT id_album, name FROM album;
SET done = TRUE;

OPEN test_curs;
read_loop: LOOP
FETCH test_curs INTO id_album_c, name_c;
IF done THEN
	LEAVE read_loop;
END IF;
SELECT id_album_c, name_c;
END LOOP;
CLOSE test_curs;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `album`
--

CREATE TABLE `album` (
  `id_album` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `executor` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `album`
--

INSERT INTO `album` (`id_album`, `name`, `executor`, `description`, `img_link`) VALUES
(1, 'Holy Hell', 'Architects', 'Holy Hell — восьмой студийный альбом британской металкор-группы Architects, вышедший 9 ноября 2018 года. Он стал первым альбомом, выпущенным группой после смерти основателя и автора песен Тома Сирла.', '/public/assets/img/Architects-HolyHell.jpg'),
(2, 'Disgusting', 'Beartooth', 'Disgusting — дебютный студийный альбом американской рок-группы Beartooth. Он был выпущен 10 июня 2014 года на лейблах Red Bull Records и UNFD Records. Сингл «Beaten In Lips» вышел 13 мая 2014 года вместе с предзаказом на альбом', '/public/assets/img/Beartooth-Disgusting.png'),
(4, 'Filosofem', 'Burzum', 'Filosofem - четвёртый студийный альбом норвежского музыкальнта Варга Викернеса Burzum. Он был записан в 1993  и стал последней записью перед тем, как Варга посадили в тюрьму из-за убийства Евронимуса; однако альбом был выпущен в 1996 году.', '/public/assets/img/Burzum - Filosofem.png'),
(5, 'Chocolate Starfish and the Hot Dog Flavored Water', 'Limp Bizkit', '17 октября 2000 года Limp Bizkit выпустили свой третий альбом «Chocolate Starfish And The Hot Dog Flavored Water».\r\nАльбом вообще-то должен был выйти летом, но вышел только в октябре.', '/public/assets/img/Limp Bizkit - Chocolate Starfish and the Hot Dog Flavored Water.jpg'),
(11, 'Птицы. Сторона Б', 'Ермак!', 'Птицы. Сторона Б - 3 релиз группы Ермак! - пост-хардкор-группа из пятерых ребят, четверо из которых родом из холодной Сибири или далекого Урала. Именно неподдельная любовь к малой и большой родине является стержнем команды.', '/public/assets/img/Ермак!-ПтицыСтронаБ.jpg'),
(17, 'Hybrid Theory (20th Anniversary Edition)', 'Linkin Park', 'Hybrid Theory — дебютный полноценный студийный альбом американской рок-группы Linkin Park, спродюсированный Доном Гилмором и выпущенный 24 октября 2000 года лейблом Warner Bros.', '/public/assets/img/Linkin Park - Hybrid Theory (20th Anniversary Edition).png'),
(18, 'The Death of Me', 'Polaris', 'The Death of Me — второй студийный альбом австралийской металкор-группы Polaris. Группа продюсировала и записывалась в Mollybook Beach NSW с инженерами Лэнсом Пренком и Скотти Симпсоном', '/public/assets/img/Polaris-The Death of Me.png'),
(19, 'Hypnotize', 'System Of A Down', 'Hypnotize — пятый студийный альбом американской альтернативной метал группы System of a Down, выпущенный 22 ноября 2005 года на звукозаписывающем лейбле Columbia Records. Продюсированием альбома занимались Рик Рубин и Дарон Малакян', '/public/assets/img/System Of A Down - Hypnotize.png'),
(20, 'They’re Only Chasing Safety', 'Underoath', 'They’re Only Chasing Safety — четвертый студийный альбом американской рок-группы Underoath. Этот альбом был записан с новым вокалистом Спенсером Чемберлейном. Предыдущий вокалист Даллас Тейлор покинул группу по неизвестным причинам.', '/public/assets/img/Underoath-They’re Only Chasing Safety.png'),
(27, 'Korn (название альбома)', 'Korn (название группы)', 'дебютный студийный альбом ню-метал-группы Korn. Издан 11 октября 1994 года лейблом Immortal и Epic Records. Альбом стал 2 раза «платиновым» по версии RIAA 10 ноября 1999 года[5], а во всём мире продано более 10 миллионов копий.', 'https://upload.wikimedia.org/wikipedia/ru/thumb/7/75/Korn-korn.jpg/274px-Korn-korn.jpg'),
(46, '2004 - 2013', 'Bring Me The Horizon', 'Альбом Bring Me The Horizon 2004–2013 годов , сборник лучших треков с их первых пяти релизов, доступен уже сейчас. 15 песен на альбоме Bring Me The Horizon 2004–2013 годов охватывают первые девять лет существования британской метал группы', '/public/assets/img/Bring Me The Horizon - 2004 - 2013.png');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `overheard`
--

CREATE TABLE `overheard` (
  `id_overheard` int NOT NULL,
  `id_album` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('test@test', '$2y$10$7.4krcqZL/HTHoAaftGmyeGQLZFq4oQtCGKwjZR7bGmdl1/UqTnIa', '2023-12-10 14:23:24');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@test', NULL, '$2y$10$kFObG5Bh0Bn3lc0SgNliKulDQvEuhCuebEXvDqK.eeLOI/WlVQsjG', 'rjbQ0dAxBAXhm1Nli5koqleQrb7akYS8DfgFC8iFFnAHOu2LjD8xNHsQQtqv', '2023-12-07 13:57:30', '2023-12-07 13:57:30'),
(2, 'Vologzhanin Petr', 'samiy_petr@mail.ru', NULL, '$2y$10$HAucJ8NJ0HO3EAhGRaghy.qEwzmegUY0./TkbqVy1jmHSJi83vuoK', NULL, '2023-12-09 12:18:45', '2023-12-09 12:18:45'),
(3, 'testtest', 'testtest@test', NULL, '$2y$10$YZjLqOy/DSj8UhnUeSstruKyAZFfPM.bgqN2WjQVqmaVVvR4Ar0FW', NULL, '2023-12-09 18:30:04', '2023-12-09 18:30:04'),
(4, 'Bogdan', 'Bogdan@mail.ru', NULL, '$2y$10$hHSKGzzr1yYU7VzgkoYOruROVknLcm5KvbMs2dLFsjZI2ZO0c0MUG', NULL, '2023-12-10 10:57:54', '2023-12-10 10:57:54'),
(5, 'asd', 'asd@asd', NULL, '$2y$10$NqOqlaCrYhE/6mjTRfHVU.oXYpWMPoC9PTPLA8lQ36KLU6nKZ4Hce', NULL, '2023-12-10 14:24:14', '2023-12-10 14:24:14'),
(6, 'ubivaka228', 'ubivaka228@mal', NULL, '$2y$10$JR7C5njGA7yy6zGGWhPim.O99iex/fg8tasnqSRrhznieKlPgzCXe', 'DeCPTvDqU6na57HU3g3m1m9D8V2VCB2TZ05k9f25LCczFy8A04DalLprVOJ0', '2023-12-10 16:00:08', '2023-12-10 16:00:08');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `overheard`
--
ALTER TABLE `overheard`
  ADD PRIMARY KEY (`id_overheard`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `overheard`
--
ALTER TABLE `overheard`
  MODIFY `id_overheard` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `overheard`
--
ALTER TABLE `overheard`
  ADD CONSTRAINT `overheard_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `overheard_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
