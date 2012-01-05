package vbay.dao;

import vbay.model.ThongTinTaiKhoan;

public interface ThongTinTaiKhoanDao {
    boolean themThongTinTaiKhoan(ThongTinTaiKhoan thongTinTaiKhoan);
    boolean capNhatThongTinTaiKhoan(ThongTinTaiKhoan thongTinTaiKhoan);
}
