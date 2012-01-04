-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2012 at 12:19 PM
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

--
-- Dumping data for table `loaigioitinh`
--

UPDATE `loaigioitinh` SET `MaLoaiGioiTinh` = 1,`TenLoaiGioiTinh` = 'Không rõ' WHERE `loaigioitinh`.`MaLoaiGioiTinh` = 1;
UPDATE `loaigioitinh` SET `MaLoaiGioiTinh` = 2,`TenLoaiGioiTinh` = 'Nam' WHERE `loaigioitinh`.`MaLoaiGioiTinh` = 2;
UPDATE `loaigioitinh` SET `MaLoaiGioiTinh` = 3,`TenLoaiGioiTinh` = 'Nữ' WHERE `loaigioitinh`.`MaLoaiGioiTinh` = 3;

--
-- Dumping data for table `loaimultimedia`
--

UPDATE `loaimultimedia` SET `MaLoaiMultimedia` = 1,`TenLoaiMultimedia` = 'Ảnh số' WHERE `loaimultimedia`.`MaLoaiMultimedia` = 1;
UPDATE `loaimultimedia` SET `MaLoaiMultimedia` = 2,`TenLoaiMultimedia` = 'Youtube video clip' WHERE `loaimultimedia`.`MaLoaiMultimedia` = 2;

--
-- Dumping data for table `loaisanpham`
--

UPDATE `loaisanpham` SET `MaLoaiSanPham` = 1,`TenLoaiSanPham` = 'Sản phẩm test' WHERE `loaisanpham`.`MaLoaiSanPham` = 1;
UPDATE `loaisanpham` SET `MaLoaiSanPham` = 2,`TenLoaiSanPham` = 'Sản phẩm test 02' WHERE `loaisanpham`.`MaLoaiSanPham` = 2;

--
-- Dumping data for table `loaitaikhoan`
--

UPDATE `loaitaikhoan` SET `MaLoaiTaiKhoan` = 1,`TenLoaiTaiKhoan` = 'Admin' WHERE `loaitaikhoan`.`MaLoaiTaiKhoan` = 1;
UPDATE `loaitaikhoan` SET `MaLoaiTaiKhoan` = 2,`TenLoaiTaiKhoan` = 'User' WHERE `loaitaikhoan`.`MaLoaiTaiKhoan` = 2;

--
-- Dumping data for table `multimedia`
--

UPDATE `multimedia` SET `MaMultimedia` = 1,`TenMultimedia` = 'Avatar của admin',`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/avatar/smiley.jpg' WHERE `multimedia`.`MaMultimedia` = 1;
UPDATE `multimedia` SET `MaMultimedia` = 2,`TenMultimedia` = 'Avatar của user',`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/avatar/sau_ngo.png' WHERE `multimedia`.`MaMultimedia` = 2;
UPDATE `multimedia` SET `MaMultimedia` = 3,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 2,`DungLuong` = NULL,`LinkURL` = 'gGTIHrGOG6Q' WHERE `multimedia`.`MaMultimedia` = 3;
UPDATE `multimedia` SET `MaMultimedia` = 4,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/facebook.png' WHERE `multimedia`.`MaMultimedia` = 4;
UPDATE `multimedia` SET `MaMultimedia` = 5,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/fy.jpg' WHERE `multimedia`.`MaMultimedia` = 5;
UPDATE `multimedia` SET `MaMultimedia` = 6,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/fy.jpg' WHERE `multimedia`.`MaMultimedia` = 6;
UPDATE `multimedia` SET `MaMultimedia` = 16,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/googleplus.png' WHERE `multimedia`.`MaMultimedia` = 16;
UPDATE `multimedia` SET `MaMultimedia` = 17,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/fy.jpg' WHERE `multimedia`.`MaMultimedia` = 17;
UPDATE `multimedia` SET `MaMultimedia` = 22,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/fy.jpg' WHERE `multimedia`.`MaMultimedia` = 22;
UPDATE `multimedia` SET `MaMultimedia` = 24,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/facebook.png' WHERE `multimedia`.`MaMultimedia` = 24;
UPDATE `multimedia` SET `MaMultimedia` = 25,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/facebook.png' WHERE `multimedia`.`MaMultimedia` = 25;
UPDATE `multimedia` SET `MaMultimedia` = 26,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/googleplus.png' WHERE `multimedia`.`MaMultimedia` = 26;
UPDATE `multimedia` SET `MaMultimedia` = 27,`TenMultimedia` = NULL,`MaLoaiMultimedia` = 1,`DungLuong` = NULL,`LinkURL` = '/res/image/product/facebook.png' WHERE `multimedia`.`MaMultimedia` = 27;

--
-- Dumping data for table `sanpham`
--

UPDATE `sanpham` SET `MaSanPham` = 1,`TenSanPham` = 'sản phẩm test 01',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-14 18:18:35',`NgayHetHan` = '2011-12-31 15:45:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'đây là sản phẩm test đầu tiên' WHERE `sanpham`.`MaSanPham` = 1;
UPDATE `sanpham` SET `MaSanPham` = 2,`TenSanPham` = 'sản phẩm test 02',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-14 18:28:17',`NgayHetHan` = '2011-12-31 15:45:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'đây là sản phẩm test thứ 02' WHERE `sanpham`.`MaSanPham` = 2;
UPDATE `sanpham` SET `MaSanPham` = 3,`TenSanPham` = 'sản phẩm test 03',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-14 18:29:39',`NgayHetHan` = '2011-12-31 15:45:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'đây là sản phẩm test thứ 03' WHERE `sanpham`.`MaSanPham` = 3;
UPDATE `sanpham` SET `MaSanPham` = 4,`TenSanPham` = 'sản phẩm test 04',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-14 18:31:15',`NgayHetHan` = '2011-12-31 15:45:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'đây là sản phẩm test thứ 04' WHERE `sanpham`.`MaSanPham` = 4;
UPDATE `sanpham` SET `MaSanPham` = 5,`TenSanPham` = 'sản phẩm test 05',`MaLoaiSanPham` = 2,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-14 18:33:04',`NgayHetHan` = '2011-12-17 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'đây là sản phẩm test thứ 05' WHERE `sanpham`.`MaSanPham` = 5;
UPDATE `sanpham` SET `MaSanPham` = 19,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 09:22:41',`NgayHetHan` = '2011-12-29 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 19;
UPDATE `sanpham` SET `MaSanPham` = 20,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 09:34:00',`NgayHetHan` = '2011-12-19 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 20;
UPDATE `sanpham` SET `MaSanPham` = 21,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 09:35:31',`NgayHetHan` = '2011-12-22 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 21;
UPDATE `sanpham` SET `MaSanPham` = 22,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 09:40:14',`NgayHetHan` = '2011-12-27 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 22;
UPDATE `sanpham` SET `MaSanPham` = 23,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 09:41:45',`NgayHetHan` = '2011-12-29 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 23;
UPDATE `sanpham` SET `MaSanPham` = 24,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 10:12:31',`NgayHetHan` = '2011-12-26 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 24;
UPDATE `sanpham` SET `MaSanPham` = 25,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 10:34:49',`NgayHetHan` = '2011-12-27 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 25;
UPDATE `sanpham` SET `MaSanPham` = 30,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 11:13:32',`NgayHetHan` = '2011-12-20 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 30;
UPDATE `sanpham` SET `MaSanPham` = 32,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 11:36:39',`NgayHetHan` = '2011-12-27 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 32;
UPDATE `sanpham` SET `MaSanPham` = 33,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 11:41:21',`NgayHetHan` = '2011-12-20 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 33;
UPDATE `sanpham` SET `MaSanPham` = 34,`TenSanPham` = 'sản phẩm test',`MaLoaiSanPham` = 1,`MaTaiKhoan` = 4,`GiaKhoiDiem` = 1,`GiaHienTai` = NULL,`NgayDang` = '2011-12-15 17:49:58',`NgayHetHan` = '2011-12-22 00:00:00',`MaTinhTrangSanPham` = NULL,`MoTaSanPham` = 'mô tả sản phẩm test' WHERE `sanpham`.`MaSanPham` = 34;

--
-- Dumping data for table `sanpham_multimedia`
--

UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 1,`MaSanPham` = 1,`MaMultimedia` = 3 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 1;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 2,`MaSanPham` = 1,`MaMultimedia` = 4 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 2;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 3,`MaSanPham` = 1,`MaMultimedia` = 5 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 3;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 4,`MaSanPham` = 1,`MaMultimedia` = 6 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 4;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 5,`MaSanPham` = 30,`MaMultimedia` = 22 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 5;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 6,`MaSanPham` = 32,`MaMultimedia` = 24 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 6;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 7,`MaSanPham` = 33,`MaMultimedia` = 25 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 7;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 8,`MaSanPham` = 33,`MaMultimedia` = 26 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 8;
UPDATE `sanpham_multimedia` SET `MaChiTietMultimedia` = 9,`MaSanPham` = 34,`MaMultimedia` = 27 WHERE `sanpham_multimedia`.`MaChiTietMultimedia` = 9;

--
-- Dumping data for table `taikhoan`
--

UPDATE `taikhoan` SET `MaTaiKhoan` = 3,`TenTaiKhoan` = 'admin',`MatKhau` = 'admin',`MaLoaiTaiKhoan` = 1,`MaMultimediaAvatar` = 1,`CoHieuLuc` = '1',`MaThongTinTaiKhoan` = 1,`Email` = 'a@a.a',`DaKichHoatEmail` = '1' WHERE `taikhoan`.`MaTaiKhoan` = 3;
UPDATE `taikhoan` SET `MaTaiKhoan` = 4,`TenTaiKhoan` = 'user',`MatKhau` = 'user',`MaLoaiTaiKhoan` = 2,`MaMultimediaAvatar` = 2,`CoHieuLuc` = '1',`MaThongTinTaiKhoan` = 2,`Email` = 'a@a.b',`DaKichHoatEmail` = '1' WHERE `taikhoan`.`MaTaiKhoan` = 4;

--
-- Dumping data for table `thongtintaikhoan`
--

UPDATE `thongtintaikhoan` SET `MaThongTinTaiKhoan` = 1,`HoTen` = 'Nguyễn Admin',`NgaySinh` = NULL,`NoiSinh` = NULL,`DiaChi` = NULL,`SoDienThoai` = NULL,`MaTheTinDung` = NULL,`MaLoaiGioiTinh` = 1,`DiemTinCayBan` = NULL,`DiemTinCayMua` = NULL WHERE `thongtintaikhoan`.`MaThongTinTaiKhoan` = 1;
UPDATE `thongtintaikhoan` SET `MaThongTinTaiKhoan` = 2,`HoTen` = 'Trần User',`NgaySinh` = '1990-05-12 00:00:00',`NoiSinh` = 'TP',`DiaChi` = '727 Trần Hưng Đạo',`SoDienThoai` = '0973 586 043',`MaTheTinDung` = NULL,`MaLoaiGioiTinh` = 1,`DiemTinCayBan` = 0,`DiemTinCayMua` = 0 WHERE `thongtintaikhoan`.`MaThongTinTaiKhoan` = 2;

--
-- Dumping data for table `tinhtrangsanpham`
--

UPDATE `tinhtrangsanpham` SET `MaTinhTrangSanPham` = 1,`TenTinhTrangSanPham` = 'Đang đấu giá' WHERE `tinhtrangsanpham`.`MaTinhTrangSanPham` = 1;
UPDATE `tinhtrangsanpham` SET `MaTinhTrangSanPham` = 2,`TenTinhTrangSanPham` = 'Đấu giá thành công' WHERE `tinhtrangsanpham`.`MaTinhTrangSanPham` = 2;
UPDATE `tinhtrangsanpham` SET `MaTinhTrangSanPham` = 3,`TenTinhTrangSanPham` = 'Hết hạn' WHERE `tinhtrangsanpham`.`MaTinhTrangSanPham` = 3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
