
CREATE TABLE `cuahang` (
  `MaCuaHang` int(11) NOT NULL AUTO_INCREMENT,
  `MoTaCuaHang` text,
  PRIMARY KEY (`MaCuaHang`)
);

ALTER TABLE `daugia`.`thongtintaikhoan` ADD COLUMN `MaCuaHang` INT NULL  AFTER `DiemTinCayMua` , 

  ADD CONSTRAINT `FK_MaCuaHang_ThongTinTaiKhoan`

  FOREIGN KEY (`MaCuaHang` )

  REFERENCES `daugia`.`cuahang` (`MaCuaHang` )

  ON DELETE NO ACTION

  ON UPDATE NO ACTION

, ADD INDEX `FK_MaCuaHang_ThongTinTaiKhoan` (`MaCuaHang` ASC) ;

