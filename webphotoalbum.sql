-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 25 2022 г., 03:36
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_cigvincev897_webphotoalbum`
--

-- --------------------------------------------------------

--
-- Структура таблицы `folder`
--

CREATE TABLE `folder` (
  `folderId` int UNSIGNED NOT NULL,
  `name` varchar(500) NOT NULL,
  `userId` int UNSIGNED NOT NULL,
  `createdDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В этой таблице хранятся папки пользователей';

--
-- Дамп данных таблицы `folder`
--

INSERT INTO `folder` (`folderId`, `name`, `userId`, `createdDate`) VALUES
(15, 'Дом', 11, '2022-10-13'),
(16, 'Работа', 11, '2022-10-06'),
(17, 'Общее', 11, '2022-10-13'),
(18, 'Универ', 12, '2022-10-01'),
(19, 'Дача', 12, '2022-08-09'),
(20, 'Отдых', 12, '2022-09-14'),
(21, 'Новый год', 13, '2021-12-31'),
(22, 'Море', 13, '2022-08-09'),
(23, 'Парк', 13, '2022-08-10');

-- --------------------------------------------------------

--
-- Структура таблицы `photoRating`
--

CREATE TABLE `photoRating` (
  `photoRatingId` int UNSIGNED NOT NULL,
  `photoId` int UNSIGNED NOT NULL,
  `userId` int UNSIGNED NOT NULL,
  `score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `photoRating`
--

INSERT INTO `photoRating` (`photoRatingId`, `photoId`, `userId`, `score`) VALUES
(1, 36, 11, 5),
(2, 36, 12, 5),
(3, 36, 13, 5),
(4, 37, 11, 5),
(5, 37, 12, 3),
(6, 37, 13, 4),
(7, 38, 11, 5),
(8, 38, 12, 0.5),
(9, 38, 13, 0.5);

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `photoId` int UNSIGNED NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdDate` date NOT NULL,
  `folderId` int UNSIGNED NOT NULL,
  `path` varchar(512) NOT NULL COMMENT 'Путь/ссылка',
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='В этой таблице хранятся фото пользователей, которые привязаны к определённым папкам';

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`photoId`, `name`, `description`, `createdDate`, `folderId`, `path`, `rating`) VALUES
(36, 'Собака', 'Моя собака', '2022-10-01', 15, 'Какой-то путь', 5),
(37, 'Баня', '', '2022-10-01', 15, 'Какой-то путь', 4),
(38, 'Случайное фото', NULL, '2022-10-01', 15, 'Какой-то путь', 2),
(39, 'Я', 'Моя фотография', '2022-10-11', 15, 'Какой-то путь', 5),
(40, 'Кухня', 'Сделал ремонт на кухне', '2022-08-08', 15, 'Какой-то путь', 4),
(41, 'Потоп', 'Затопили соседи', '2022-04-06', 15, 'Какой-то путь', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `photoTag`
--

CREATE TABLE `photoTag` (
  `photoTagId` int UNSIGNED NOT NULL,
  `tagId` int UNSIGNED NOT NULL,
  `photoId` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `photoTag`
--

INSERT INTO `photoTag` (`photoTagId`, `tagId`, `photoId`) VALUES
(1, 1, 36),
(2, 4, 36);

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `tagId` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tag`
--

INSERT INTO `tag` (`tagId`, `name`) VALUES
(1, 'Собака'),
(2, 'Дача'),
(3, 'Дом'),
(4, 'Отдых'),
(5, 'Природа');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `userId` int UNSIGNED NOT NULL COMMENT 'ID пользователя',
  `firstname` varchar(255) NOT NULL COMMENT 'Имя',
  `lastname` varchar(255) NOT NULL COMMENT 'Фамилия',
  `login` varchar(255) NOT NULL,
  `md5password` varchar(255) NOT NULL,
  `isAdmin` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Является админом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Здесь хранятся пользователи';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`userId`, `firstname`, `lastname`, `login`, `md5password`, `isAdmin`) VALUES
(11, 'Игорь', 'Иванов', 'igor@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b', 0),
(12, 'Илья', 'Кузнецов', 'Kuznecov@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b', 0),
(13, 'Максим', 'Павлов', 'Pavlov@mail.ru', 'c4ca4238a0b923820dcc509a6f75849b', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`folderId`),
  ADD KEY `id_user` (`userId`);

--
-- Индексы таблицы `photoRating`
--
ALTER TABLE `photoRating`
  ADD PRIMARY KEY (`photoRatingId`),
  ADD KEY `photoId` (`photoId`),
  ADD KEY `userId` (`userId`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photoId`),
  ADD KEY `id_folder` (`folderId`);

--
-- Индексы таблицы `photoTag`
--
ALTER TABLE `photoTag`
  ADD PRIMARY KEY (`photoTagId`),
  ADD KEY `photoId` (`photoId`),
  ADD KEY `tagId` (`tagId`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagId`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `folder`
--
ALTER TABLE `folder`
  MODIFY `folderId` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `photoRating`
--
ALTER TABLE `photoRating`
  MODIFY `photoRatingId` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `photoId` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `photoTag`
--
ALTER TABLE `photoTag`
  MODIFY `photoTagId` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `tagId` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `userId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID пользователя', AUTO_INCREMENT=14;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `photoRating`
--
ALTER TABLE `photoRating`
  ADD CONSTRAINT `photoRating_ibfk_1` FOREIGN KEY (`photoId`) REFERENCES `photos` (`photoId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `photoRating_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`folderId`) REFERENCES `folder` (`folderId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `photoTag`
--
ALTER TABLE `photoTag`
  ADD CONSTRAINT `photoTag_ibfk_1` FOREIGN KEY (`photoId`) REFERENCES `photos` (`photoId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `photoTag_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
