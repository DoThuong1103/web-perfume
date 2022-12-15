-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 14, 2021 lúc 08:07 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_cntt110`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adminStatus` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`username`, `password`, `adminStatus`) VALUES
('admin', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brandName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brandStatus` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `brandName`, `brandStatus`) VALUES
(1, 'Gucci', 1),
(2, 'Dior', 1),
(3, 'Coco chanel', 1),
(4, 'Calvin Klein', 1),
(5, 'Burberry', 1),
(6, 'Versace', 1),
(7, 'Narciso', 1),
(8, 'Lancome', 1),
(11, 'Valentino', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `userid`, `productid`, `date`, `content`, `status`) VALUES
(1, 1, 1, '2021-10-28 19:10:11', 'abcd\r\n', 0),
(2, 1, 1, '2021-10-28 19:10:49', 'abcd\r\n', 1),
(3, 1, 1, '2021-10-28 19:12:43', 'abcd\r\n', 1),
(4, 1, 1, '2021-11-01 21:52:32', 'hi\r\n', 1),
(5, 1, 1, '2021-11-01 21:52:44', 'hi\r\n', 1),
(6, 1, 1, '2021-11-01 21:53:37', 'hi\r\n', 1),
(7, 1, 1, '2021-11-01 21:53:53', 'hii', 1),
(8, 1, 1, '2021-11-01 21:54:21', 'hiii', 1),
(9, 1, 1, '2021-11-01 21:54:24', 'hiii', 1),
(10, 1, 1, '2021-11-01 21:54:28', 'hiii', 1),
(11, 1, 1, '2021-11-01 21:54:40', 'hiii', 1),
(12, 1, 1, '2021-11-01 21:54:47', 'hu', 1),
(13, 1, 1, '2021-11-01 21:54:53', 'hu', 1),
(14, 1, 1, '2021-11-01 21:55:54', 'ha', 1),
(15, 1, 1, '2021-11-01 21:56:13', 'hr', 1),
(16, 1, 1, '2021-11-12 23:10:34', 'as', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `productid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sumprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`productid`, `orderid`, `number`, `price`, `sumprice`) VALUES
(1, 1, 1, 2050000, 0),
(1, 2, 0, 2050000, 0),
(1, 4, 1, 2050000, 0),
(1, 5, 9, 2050000, 0),
(1, 7, 0, 2050000, 9),
(1, 8, 1, 2050000, 2050000),
(2, 3, 1, 2000000, 0),
(2, 7, 2, 2000000, 4000000),
(2, 9, 1, 2000000, 2000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordermethod`
--

CREATE TABLE `ordermethod` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ordermethod`
--

INSERT INTO `ordermethod` (`id`, `name`, `status`) VALUES
(1, 'Trực tiếp cho người giao hàng', 1),
(2, 'Chuyển khoản', 1),
(3, 'Thanh toán tại shop', 1),
(4, 'Paypal', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ordermethodid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `ordermethodid`, `userid`, `orderdate`, `status`, `name`, `address`, `mobile`, `email`, `note`) VALUES
(1, 1, 1, '2021-10-28 17:41:26', 3, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'sdvsdg'),
(2, 1, 1, '2021-10-28 21:06:58', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'segsdgbre'),
(3, 1, 1, '2021-10-28 21:07:41', 2, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'ddawjt hang'),
(4, 1, 1, '2021-10-28 21:24:26', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', ''),
(5, 1, 1, '2021-10-30 15:09:47', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'sffsdgwet'),
(6, 1, 1, '2021-10-30 15:27:13', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'àdgg'),
(7, 1, 1, '2021-10-30 15:53:02', 4, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'sdgsrh'),
(8, 1, 1, '2021-11-04 21:50:59', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'ấvccv'),
(9, 1, 1, '2021-11-11 10:37:59', 1, 'ABCD', '1231212412', '0987654321', 'abcd@gmail.com', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `prices`
--

CREATE TABLE `prices` (
  `id` tinyint(4) NOT NULL,
  `pricesFrom` int(11) NOT NULL,
  `pricesTo` int(11) NOT NULL,
  `pricesStatus` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `prices`
--

INSERT INTO `prices` (`id`, `pricesFrom`, `pricesTo`, `pricesStatus`) VALUES
(1, 0, 2000000, 1),
(2, 2000000, 5000000, 1),
(3, 5000000, 10000000, 1),
(4, 10000000, 20000000, 1),
(5, 20000000, 99999999, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `productName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productImage` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productStatus` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `brandid`, `productName`, `productImage`, `productPrice`, `productDescription`, `productStatus`) VALUES
(1, 1, 'Nước Hoa Nam Gucci Guilty Pour', '1635407972_nuoc-hoa-nam-gucci-2.jpeg', 2050000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Woody &ndash; t&ocirc;ng m&ugrave;i gỗ</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2011</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Mạnh mẽ, nam t&iacute;nh, sang trọng</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: GUCCI GUILTY</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(2, 1, 'Nước Hoa Gucci Guilty Intense ', '1635408030_nuoc-hoa-gucci1.png', 2000000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Oriental Floral: hoa cỏ phương Đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 75 ml</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2011</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Xuất xứ: &Yacute;</li>\r\n	<li>Ph&acirc;n loại: GUCCI GUILTY</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(3, 1, 'Nước Hoa Gucci By Gucci Sport ', '1635408507_nuoc-hoa-gucci-3.png', 1950000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Woody &ndash; t&ocirc;ng m&ugrave;i gỗ</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2010</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n</ul>\r\n', 1),
(4, 1, 'Nước Hoa Nữ Gucci By Gucci EDP', '1635408578_nuoc-hoa-nu-gucci-4.jpeg', 3000000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Chypre Floral - hương hoa cỏ Chypre</li>\r\n	<li>Dung t&iacute;ch: 75 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2007</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Nữ t&iacute;nh, dịu d&agrave;ng, trang nh&atilde;</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(5, 1, 'Nước Hoa Nữ Gucci Guilty Pour ', '1635408862_nuoc-hoa-nu-gucci-5.jpeg', 4000000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Chypre Fruity - hương tr&aacute;i c&acirc;y Chypre</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2019</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Gợi cảm, nữ t&iacute;nh, thanh lịch</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: GUCCI GUILTY</li>\r\n</ul>\r\n', 1),
(6, 1, 'Flora By Gucci – Nước Hoa Nữ Đ', '1635408938_nuoc-hoa-gucci.jpeg', 10000000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Chypre - hương hoa cỏ tự nhi&ecirc;n</li>\r\n	<li>Dung t&iacute;ch: 50 ml</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2009</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(7, 2, 'Nước Hoa Nam Dior Sauvage EDP', '1635409450_nuoc-hoa-dior-sauvage-2.jpg', 15000000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau de Parfum</p>\r\n	</li>\r\n	<li>Lưu hương: 6 - 10h</li>\r\n	<li>Nh&oacute;m hương: Bưởi, gỗ v&agrave; gia vị</li>\r\n	<li>Dung t&iacute;ch: 60ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2021</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: DIOR SAUVAGE</li>\r\n</ul>\r\n', 1),
(8, 2, 'Nước hoa nam Christian Dior Sa', '1635409549_4-3-nuoc-hoa-nam-dior-sauvage-3.jpg', 29500000, '', 1),
(9, 2, 'Nước hoa Dior Miss Dior EDT', '1635409840_nuoc-hoa-dior-4.jpg', 2650000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau De Toilette (EDT)</p>\r\n	</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Chypre Floral - hương hoa cỏ Chypre</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2013</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Gợi cảm, nữ t&iacute;nh, thanh lịch</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: MISS DIOR</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(10, 3, 'Nước hoa Chanel Coco Noir EDP ', '1635410291_13-nuoc-hoa-chanel-coco-1.jpg', 3600000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau de Parfum</p>\r\n	</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2012</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: B&iacute; ẩn, gợi cảm, quyến rũ</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(11, 0, 'Nước hoa Chanel Coco Mademoise', '1635410424_nuoc-hoa-chanel-coco-2.jpg', 3500000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau de Parfum</p>\r\n	</li>\r\n	<li>Lưu hương: Tr&ecirc;n 12h</li>\r\n	<li>Nh&oacute;m hương: Chypre Floral - hương hoa cỏ Chypre</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 2m</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2001</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Nữ t&iacute;nh, tươi tắn, gợi cảm</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: Chanel Coco</li>\r\n</ul>\r\n', 1),
(12, 3, 'Nước hoa Chanel Coco Vaporisat', '1635410691_nuoc-hoa-chanel-coco-3.jpg', 22000000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau de Parfum</p>\r\n	</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Oriental Spicy - hương cay nồng phương Đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 2m</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 1984</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Ph&acirc;n loại: Chanel Coco</li>\r\n</ul>\r\n', 1),
(13, 4, 'Nước Hoa CK2 Calvin Klein EDT ', '1635410784_nuoc-hoa-calvin-klein-1.jpeg', 300000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Woody Aromatic: hương gỗ thơm, thảo mộc</li>\r\n	<li>Dung t&iacute;ch: 10 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2016</li>\r\n	<li>Giới t&iacute;nh: Unisex</li>\r\n	<li>Phong c&aacute;ch: C&aacute; t&iacute;nh, hiện đại, trẻ trung</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Ph&acirc;n loại: CK2</li>\r\n</ul>\r\n', 1),
(14, 4, 'Nước Hoa Nam Calvin Klein Enco', '1635410842_nuoc-hoa-nam-calvin-klein-2f.jpeg', 5500000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: Dưới 1h</li>\r\n	<li>Nh&oacute;m hương: Oriental Woody - hương gỗ phương đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 50 ml</li>\r\n	<li>Độ tỏa hương: Thoang thoảng tr&ecirc;n da</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2012</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Vui vẻ, lịch l&atilde;m, quyến rũ</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Ph&acirc;n loại: CK ENCOUNTER</li>\r\n</ul>\r\n', 1),
(15, 4, 'Nước Hoa Nam Calvin Klein Eter', '1635411394_nuoc-hoa-nam-calvin-klein-3.jpeg', 22300000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody - hương hoa cỏ, gỗ</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: Thoang thoảng tr&ecirc;n da</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 1990</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Cổ điển, gợi cảm, mạnh mẽ</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Ph&acirc;n loại: CK ETERNITY</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(16, 5, 'Nước Hoa Nam Burberry London F', '1635411587_nuoc-hoa-nam-burberry-1.jpeg', 11000000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Oriental Spicy - hương cay nồng phương Đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2006</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Lịch l&atilde;m, phong trần, trầm ấm</li>\r\n	<li>Xuất xứ: Anh</li>\r\n</ul>\r\n', 1),
(17, 5, 'Nước Hoa Burberry Brit Rhythm', '1635411636_nuoc-hoa-burberry-2.jpeg', 18500000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2014</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Nữ t&iacute;nh, tươi tắn, gợi cảm</li>\r\n	<li>Xuất xứ: Anh</li>\r\n</ul>\r\n', 1),
(18, 5, 'Nước Hoa Nam Burberry For Men ', '1635411689_nuoc-hoa-nam-burberry-2.png', 1449000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Hương gỗ thơm</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 1995</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Quyến rũ, mạnh mẽ, thu h&uacute;t</li>\r\n	<li>Xuất xứ: Anh</li>\r\n</ul>\r\n', 1),
(19, 5, 'Nước Hoa Burberry Brit Rhythm ', '1635411734_nuoc-hoa-burberry-4.jpeg', 12800000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Leather &ndash; t&ocirc;ng da thuộc</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2013</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: C&aacute; t&iacute;nh, mạnh mẽ, trầm ấm</li>\r\n	<li>Xuất xứ: Anh</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(20, 5, 'Nước Hoa Mr Burberry For Men N', '1635411787_nuoc-hoa-mr-burberry-5.jpeg', 965000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Woody Aromatic: hương gỗ thơm, thảo mộc</li>\r\n	<li>Dung t&iacute;ch: 30 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2016</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Cổ điển, gợi cảm, mạnh mẽ</li>\r\n	<li>Xuất xứ: Anh</li>\r\n</ul>\r\n', 1),
(21, 6, 'Nước Hoa Nam Versace Eros', '1635411933_nuoc-hoa-versace-1.jpg', 15000000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau De Toilette (EDT)</p>\r\n	</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Aromatic Fougere - hương thơm thảo mộc</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 2m</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2012</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Xuất xứ: &Yacute;</li>\r\n	<li>Ph&acirc;n loại: VERSACE EROS</li>\r\n</ul>\r\n', 1),
(22, 6, 'Nước Hoa Versace Bright Crysta', '1635411976_nuoc-hoa-versace-2.jpeg', 500000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Floral Fruity - hương hoa cỏ tr&aacute;i c&acirc;y</li>\r\n	<li>Dung t&iacute;ch: 5 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2006</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Thơm m&aacute;t, dịu ngọt</li>\r\n	<li>Xuất xứ: &Yacute;</li>\r\n	<li>Ph&acirc;n loại: VERSACE BRIGHT CRYSTAL</li>\r\n</ul>\r\n', 1),
(23, 6, 'Nước Hoa Versace Yellow Diamon', '1635412081_nuoc-hoa-versace-3.jpg', 15400000, '<ul>\r\n	<li>\r\n	<p>Nồng độ: Eau De Toilette (EDT)</p>\r\n	</li>\r\n	<li>Lưu hương: 6 - 8h</li>\r\n	<li>Nh&oacute;m hương: Floral &ndash; t&ocirc;ng hoa</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2006</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Sang trọng, thu h&uacute;t, ki&ecirc;u sa</li>\r\n	<li>Xuất xứ: &Yacute;</li>\r\n</ul>\r\n', 1),
(24, 7, 'Nước Hoa Narciso Rodriguez Nar', '1635412150_nuoc-hoa-narciso-1.jpeg', 25000000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 3 - 6h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 90 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2018</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: B&iacute; ẩn, gợi cảm, quyến rũ</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n</ul>\r\n', 1),
(25, 6, 'Nước Hoa Nữ Narciso Rodriguez ', '1635412207_nuoc-hoa-nu-narciso-2.jpeg', 2400000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2006</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Nữ t&iacute;nh, tươi tắn, gợi cảm</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(26, 7, 'Nước Hoa Nữ Narciso Rodriguez ', '1635412267_nuoc-hoa-nu-narciso-3.jpeg', 22500000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: Tr&ecirc;n 12h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 50 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2015</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Quyến rũ, giản dị, nữ t&iacute;nh</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n</ul>\r\n', 1),
(27, 7, 'Nước Hoa Nam Narciso Rodriguez', '1635412326_nuoc-hoa-nam-narciso-4.jpeg', 19999999, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Woody Spicy: hương gỗ thơm cay nồng</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2015</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Phong c&aacute;ch: Lịch l&atilde;m, phong trần, trầm ấm</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n</ul>\r\n', 1),
(28, 0, 'Nước Hoa Narciso Rodriguez Fle', '1635412383_nuoc-hoa-narciso-5.jpeg', 2050000, '<ul>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Lưu hương: 6 - 8h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 1 c&aacute;nh tay</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2020</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Sang trọng, thu h&uacute;t, ki&ecirc;u sa</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Mặt h&agrave;ng: C&oacute; sẵn</li>\r\n</ul>\r\n', 1),
(29, 8, 'Nước Hoa Nữ Lancome Tresor La ', '1635412473_nuoc-hoa-nu-lancome-1.jpeg', 24000000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Oriental Vanilla - hương vani phương Đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: 2m</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2015</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n</ul>\r\n', 1),
(30, 8, 'Nước Hoa Nữ Lancome Trésor Lum', '1635412534_nuoc-hoa-nu-lancome-2.jpeg', 22500000, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Oriental Floral: hoa cỏ phương Đ&ocirc;ng</li>\r\n	<li>Dung t&iacute;ch: 100 ml</li>\r\n	<li>Độ tỏa hương: Thoang thoảng tr&ecirc;n da</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2013</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Gợi cảm, nữ t&iacute;nh, thanh lịch</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n</ul>\r\n', 1),
(31, 8, 'Nước Hoa Lancome Tresor Midnig', '1635412592_nuoc-hoa-lancome-3.jpeg', 20000500, '<ul>\r\n	<li>Nồng độ: Eau de Parfum</li>\r\n	<li>Lưu hương: 7- 12h</li>\r\n	<li>Nh&oacute;m hương: Floral Woody Musk - hương hoa cỏ, gỗ xạ hương</li>\r\n	<li>Dung t&iacute;ch: 75 ml</li>\r\n	<li>Độ tỏa hương: 2m</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2011</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Phong c&aacute;ch: Gợi cảm, nữ t&iacute;nh, thanh lịch</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n</ul>\r\n', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `mobile`, `address`, `email`, `status`) VALUES
(1, 'abcd', 'e10adc3949ba59abbe56e057f20f883e', 'ABCD', '0987654321', '1231212412', 'abcd@gmail.com', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`productid`,`orderid`);

--
-- Chỉ mục cho bảng `ordermethod`
--
ALTER TABLE `ordermethod`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `ordermethod`
--
ALTER TABLE `ordermethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `prices`
--
ALTER TABLE `prices`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
