Create database DauGia;
use DauGia;


-- PHAN TAO BANG 
-- 1. Tao bang THAMSO
Create table THAMSO
(
	MaThamSo int not null auto_increment,
	TenThamSo nvarchar(50) not null,
	GiaTri nvarchar(50),
	Constraint PK_MATHAMSO Primary key(MaThamSo)
);
-- 2. Tao bang GIAODIEN
Create table GiaoDien
(
	MaGiaoDien int not null auto_increment,
	TenTheme nvarchar(50) not null,
	Constraint PK_GIAODIEN Primary key(MaGiaoDien)
);
-- 3. 
Create Table PhanQuyen
(
	MaPhanQuyen int not null auto_increment,
	TenPhanQuyen nvarchar(50) not null,
	Primary key(MaPhanQuyen)
);
-- 4.

Create table ChiTietPhanQuyen
(
	MaChiTietPhanQuyen int not null auto_increment,
	MaLoaiTaiKhoan int not null,
	MaPhanQuyen int not null,
	Primary key(MaChiTietPhanQuyen)
);
-- 4.2 bang dung khoa chuc nang
create table KhoaPhanQuyen
(
    MaKhoaPhanQuyen INT NOT NULL AUTO_INCREMENT ,
    MaTaiKhoanKhoa int not null,
    MaTaiKhoanBiKhoa int not null,
    MaChiTietPhanQuyen int not null,
    NgayKhoa DateTime,
    NgayHetHan DateTime not null,
    GhiChu nvarchar(500), -- ly do khoa
    primary key(MaKhoaPhanQuyen)
);
-- 5. 
Create table LoaiTaiKhoan
(
	MaLoaiTaiKhoan int not null auto_increment,
	TenLoaiTaiKhoan nvarchar(50) not null,
	primary key(MaLoaiTaiKhoan)
);
-- 6.
Create table TaiKhoan
(
	MaTaiKhoan int not null auto_increment,
	TenTaiKhoan nvarchar(50) not null,
	MatKhau varchar(50) not null,
	MaLoaiTaiKhoan int not null,
	MaMultimediaAvatar int,
	CoHieuLuc bit not null default 1,
	primary key (MaTaiKhoan)
);
-- 7. 
Create table ThongTinTaiKhoan
(
	MaThongTinTaiKhoan int not null auto_increment,
	HoTen nvarchar(50),
	NgaySinh datetime,
	NoiSinh nvarchar(50),
	DiaChi nvarchar(50),
	SoDienThoai nvarchar(50),
	MaTheTinDung nvarchar(50),
	GioiTinh int not null default 0, -- 0-chua xac dinh, 1:nam, -1:nu
	Email nvarchar(50),
    DiemTinCayBan int,
	DiemTinCayMua int,
	MaTaiKhoan int,
	primary key (MaThongTinTaiKhoan)
);
-- 8
Create table TinhTrangSanPham
(
	MaTinhTrangSanPham int not null auto_increment,
	TenTinhTrangSanPham nvarchar(50),
	primary key (MaTinhTrangSanPham)
);
-- 9
Create table LoaiSanPham
(
	MaLoaiSanPham int not null auto_increment,
	TenLoaiSanPham nvarchar(50),
	primary key (MaLoaiSanPham)
);
-- 10.SanPham
Create table SanPham
(
	MaSanPham int not null auto_increment,
	TenSanPham nvarchar(50),
	MaLoaiSanPham int,
	MaTaiKhoan int,
	GiaKhoiDiem int,
	GiaHienTai int,
	NgayDang datetime,
	NgayHetHan datetime,
	MaTinhTrangSanPham int,
	MoTaSanPham nvarchar(5000),
	primary key (MaSanPham)
);

-- 11. Comment
Create table Comment
(
	MaComment int not null auto_increment,
	NoiDungComment nvarchar (5000),
	NgayComment datetime,
	MaTaiKhoan int,
	MaSanPham int,
	primary key(MaComment)
);
-- 12.
Create table LoaiMultimedia
(
	MaLoaiMultimedia int not null auto_increment,
	TenLoaiMultimedia nvarchar(50),
	Primary key (MaLoaiMultimedia)
);
-- 13.
Create table Multimedia 
(
	MaMultimedia int not null auto_increment,
	TenMultimedia nvarchar(50),
	MaLoaiMultimedia int,
	DungLuong int,
	LinkURL nvarchar(50),
	primary key(MaMultimedia)
);
-- 14. 
create table SanPham_Multimedia
(
	MaChiTietMultimedia int not null auto_increment,
	MaSanPham int,
	MaMultimedia int,
	primary key(MaChiTietMultimedia)
);
-- 15.
create table ChiTietDauGia
(
	MaChiTietDauGia int not null auto_increment,
	MaTaiKhoan int,
	GiaGiaoDich int,
	ThoiGianGiaoDich datetime,
	TinhTrang nvarchar(50),
	MaSanPham int,
	primary key(MaChiTietDauGia)	
);
-- 16. 
create table DauGiaThanhCong
(
	MaDauGiaThanhCong int not null auto_increment,
	MaTaiKhoan int,
	GiaKhopLenh int,
	MaChiTietGiaoDich int,
	Comment nvarchar(1000),
	primary key(MaDauGiaThanhCong)
);

-- ThongTinTaiKhoan-TaiKhoan
ALTER TABLE ThongTinTaiKhoan
ADD CONSTRAINT FK_THONGTINTK_TAIKHOAN
FOREIGN KEY (MaTaiKhoan)  
REFERENCES TaiKhoan(MaTaiKhoan);

-- TaiKhoan-LoaiTaiKhoan
ALTER TABLE TaiKhoan
ADD CONSTRAINT FK_TAIKHOAN_LOAITAIKHOAN
FOREIGN KEY (MaLoaiTaiKhoan)  
REFERENCES LoaiTaiKhoan(MaLoaiTaiKhoan);

-- TaiKhoan-Multimedia
ALTER TABLE TaiKhoan
ADD CONSTRAINT FK_TAIKHOAN_MULTIMEDIA
FOREIGN KEY (MaMultimediaAvatar)  
REFERENCES Multimedia(MaMultimedia);

-- ChiTetPhanQuyen-LoaiTaiKhoan
ALTER TABLE ChiTietPhanQuyen
ADD CONSTRAINT FK_CHITIETPHANQUYEN_LOAITAIKHOAN
FOREIGN KEY (MaLoaiTaiKhoan)  
REFERENCES LoaiTaiKhoan(MaLoaiTaiKhoan);

-- ChiTetPhanQuyen-PhanQuyen
ALTER TABLE ChiTietPhanQuyen
ADD CONSTRAINT FK_CHITIETPHANQUYEN_PHANQUYEN
FOREIGN KEY (MaPhanQuyen)  
REFERENCES PhanQuyen(MaPhanQuyen);

-- Comment-TaiKhoan
ALTER TABLE Comment
ADD CONSTRAINT FK_COMMENT_TAIKHOAN
FOREIGN KEY (MaTaiKhoan)  
REFERENCES TaiKhoan(MaTaiKhoan);

-- Comment-SanPham
ALTER TABLE Comment
ADD CONSTRAINT FK_COMMENT_SANPHAM
FOREIGN KEY (MaSanPham)  
REFERENCES SanPham(MaSanPham);

-- SanPham-TaiKhoan
ALTER TABLE SanPham
ADD CONSTRAINT FK_SANPHAM_TAIKHOAN
FOREIGN KEY (MaTaiKhoan)  
REFERENCES TaiKhoan(MaTaiKhoan);

-- SanPham-TinhTrangSanPham
ALTER TABLE SanPham
ADD CONSTRAINT FK_SANPHAM_TINHTRANGSANPHAM
FOREIGN KEY (MaTinhTrangSanPham)  
REFERENCES TinhTrangSanPham(MaTinhTrangSanPham);

-- SanPham-LoaiSanPham
ALTER TABLE SanPham
ADD CONSTRAINT FK_SANPHAM_LOAISANPHAM
FOREIGN KEY (MaLoaiSanPham)  
REFERENCES LoaiSanPham(MaLoaiSanPham);

-- SanPhamMult-SanPham
ALTER TABLE SanPham_Multimedia
ADD CONSTRAINT FK_SANPHAMMULTI_SANPHAM
FOREIGN KEY (MaSanPham)  
REFERENCES SanPham(MaSanPham);

-- Multi-LoaiMuilti
ALTER TABLE Multimedia
ADD CONSTRAINT FK_MULTIMEDIA_LOAIMULTIMEDIA
FOREIGN KEY (MaLoaiMultimedia)  
REFERENCES LoaiMultimedia(MaLoaiMultimedia);

-- SanPhamMulti-Multi
ALTER TABLE SanPham_Multimedia
ADD CONSTRAINT FK_SANPHAMMULTI_MULTIMEDIA
FOREIGN KEY (MaMultimedia)  
REFERENCES Multimedia(MaMultimedia);

-- DauGiaThanhCong-TaiKhoan
ALTER TABLE DauGiaThanhCong
ADD CONSTRAINT FK_DAUGIATHANHCONG_TAIKHOAN
FOREIGN KEY (MaTaiKhoan)  
REFERENCES TaiKhoan(MaTaiKhoan);

-- ChiTietDauGia-SanPham
ALTER TABLE ChiTietDauGia
ADD CONSTRAINT FK_CHITIETDAUGIA_SANPHAM
FOREIGN KEY (MaSanPham)  
REFERENCES SanPham(MaSanPham);

-- ChiTietDauGia-TaiKhoan
ALTER TABLE ChiTietDauGia
ADD CONSTRAINT FK_CHITIETDAUGIA_TAIKHOAN
FOREIGN KEY (MaTaiKhoan)  
REFERENCES TaiKhoan(MaTaiKhoan);

-- bang KhoaPhanQuyen
ALTER TABLE KhoaPhanQuyen
  ADD CONSTRAINT `FK_KhoaPhanQuyen_TaiKhoan1`
  FOREIGN KEY (`MaTaiKhoanKhoa` )
  REFERENCES TaiKhoan(`MaTaiKhoan` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `FK_KhoaPhanQuyen_TaiKhoan2`
  FOREIGN KEY (`MaTaiKhoanBiKhoa` )
  REFERENCES TaiKhoan(`MaTaiKhoan` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `FK_KhoanPhanQuyen_ChiTietPhanQuyen`
  FOREIGN KEY (`MaChiTietPhanQuyen` )
  REFERENCES ChiTietPhanQuyen(`MaChiTietPhanQuyen` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX (`MaTaiKhoanKhoa` ASC) 
, ADD INDEX `FK_KhoaPhanQuyen_TaiKhoan2` (`MaTaiKhoanBiKhoa` ASC) 
, ADD INDEX `FK_KhoanPhanQuyen_ChiTietPhanQuyen` (`MaChiTietPhanQuyen` ASC) ;

