-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2012 at 10:42 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `daugia`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdaugia`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `chitietdaugia`;
CREATE TABLE IF NOT EXISTS `chitietdaugia` (
  `MaChiTietDauGia` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `GiaGiaoDich` int(11) DEFAULT NULL,
  `ThoiGianGiaoDich` datetime DEFAULT NULL,
  `TinhTrang` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDauGia`,`MaTaiKhoan`,`MaSanPham`),
  KEY `FK_CHITIETDAUGIA_SANPHAM` (`MaSanPham`),
  KEY `FK_CHITIETDAUGIA_TAIKHOAN` (`MaTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- RELATIONS FOR TABLE `chitietdaugia`:
--   `MaSanPham`
--       `sanpham` -> `MaSanPham`
--   `MaTaiKhoan`
--       `taikhoan` -> `MaTaiKhoan`
--

--
-- Dumping data for table `chitietdaugia`
--

INSERT INTO `chitietdaugia` (`MaChiTietDauGia`, `MaTaiKhoan`, `MaSanPham`, `GiaGiaoDich`, `ThoiGianGiaoDich`, `TinhTrang`) VALUES
(1, 4, 1, 100001, '2012-01-06 13:56:51', NULL),
(2, 4, 1, 100002, '2012-01-06 14:03:11', NULL),
(3, 4, 1, 150000, '2012-01-06 14:06:22', NULL),
(4, 4, 1, 155000, '2012-01-06 14:06:40', NULL),
(5, 4, 1, 160000, '2012-01-06 14:07:30', NULL),
(6, 4, 2, 10, '2012-01-06 14:07:30', NULL),
(7, 4, 3, 1300000, '2012-01-06 14:07:30', NULL),
(8, 4, 4, 1010000, '2012-01-06 14:07:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chitietphanquyen`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `chitietphanquyen`;
CREATE TABLE IF NOT EXISTS `chitietphanquyen` (
  `MaChiTietPhanQuyen` int(11) NOT NULL AUTO_INCREMENT,
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `MaPhanQuyen` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietPhanQuyen`),
  KEY `FK_CHITIETPHANQUYEN_LOAITAIKHOAN` (`MaLoaiTaiKhoan`),
  KEY `FK_CHITIETPHANQUYEN_PHANQUYEN` (`MaPhanQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `chitietphanquyen`:
--   `MaLoaiTaiKhoan`
--       `loaitaikhoan` -> `MaLoaiTaiKhoan`
--   `MaPhanQuyen`
--       `phanquyen` -> `MaPhanQuyen`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `MaComment` int(11) NOT NULL AUTO_INCREMENT,
  `NoiDungComment` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `NgayComment` datetime DEFAULT NULL,
  `MaTaiKhoan` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaComment`),
  KEY `FK_COMMENT_TAIKHOAN` (`MaTaiKhoan`),
  KEY `FK_COMMENT_SANPHAM` (`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `comment`:
--   `MaSanPham`
--       `sanpham` -> `MaSanPham`
--   `MaTaiKhoan`
--       `taikhoan` -> `MaTaiKhoan`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuahang`
--
-- Creation: Jan 05, 2012 at 03:02 PM
--

DROP TABLE IF EXISTS `cuahang`;
CREATE TABLE IF NOT EXISTS `cuahang` (
  `MaCuaHang` int(11) NOT NULL AUTO_INCREMENT,
  `MoTaCuaHang` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MaCuaHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `daugiathanhcong`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `daugiathanhcong`;
CREATE TABLE IF NOT EXISTS `daugiathanhcong` (
  `MaDauGiaThanhCong` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) DEFAULT NULL,
  `GiaKhopLenh` int(11) DEFAULT NULL,
  `MaChiTietGiaoDich` int(11) DEFAULT NULL,
  `Comment` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaDauGiaThanhCong`),
  KEY `FK_DAUGIATHANHCONG_TAIKHOAN` (`MaTaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `daugiathanhcong`:
--   `MaTaiKhoan`
--       `taikhoan` -> `MaTaiKhoan`
--

-- --------------------------------------------------------

--
-- Table structure for table `giaodien`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `giaodien`;
CREATE TABLE IF NOT EXISTS `giaodien` (
  `MaGiaoDien` int(11) NOT NULL AUTO_INCREMENT,
  `TenTheme` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MaGiaoDien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `khoaphanquyen`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `khoaphanquyen`;
CREATE TABLE IF NOT EXISTS `khoaphanquyen` (
  `MaKhoaPhanQuyen` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoanKhoa` int(11) NOT NULL,
  `MaTaiKhoanBiKhoa` int(11) NOT NULL,
  `MaChiTietPhanQuyen` int(11) NOT NULL,
  `NgayKhoa` datetime DEFAULT NULL,
  `NgayHetHan` datetime NOT NULL,
  `GhiChu` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaKhoaPhanQuyen`),
  KEY `MaTaiKhoanKhoa` (`MaTaiKhoanKhoa`),
  KEY `FK_KhoaPhanQuyen_TaiKhoan2` (`MaTaiKhoanBiKhoa`),
  KEY `FK_KhoanPhanQuyen_ChiTietPhanQuyen` (`MaChiTietPhanQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- RELATIONS FOR TABLE `khoaphanquyen`:
--   `MaChiTietPhanQuyen`
--       `chitietphanquyen` -> `MaChiTietPhanQuyen`
--   `MaTaiKhoanKhoa`
--       `taikhoan` -> `MaTaiKhoan`
--   `MaTaiKhoanBiKhoa`
--       `taikhoan` -> `MaTaiKhoan`
--

-- --------------------------------------------------------

--
-- Table structure for table `loaigioitinh`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `loaigioitinh`;
CREATE TABLE IF NOT EXISTS `loaigioitinh` (
  `MaLoaiGioiTinh` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiGioiTinh` varchar(50) NOT NULL,
  PRIMARY KEY (`MaLoaiGioiTinh`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `loaigioitinh`
--

INSERT INTO `loaigioitinh` (`MaLoaiGioiTinh`, `TenLoaiGioiTinh`) VALUES
(1, 'Không rõ'),
(2, 'Nam'),
(3, 'Nữ');

-- --------------------------------------------------------

--
-- Table structure for table `loaimultimedia`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `loaimultimedia`;
CREATE TABLE IF NOT EXISTS `loaimultimedia` (
  `MaLoaiMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiMultimedia` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaLoaiMultimedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `loaimultimedia`
--

INSERT INTO `loaimultimedia` (`MaLoaiMultimedia`, `TenLoaiMultimedia`) VALUES
(1, 'Ảnh số'),
(2, 'Youtube video clip');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`) VALUES
(1, 'Antiques'),
(2, 'Coins And Currency'),
(3, 'Electronics'),
(4, 'Baby'),
(5, 'DVD''s And Movies');

-- --------------------------------------------------------

--
-- Table structure for table `loaitaikhoan`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `loaitaikhoan`;
CREATE TABLE IF NOT EXISTS `loaitaikhoan` (
  `MaLoaiTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiTaiKhoan` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MaLoaiTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `loaitaikhoan`
--

INSERT INTO `loaitaikhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `multimedia`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE IF NOT EXISTS `multimedia` (
  `MaMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `TenMultimedia` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaLoaiMultimedia` int(11) DEFAULT NULL,
  `DungLuong` int(11) DEFAULT NULL,
  `LinkURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaMultimedia`),
  KEY `FK_MULTIMEDIA_LOAIMULTIMEDIA` (`MaLoaiMultimedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- RELATIONS FOR TABLE `multimedia`:
--   `MaLoaiMultimedia`
--       `loaimultimedia` -> `MaLoaiMultimedia`
--

--
-- Dumping data for table `multimedia`
--

INSERT INTO `multimedia` (`MaMultimedia`, `TenMultimedia`, `MaLoaiMultimedia`, `DungLuong`, `LinkURL`) VALUES
(1, 'Avatar của admin', 1, NULL, '/res/image/avatar/smiley.jpg'),
(2, 'Avatar của user', 1, NULL, '/res/image/avatar/sau_ngo.png'),
(3, '1.1', 1, NULL, '/res/image/product/11.png'),
(4, '2.1', 1, NULL, '/res/image/product/21.png'),
(5, '2.2', 1, NULL, '/res/image/product/22.png'),
(6, '2.3', 1, NULL, '/res/image/product/23.png'),
(7, '2.4', 1, NULL, '/res/image/product/24.png'),
(8, '3.1', 1, NULL, '/res/image/product/31.png'),
(13, '5.1', 1, NULL, '/res/image/product/51.png'),
(14, '6.1', 1, NULL, '/res/image/product/61.png'),
(15, '7.1', 1, NULL, '/res/image/product/71.png'),
(16, '8.1', 1, NULL, '/res/image/product/81.png'),
(17, '8.2', 1, NULL, '/res/image/product/82.png'),
(18, '8.3', 1, NULL, '/res/image/product/83.png'),
(19, '8.4', 1, NULL, '/res/image/product/84.png'),
(20, '9.1', 1, NULL, '/res/image/product/91.png'),
(21, '9.2', 1, NULL, '/res/image/product/92.png'),
(22, '10.1', 1, NULL, '/res/image/product/101.png'),
(23, '10.2', 1, NULL, '/res/image/product/102.png'),
(24, '11.1', 1, NULL, '/res/image/product/111.png'),
(25, '11.2', 1, NULL, '/res/image/product/112.png'),
(26, '11.3', 1, NULL, '/res/image/product/113.png'),
(27, NULL, 1, NULL, '/res/image/product/114.png'),
(28, NULL, 1, NULL, '/res/image/product/121.png'),
(29, NULL, 1, NULL, '/res/image/product/131.png'),
(30, '14.1', 1, NULL, '/res/image/product/141.png'),
(31, '15.1', 1, NULL, '/res/image/product/151.png'),
(32, '16.1', 1, NULL, '/res/image/product/161.png'),
(33, '16.2', 1, NULL, '/res/image/product/162.png'),
(34, '16.3', 1, NULL, '/res/image/product/163.png'),
(35, '17.1', 1, NULL, '/res/image/product/171.png'),
(36, '18.1', 1, NULL, '/res/image/product/181.png'),
(37, '19.1', 1, NULL, '/res/image/product/191.png');

-- --------------------------------------------------------

--
-- Table structure for table `phanquyen`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `phanquyen`;
CREATE TABLE IF NOT EXISTS `phanquyen` (
  `MaPhanQuyen` int(11) NOT NULL AUTO_INCREMENT,
  `TenPhanQuyen` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MaPhanQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaLoaiSanPham` int(11) DEFAULT NULL,
  `MaTaiKhoan` int(11) DEFAULT NULL,
  `GiaKhoiDiem` int(11) DEFAULT NULL,
  `GiaHienTai` int(11) DEFAULT NULL,
  `NgayDang` datetime DEFAULT NULL,
  `NgayHetHan` datetime DEFAULT NULL,
  `MaTinhTrangSanPham` int(11) DEFAULT NULL,
  `MoTaSanPham` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `FK_SANPHAM_TAIKHOAN` (`MaTaiKhoan`),
  KEY `FK_SANPHAM_TINHTRANGSANPHAM` (`MaTinhTrangSanPham`),
  KEY `FK_SANPHAM_LOAISANPHAM` (`MaLoaiSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- RELATIONS FOR TABLE `sanpham`:
--   `MaLoaiSanPham`
--       `loaisanpham` -> `MaLoaiSanPham`
--   `MaTaiKhoan`
--       `taikhoan` -> `MaTaiKhoan`
--   `MaTinhTrangSanPham`
--       `tinhtrangsanpham` -> `MaTinhTrangSanPham`
--

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `MaLoaiSanPham`, `MaTaiKhoan`, `GiaKhoiDiem`, `GiaHienTai`, `NgayDang`, `NgayHetHan`, `MaTinhTrangSanPham`, `MoTaSanPham`) VALUES
(1, 'VINTAGE DECORATIVE SILVER PLATED PAIR OF FISH SERV', 1, NULL, 4600000, 4600000, '2011-12-14 18:18:35', '2012-06-12 00:00:00', 1, 'Bộ dao thìa có thiết kế tinh xảo thích hợp cho gia đình.'),
(2, 'Silverplate Flatware Set for 12 Rendezvous aka Old', 1, NULL, 5300000, 5300000, '2011-12-14 18:28:17', '2012-06-12 00:00:00', 1, 'Lovely silverplate service for 12 in the Rendezvous aka Old South pattern by Community Plate. feature a beautiful classic design along the handle with a cartouche at the top. This beautiful pattern was introduced in 1938. The plating is very fine with substantial feel and intricate pattern detail.'),
(3, 'A STERLING SILVER, TALL & HEAVY MUFFINEER/SUGARER,', 1, NULL, 1200000, 1200000, '2011-12-14 18:29:39', '2012-06-12 00:00:00', 1, 'Offering a lovely 4 1/2 inch tall sugar caster/muffineer, made by Duchin of New York. She stands 4 1/2  inches tall, with a peaked cap, a flared trunk, with a rope decoration about the base and shoulder.  She weighs 91  grams, and is glass lined with a weighted base included in the weight.  Any tarnish is light and easily removed.'),
(4, 'SILVER TEAPOT', 1, NULL, 1000000, 1000000, '2011-12-14 18:31:15', '2012-06-12 00:00:00', 1, '10 1/2 INCH HIGH VINTAGE CASTLETON TEAPOT . USA SHIPPING/ PAYPAL ONLY'),
(5, 'Old German SILVER COIN OVER 130 YEARS OLD', 2, NULL, 1230000, 1230000, '2011-12-15 10:12:31', '2012-06-12 00:00:00', 1, 'Wonderful piece of history one  1 Reichsmark 1875 GERMAN silver coin. This coin is 100% Authentic and in good condition This coin IS OVER 130YEARS OLD. This item would be a nice addition to anyones collection'),
(6, 'Old German NAZI WAR COIN WWII wSw. +RARE STAMPz', 2, NULL, 1600000, 1600000, '2011-12-15 10:34:49', '2012-02-27 00:00:00', 1, 'Wonderful pieces of history. 0ne 2Reichsmark 1939 coin 62,5% silver with swastika. This coin is 100% Authentic and in good condition. This coin was minted and used during WARTIME'),
(7, 'Old German SILVER COIN OVER 90 YEARS OLD', 2, NULL, 1240000, 1240000, '2011-12-15 11:13:32', '2012-03-20 00:00:00', 1, 'Wonderful piece of history\\nOne HALF Reichsmark 1917 GERMAN silver coin\\nThis coin is 100% Authentic and in next to uncirculated condition\\nThis coin IS OVER 90YEARS OLD\\n'),
(8, 'Rare Greek Silver Coin .... HALF DOLLAR SILVER COI', 2, NULL, 9780000, 9780000, '2011-12-15 11:36:39', '2012-03-27 00:00:00', 1, 'Rare Greek silver coin.The coin is cut in small print run of 500 copies on the occasion of democracy in Greece 1975.The coin with a large silver cups.Many preserved in good condition.The real prise is 750 $'),
(9, 'The American Prospecter Silver Coin', 2, NULL, 2310000, 2310000, '2011-12-15 11:41:21', '2012-02-20 00:00:00', 1, '1986 The American Prospector Silver Coin\\nOne Troy Ounce .999 Fine Silver\\nMade in U.S.A'),
(10, 'Apple iPad 2 16GB, Wi-Fi, 9.7in - Black (MC769LL/A', 3, NULL, 10280000, 10280000, '2012-01-15 11:41:21', '2012-02-27 00:00:00', 1, 'Things come alive on the stunning 9.7-inch widescreen LED Multi-Touch display of the Apple iPad 2. With WiFi support, this 16GB Apple iPad ensures you stay connected to your world all the time. The built-in dual-core A5 chip in this Wi-Fi iPad facilitates high-end gaming, surfing and overall performance'),
(11, 'Apple iPad 2 16GB, Wi-Fi, 9.7in - White (MC979LL/A', 3, NULL, 10380000, 10380000, '2012-01-15 11:41:21', '2012-02-27 00:00:00', 1, 'Things come alive on the stunning 9.7-inch widescreen LED Multi-Touch display of the Apple iPad 2. With WiFi support, this 16GB Apple iPad ensures you stay connected to your world all the time. The built-in dual-core A5 chip in this Wi-Fi iPad facilitates high-end gaming, sTurfing and overall performance'),
(12, 'Garmin nuvi 1300LM Automotive GPS Receiver w Lifet', 3, NULL, 1900000, 1900000, '2012-01-20 11:41:21', '2012-02-27 00:00:00', 1, 'With a wide 4.3-inch, sunlight-readable TFT touchscreen, the Garmin nuvi 1300LM GPS receiver is easy to operate. The advanced ecoRoute technology in this Garmin GPS receiver tracks fuel usage and also helps in saving it by estimating a more fuel-efficient route. You can never get lost with the emergency locator feature in this Garmin navigator that guides you with your exact location, nearest address, close-by fuel stations, etc'),
(13, 'NEW Aliph Jawbone 1 Bluetooth Wireless Headset Wit', 3, NULL, 1200000, 1200000, '2012-01-20 11:41:21', '2012-02-27 00:00:00', 1, 'NEW OEM Original Black Aliph Jawbone Bluetooth Wireless Headset With Noise Shield.'),
(14, 'Bugaboo Frog Complete Navy Standard Stroller', 4, NULL, 16980000, 16980000, '2012-01-01 00:00:00', '2012-02-02 00:00:00', 1, 'The Bugaboo Frog Complete Navy is a standard stroller perfect for traveling with your baby at any given time. The reversible seat in this standard stroller allows you to place your baby facing towards you or to the outside world'),
(15, 'Fisher Price Soothing Motions Glider - Coco Sorbet', 4, NULL, 1600000, 1600000, '2012-01-09 00:00:00', '2012-02-09 00:00:00', 1, 'Give your baby the feeling of being rocked in your arms, without having to hold them! The Soothing Motions Glider from Fisher Price provides a front-to-back and side-to-side gliding motion. The plush seat gives plenty of comfort and provides support for baby''s back, sides, and head. The Soothing Motions Glider comes with a variety of music and swaying overhead toys. Not only will this be the most comfortable spot for baby, it will also be the most fun!'),
(16, 'Fisher Price Swing & Seat', 4, NULL, 1000000, 1000000, '2012-01-09 00:00:00', '2012-02-09 00:00:00', 1, 'A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is found in a retail store, unless the item is handmade or was packaged by the manufacturer in non-retail packaging, such as an unprinted box or plastic bag. See the seller''s listing for full details'),
(17, 'The Big Bang Theory Seasons 1-4 (DVD, 2011, 4-Disc', 5, NULL, 1240000, 1240000, '2012-01-01 00:00:00', '2012-02-23 00:00:00', 1, 'No Information'),
(18, 'The Hangover (DVD, 2009, Rated/Unrated)', 5, NULL, 100000, 100000, '2012-01-11 00:00:00', '2012-01-30 00:00:00', 1, 'THE HANGOVER should have been a minor success that did satisfactory box office and lived on through beer-laden guys’ night viewings.'),
(19, 'Modern Family: The Complete Second Season (DVD, 20', 5, NULL, 320000, 320000, '2012-01-15 00:00:00', '2012-01-30 00:00:00', 1, 'his release serves up all twenty-four episodes from the second season of ABC''s ensemble sitcom MODERN FAMILY, a run of shows that garnered the production an Emmy for Outstanding Comedy Series, as well as two acting awards.'),
(34, 'sản phẩm test', 1, 4, 1, NULL, '2011-12-15 17:49:58', '2011-12-22 00:00:00', 3, 'mô tả sản phẩm test');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham_multimedia`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `sanpham_multimedia`;
CREATE TABLE IF NOT EXISTS `sanpham_multimedia` (
  `MaChiTietMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `MaSanPham` int(11) NOT NULL,
  `MaMultimedia` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietMultimedia`),
  KEY `FK_SANPHAMMULTI_SANPHAM` (`MaSanPham`),
  KEY `FK_SANPHAMMULTI_MULTIMEDIA` (`MaMultimedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- RELATIONS FOR TABLE `sanpham_multimedia`:
--   `MaMultimedia`
--       `multimedia` -> `MaMultimedia`
--   `MaSanPham`
--       `sanpham` -> `MaSanPham`
--

--
-- Dumping data for table `sanpham_multimedia`
--

INSERT INTO `sanpham_multimedia` (`MaChiTietMultimedia`, `MaSanPham`, `MaMultimedia`) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 2, 5),
(4, 2, 6),
(5, 2, 7),
(6, 3, 8),
(9, 34, 27),
(12, 3, 13),
(13, 5, 13),
(14, 6, 14),
(15, 7, 15),
(16, 8, 16),
(17, 8, 17),
(18, 8, 18),
(19, 9, 21),
(20, 10, 22),
(21, 11, 23),
(22, 11, 24),
(23, 11, 25),
(24, 11, 26),
(25, 11, 27),
(26, 12, 28),
(27, 13, 29),
(28, 14, 30),
(29, 15, 31),
(30, 16, 32),
(31, 17, 33),
(32, 18, 34),
(33, 19, 37),
(34, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenTaiKhoan` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `MaMultimediaAvatar` int(11) DEFAULT NULL,
  `CoHieuLuc` bit(1) NOT NULL DEFAULT b'0',
  `MaThongTinTaiKhoan` int(11) NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `DaKichHoatEmail` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`MaTaiKhoan`),
  UNIQUE KEY `TenTaiKhoan_UNIQUE` (`TenTaiKhoan`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `FK_TAIKHOAN_LOAITAIKHOAN` (`MaLoaiTaiKhoan`),
  KEY `FK_TAIKHOAN_MULTIMEDIA` (`MaMultimediaAvatar`),
  KEY `FK_TAIKHOAN_THONGTINTAIKHOAN` (`MaThongTinTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- RELATIONS FOR TABLE `taikhoan`:
--   `MaLoaiTaiKhoan`
--       `loaitaikhoan` -> `MaLoaiTaiKhoan`
--   `MaMultimediaAvatar`
--       `multimedia` -> `MaMultimedia`
--   `MaThongTinTaiKhoan`
--       `thongtintaikhoan` -> `MaThongTinTaiKhoan`
--

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenTaiKhoan`, `MatKhau`, `MaLoaiTaiKhoan`, `MaMultimediaAvatar`, `CoHieuLuc`, `MaThongTinTaiKhoan`, `Email`, `DaKichHoatEmail`) VALUES
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '1', 1, 'a@a.a', '1'),
(4, 'user', '63ed5185dd16683f93b395cee129badd', 2, 29, '1', 2, 'akhoi90@yahoo.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `thamso`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `thamso`;
CREATE TABLE IF NOT EXISTS `thamso` (
  `MaThamSo` int(11) NOT NULL AUTO_INCREMENT,
  `TenThamSo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `GiaTri` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaThamSo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `thongtintaikhoan`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `thongtintaikhoan`;
CREATE TABLE IF NOT EXISTS `thongtintaikhoan` (
  `MaThongTinTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `NoiSinh` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SoDienThoai` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaTheTinDung` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaLoaiGioiTinh` int(11) NOT NULL DEFAULT '1',
  `DiemTinCayBan` int(11) DEFAULT NULL,
  `DiemTinCayMua` int(11) DEFAULT NULL,
  `MaCuaHang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaThongTinTaiKhoan`),
  KEY `FK_LoaiGioiTinh_ThongTinTaiKhoan` (`MaLoaiGioiTinh`),
  KEY `FK_MaCuaHang_ThongTinTaiKhoan` (`MaCuaHang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `thongtintaikhoan`:
--   `MaLoaiGioiTinh`
--       `loaigioitinh` -> `MaLoaiGioiTinh`
--   `MaCuaHang`
--       `cuahang` -> `MaCuaHang`
--

--
-- Dumping data for table `thongtintaikhoan`
--

INSERT INTO `thongtintaikhoan` (`MaThongTinTaiKhoan`, `HoTen`, `NgaySinh`, `NoiSinh`, `DiaChi`, `SoDienThoai`, `MaTheTinDung`, `MaLoaiGioiTinh`, `DiemTinCayBan`, `DiemTinCayMua`, `MaCuaHang`) VALUES
(1, 'Nguyễn Admin', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, 'Trần User', '1990-05-12 00:00:00', 'TP', '727 Trần Hưng Đạo', '0973 586 043', '1234567890', 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrangsanpham`
--
-- Creation: Dec 15, 2011 at 09:56 AM
--

DROP TABLE IF EXISTS `tinhtrangsanpham`;
CREATE TABLE IF NOT EXISTS `tinhtrangsanpham` (
  `MaTinhTrangSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrangSanPham` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrangSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tinhtrangsanpham`
--

INSERT INTO `tinhtrangsanpham` (`MaTinhTrangSanPham`, `TenTinhTrangSanPham`) VALUES
(1, 'Đang đấu giá'),
(2, 'Đấu giá thành công'),
(3, 'Hết hạn');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdaugia`
--
ALTER TABLE `chitietdaugia`
  ADD CONSTRAINT `FK_CHITIETDAUGIA_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CHITIETDAUGIA_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chitietphanquyen`
--
ALTER TABLE `chitietphanquyen`
  ADD CONSTRAINT `FK_CHITIETPHANQUYEN_LOAITAIKHOAN` FOREIGN KEY (`MaLoaiTaiKhoan`) REFERENCES `loaitaikhoan` (`MaLoaiTaiKhoan`),
  ADD CONSTRAINT `FK_CHITIETPHANQUYEN_PHANQUYEN` FOREIGN KEY (`MaPhanQuyen`) REFERENCES `phanquyen` (`MaPhanQuyen`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_COMMENT_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `FK_COMMENT_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`);

--
-- Constraints for table `daugiathanhcong`
--
ALTER TABLE `daugiathanhcong`
  ADD CONSTRAINT `FK_DAUGIATHANHCONG_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`);

--
-- Constraints for table `khoaphanquyen`
--
ALTER TABLE `khoaphanquyen`
  ADD CONSTRAINT `FK_KhoanPhanQuyen_ChiTietPhanQuyen` FOREIGN KEY (`MaChiTietPhanQuyen`) REFERENCES `chitietphanquyen` (`MaChiTietPhanQuyen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_KhoaPhanQuyen_TaiKhoan1` FOREIGN KEY (`MaTaiKhoanKhoa`) REFERENCES `taikhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_KhoaPhanQuyen_TaiKhoan2` FOREIGN KEY (`MaTaiKhoanBiKhoa`) REFERENCES `taikhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `multimedia`
--
ALTER TABLE `multimedia`
  ADD CONSTRAINT `FK_MULTIMEDIA_LOAIMULTIMEDIA` FOREIGN KEY (`MaLoaiMultimedia`) REFERENCES `loaimultimedia` (`MaLoaiMultimedia`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SANPHAM_LOAISANPHAM` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`),
  ADD CONSTRAINT `FK_SANPHAM_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`),
  ADD CONSTRAINT `FK_SANPHAM_TINHTRANGSANPHAM` FOREIGN KEY (`MaTinhTrangSanPham`) REFERENCES `tinhtrangsanpham` (`MaTinhTrangSanPham`);

--
-- Constraints for table `sanpham_multimedia`
--
ALTER TABLE `sanpham_multimedia`
  ADD CONSTRAINT `FK_SANPHAMMULTI_MULTIMEDIA` FOREIGN KEY (`MaMultimedia`) REFERENCES `multimedia` (`MaMultimedia`),
  ADD CONSTRAINT `FK_SANPHAMMULTI_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `FK_TAIKHOAN_LOAITAIKHOAN` FOREIGN KEY (`MaLoaiTaiKhoan`) REFERENCES `loaitaikhoan` (`MaLoaiTaiKhoan`),
  ADD CONSTRAINT `FK_TAIKHOAN_MULTIMEDIA` FOREIGN KEY (`MaMultimediaAvatar`) REFERENCES `multimedia` (`MaMultimedia`),
  ADD CONSTRAINT `FK_TAIKHOAN_THONGTINTAIKHOAN` FOREIGN KEY (`MaThongTinTaiKhoan`) REFERENCES `thongtintaikhoan` (`MaThongTinTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `thongtintaikhoan`
--
ALTER TABLE `thongtintaikhoan`
  ADD CONSTRAINT `FK_LoaiGioiTinh_ThongTinTaiKhoan` FOREIGN KEY (`MaLoaiGioiTinh`) REFERENCES `loaigioitinh` (`MaLoaiGioiTinh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MaCuaHang_ThongTinTaiKhoan` FOREIGN KEY (`MaCuaHang`) REFERENCES `cuahang` (`MaCuaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
