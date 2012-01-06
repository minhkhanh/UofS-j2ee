drop table `daugia`.`chitietdaugia`

delimiter $$

CREATE TABLE `chitietdaugia` (
  `MaChiTietDauGia` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaSanPham` int(11) NOT NULL,
  `GiaGiaoDich` int(11) DEFAULT NULL,
  `ThoiGianGiaoDich` datetime DEFAULT NULL,
  `TinhTrang` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDauGia`,`MaTaiKhoan`,`MaSanPham`),
  KEY `FK_CHITIETDAUGIA_SANPHAM` (`MaSanPham`),
  KEY `FK_CHITIETDAUGIA_TAIKHOAN` (`MaTaiKhoan`),
  CONSTRAINT `FK_CHITIETDAUGIA_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CHITIETDAUGIA_TAIKHOAN` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci$$

