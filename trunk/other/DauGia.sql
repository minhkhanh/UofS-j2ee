-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 15, 2011 at 05:49 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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

DROP TABLE IF EXISTS `chitietdaugia`;
CREATE TABLE IF NOT EXISTS `chitietdaugia` (
  `MaChiTietDauGia` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) DEFAULT NULL,
  `GiaGiaoDich` int(11) DEFAULT NULL,
  `ThoiGianGiaoDich` datetime DEFAULT NULL,
  `TinhTrang` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDauGia`),
  KEY `FK_CHITIETDAUGIA_SANPHAM` (`MaSanPham`),
  KEY `FK_CHITIETDAUGIA_TAIKHOAN` (`MaTaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chitietphanquyen`
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

-- --------------------------------------------------------

--
-- Table structure for table `comment`
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

-- --------------------------------------------------------

--
-- Table structure for table `daugiathanhcong`
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

-- --------------------------------------------------------

--
-- Table structure for table `giaodien`
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

-- --------------------------------------------------------

--
-- Table structure for table `loaimultimedia`
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
(2, 'Video số');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`) VALUES
(1, 'Sản phẩm test'),
(2, 'Sản phẩm test 02');

-- --------------------------------------------------------

--
-- Table structure for table `loaitaikhoan`
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

DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE IF NOT EXISTS `multimedia` (
  `MaMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `TenMultimedia` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaLoaiMultimedia` int(11) DEFAULT NULL,
  `DungLuong` int(11) DEFAULT NULL,
  `LinkURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaMultimedia`),
  KEY `FK_MULTIMEDIA_LOAIMULTIMEDIA` (`MaLoaiMultimedia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `multimedia`
--

INSERT INTO `multimedia` (`MaMultimedia`, `TenMultimedia`, `MaLoaiMultimedia`, `DungLuong`, `LinkURL`) VALUES
(1, 'Avatar của admin', 1, NULL, '/res/image/avatar/smiley.jpg'),
(2, 'Avatar của user', 1, NULL, '/res/image/avatar/sau_ngo.png'),
(3, NULL, 1, NULL, '/res/image/product/facebook.png'),
(4, NULL, 1, NULL, '/res/image/product/fy.jpg'),
(5, NULL, 1, NULL, '/res/image/product/fy.jpg'),
(6, NULL, 1, NULL, '/res/image/product/fy.jpg'),
(16, NULL, 1, NULL, '/res/image/product/googleplus.png'),
(17, NULL, 1, NULL, '/res/image/product/fy.jpg'),
(22, NULL, 1, NULL, '/res/image/product/fy.jpg'),
(24, NULL, 1, NULL, '/res/image/product/facebook.png'),
(25, NULL, 1, NULL, '/res/image/product/facebook.png'),
(26, NULL, 1, NULL, '/res/image/product/googleplus.png');

-- --------------------------------------------------------

--
-- Table structure for table `phanquyen`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `MaLoaiSanPham`, `MaTaiKhoan`, `GiaKhoiDiem`, `GiaHienTai`, `NgayDang`, `NgayHetHan`, `MaTinhTrangSanPham`, `MoTaSanPham`) VALUES
(1, 'sản phẩm test 01', 1, NULL, 1, NULL, '2011-12-14 18:18:35', NULL, NULL, 'đây là sản phẩm test đầu tiên'),
(2, 'sản phẩm test 02', 1, NULL, 1, NULL, '2011-12-14 18:28:17', NULL, NULL, 'đây là sản phẩm test thứ 02'),
(3, 'sản phẩm test 03', 1, NULL, 1, NULL, '2011-12-14 18:29:39', NULL, NULL, 'đây là sản phẩm test thứ 03'),
(4, 'sản phẩm test 04', 1, NULL, 1, NULL, '2011-12-14 18:31:15', '2011-12-31 15:45:00', NULL, 'đây là sản phẩm test thứ 04'),
(5, 'sản phẩm test 05', 2, NULL, 1, NULL, '2011-12-14 18:33:04', '2011-12-17 00:00:00', NULL, 'đây là sản phẩm test thứ 05'),
(19, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 09:22:41', '2011-12-29 00:00:00', NULL, 'mô tả sản phẩm test'),
(20, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 09:34:00', '2011-12-19 00:00:00', NULL, 'mô tả sản phẩm test'),
(21, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 09:35:31', '2011-12-22 00:00:00', NULL, 'mô tả sản phẩm test'),
(22, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 09:40:14', '2011-12-27 00:00:00', NULL, 'mô tả sản phẩm test'),
(23, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 09:41:45', '2011-12-29 00:00:00', NULL, 'mô tả sản phẩm test'),
(24, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 10:12:31', '2011-12-26 00:00:00', NULL, 'mô tả sản phẩm test'),
(25, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 10:34:49', '2011-12-27 00:00:00', NULL, 'mô tả sản phẩm test'),
(30, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 11:13:32', '2011-12-20 00:00:00', NULL, 'mô tả sản phẩm test'),
(32, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 11:36:39', '2011-12-27 00:00:00', NULL, 'mô tả sản phẩm test'),
(33, 'sản phẩm test', 1, NULL, 1, NULL, '2011-12-15 11:41:21', '2011-12-20 00:00:00', NULL, 'mô tả sản phẩm test');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham_multimedia`
--

DROP TABLE IF EXISTS `sanpham_multimedia`;
CREATE TABLE IF NOT EXISTS `sanpham_multimedia` (
  `MaSanPham` int(11) NOT NULL,
  `MaMultimedia` int(11) NOT NULL,
  PRIMARY KEY (`MaSanPham`,`MaMultimedia`),
  KEY `FK_SANPHAMMULTI_SANPHAM` (`MaSanPham`),
  KEY `FK_SANPHAMMULTI_MULTIMEDIA` (`MaMultimedia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham_multimedia`
--

INSERT INTO `sanpham_multimedia` (`MaSanPham`, `MaMultimedia`) VALUES
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(30, 22),
(32, 24),
(33, 25),
(33, 26);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
CREATE TABLE IF NOT EXISTS `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenTaiKhoan` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8 NOT NULL,
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `MaMultimediaAvatar` int(11) DEFAULT NULL,
  `CoHieuLuc` bit(1) NOT NULL DEFAULT b'1',
  `MaThongTinTaiKhoan` int(11) NOT NULL,
  PRIMARY KEY (`MaTaiKhoan`),
  KEY `FK_TAIKHOAN_LOAITAIKHOAN` (`MaLoaiTaiKhoan`),
  KEY `FK_TAIKHOAN_MULTIMEDIA` (`MaMultimediaAvatar`),
  KEY `FK_TAIKHOAN_THONGTINTAIKHOAN` (`MaThongTinTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenTaiKhoan`, `MatKhau`, `MaLoaiTaiKhoan`, `MaMultimediaAvatar`, `CoHieuLuc`, `MaThongTinTaiKhoan`) VALUES
(3, 'admin', 'admin', 1, 1, '1', 1),
(4, 'user', 'user', 2, 2, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `thamso`
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

DROP TABLE IF EXISTS `thongtintaikhoan`;
CREATE TABLE IF NOT EXISTS `thongtintaikhoan` (
  `MaThongTinTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `NoiSinh` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DiaChi` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `SoDienThoai` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MaTheTinDung` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `GioiTinh` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DiemTinCayBan` int(11) DEFAULT NULL,
  `DiemTinCayMua` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaThongTinTaiKhoan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `thongtintaikhoan`
--

INSERT INTO `thongtintaikhoan` (`MaThongTinTaiKhoan`, `HoTen`, `NgaySinh`, `NoiSinh`, `DiaChi`, `SoDienThoai`, `MaTheTinDung`, `GioiTinh`, `Email`, `DiemTinCayBan`, `DiemTinCayMua`) VALUES
(1, 'Nguyễn Admin', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, 'Trần User', '1990-05-12 00:00:00', 'TP', '727 Trần Hưng Đạo', '0973 586 043', NULL, 0, 'akhoi90@gmail.com', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrangsanpham`
--

DROP TABLE IF EXISTS `tinhtrangsanpham`;
CREATE TABLE IF NOT EXISTS `tinhtrangsanpham` (
  `MaTinhTrangSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrangSanPham` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrangSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdaugia`
--
ALTER TABLE `chitietdaugia`
  ADD CONSTRAINT `FK_CHITIETDAUGIA_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`),
  ADD CONSTRAINT `FK_CHITIETDAUGIA_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
