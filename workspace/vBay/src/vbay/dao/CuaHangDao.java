package vbay.dao;

import vbay.model.CuaHang;

public interface CuaHangDao {
    boolean themCuaHang(CuaHang cuaHang);
    boolean capNhatCuaHang(CuaHang cuaHang);
}
