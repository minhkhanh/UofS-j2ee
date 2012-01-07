package vbay.dao;

import vbay.model.TaiKhoan;

public interface TaiKhoanDao {
    TaiKhoan dangNhap(String tenTaiKhoan, String matKhau);
    boolean kiemTraTonTaiTenTaiKhoan(String tenDangNhap);
    boolean themTaiKhoan(TaiKhoan taiKhoan);

    TaiKhoan layTaiKhoanTheoMa(int maTaiKhoan);

    void capNhat(TaiKhoan taiKhoan);
    TaiKhoan timTaiKhoanTheoEmail(String email);
    TaiKhoan timTaiKhoanTheoTenTaiKhoan(String tenTaiKhoan);
}
