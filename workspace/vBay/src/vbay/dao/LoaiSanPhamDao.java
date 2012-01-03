package vbay.dao;

import java.util.List;

import vbay.model.LoaiSanPham;

public interface LoaiSanPhamDao {
    LoaiSanPham layLoaiSanPham(int maLoaiSanPham);
    List<LoaiSanPham> layDanhSachLoaiSanPham();
}
