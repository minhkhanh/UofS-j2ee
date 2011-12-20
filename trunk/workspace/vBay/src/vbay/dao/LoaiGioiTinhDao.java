package vbay.dao;

import java.util.List;

import vbay.model.LoaiGioiTinh;

public interface LoaiGioiTinhDao {
	List<LoaiGioiTinh> layDanhSachLoaiGioiTinh();
	LoaiGioiTinh layLoaiGioiTinh(int maLoaiGioiTinh);
}
