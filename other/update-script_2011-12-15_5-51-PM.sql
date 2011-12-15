ALTER TABLE `daugia`.`loaigioitinh` CHANGE COLUMN `TenLoaiGioiTinh` `TenLoaiGioiTinh` VARCHAR(50) NOT NULL  ;

ALTER TABLE `daugia`.`sanpham_multimedia` ADD COLUMN `MaChiTietMultimedia` INT(11) NOT NULL AUTO_INCREMENT  FIRST 

, DROP PRIMARY KEY 

, ADD PRIMARY KEY (`MaChiTietMultimedia`) ;

ALTER TABLE `daugia`.`thongtintaikhoan` CHANGE COLUMN `DienThoai` `SoDienThoai` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL  ;