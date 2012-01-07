package vbay.dao;

import java.util.List;

import vbay.model.ChiTietDauGia;
import vbay.model.ChiTietDauGiaId;
import vbay.model.SanPham;

public interface ChiTietDauGiaDao {
	List<SanPham> hotAuctions();
	List<ChiTietDauGia> recentlySoldProducts();
	ChiTietDauGiaId themChiTietDauGia(ChiTietDauGia chiTietDauGia);
	ChiTietDauGia timChiTietDauGiaLonNhat(int maSanPham);
}
