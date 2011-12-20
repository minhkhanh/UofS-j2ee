package vbay.dao;

import vbay.model.LoaiTaiKhoan;

public interface LoaiTaiKhoanDao {
    LoaiTaiKhoan layLoaiTaiKhoan(int maLoaiTaiKhoan);
    LoaiTaiKhoan layLoaiTaiKhoan(String tenLoaiTaiKhoan);
}
