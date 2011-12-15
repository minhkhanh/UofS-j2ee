package vbay.dao;

import vbay.model.SanPham;

public interface SanPhamDao {
    Integer themSanPham(SanPham sanPham);
    SanPham laySanPham(int maSanPham);
}
