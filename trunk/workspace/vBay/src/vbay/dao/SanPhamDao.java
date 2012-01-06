package vbay.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import vbay.model.ChiTietDauGia;
import vbay.model.SanPham;

public interface SanPhamDao {
	Integer themSanPham(SanPham sanPham);
    ArrayList<String> layDanhSachHinhAnh(int maSanPham);    
    SanPham laySanPham(int maSanPham);
    Integer soLuongSanPhamTimKiem(String khoaTimKiem, int maLoaiSanPham, int giaNhoNhat, int giaLonNhat, Date thoiGian);
    Integer soLuongTrangTimKiem(String khoaTimKiem, int maLoaiSanPham, int giaNhoNhat, int giaLonNhat, Date thoiGian, int soSPTrenTrang, Integer soLuong);
    List<SanPham> timKiem(String khoaTimKiem, int maLoaiSanPham, int giaNhoNhat, int giaLonNhat, Date thoiGian, int trangHienThi, int soSPTrenTrang);
    List<SanPham> hotAuctions();
    List<ChiTietDauGia> recentlySoldProducts();
    List<SanPham> newAuctions();
    void capNhat(SanPham sanPham);
    List<SanPham> sanPhamMoiDang(int maTaiKhoan);
    List<SanPham> sanPhamSapKetThuc(int maTaiKhoan);
    Integer soLuongSanPhamCuaHang(int maTaiKhoan);
    Integer soLuongTrangCuaHang(int maTaiKhoan, int soSPTrenTrang, Integer soLuong);
    List<SanPham> sanPhamCuaHang(int maTaiKhoan, int trangHienThi, int soSPTrenTrang);    
}
