-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 18, 2020 lúc 09:52 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `login_with_oauth2_springboot_security`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_role`
--

CREATE TABLE `app_role` (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `app_role`
--

INSERT INTO `app_role` (`role_id`, `role_name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `app_user`
--

CREATE TABLE `app_user` (
  `user_id` bigint(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `encryted_password` varchar(128) NOT NULL,
  `first_name` varchar(36) DEFAULT NULL,
  `last_name` varchar(36) DEFAULT NULL,
  `user_name` varchar(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `app_user`
--

INSERT INTO `app_user` (`user_id`, `email`, `enabled`, `encryted_password`, `first_name`, `last_name`, `user_name`) VALUES
(4, 'chauquangtam20002@gmail.com', b'1', '$2a$10$MAFgtJOhmqxkVLoSWOaE6uXsEl9W.UA8EFDaxLyIAeM56vniStxli', 'Tâm', 'Châu', 'qt2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(6),
(6),
(6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `series` varchar(64) NOT NULL,
  `last_used` datetime NOT NULL,
  `token` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userconnection`
--

CREATE TABLE `userconnection` (
  `Userid` varchar(255) NOT NULL,
  `Providerid` varchar(255) NOT NULL,
  `Provideruserid` varchar(255) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Displayname` varchar(255) DEFAULT NULL,
  `Profileurl` varchar(255) DEFAULT NULL,
  `Imageurl` varchar(255) DEFAULT NULL,
  `Accesstoken` varchar(255) DEFAULT NULL,
  `Secret` varchar(255) DEFAULT NULL,
  `Refreshtoken` varchar(255) DEFAULT NULL,
  `Expiretime` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `userconnection`
--

INSERT INTO `userconnection` (`Userid`, `Providerid`, `Provideruserid`, `Rank`, `Displayname`, `Profileurl`, `Imageurl`, `Accesstoken`, `Secret`, `Refreshtoken`, `Expiretime`) VALUES
('qt2', 'google', '105338064385965147989', 1, 'Tâm Châu', NULL, 'https://lh4.googleusercontent.com/-8rO1uNlPcjM/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclG8SvFoikmegG9whPgadnP0qXM8Q/s50/photo.jpg', 'ya29.a0AfH6SMCyVzAubHwyttr3TCEtEN_NqAsrnzNSNfGL6jBkDkeoaBensVuKVeyawMiTLKpeB0rUrVu23iqM0qHoteOWzYAsh6KAA4IeOM6l4rGY4l3lNN9pdsjdXfp4AxobqanGIuJT7smW_SOU7YCo9Wfo02B7t-zCN4Y', NULL, NULL, 1595061574840);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `role_id`, `user_id`) VALUES
(5, 2, 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `app_role`
--
ALTER TABLE `app_role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `APP_ROLE_UK` (`role_name`);

--
-- Chỉ mục cho bảng `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `APP_USER_UK` (`user_name`),
  ADD UNIQUE KEY `APP_USER_UK2` (`email`);

--
-- Chỉ mục cho bảng `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Chỉ mục cho bảng `userconnection`
--
ALTER TABLE `userconnection`
  ADD PRIMARY KEY (`Userid`,`Providerid`,`Provideruserid`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `USER_ROLE_UK` (`user_id`,`role_id`),
  ADD KEY `FKp6m37g6n6c288s096400uw8fw` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
