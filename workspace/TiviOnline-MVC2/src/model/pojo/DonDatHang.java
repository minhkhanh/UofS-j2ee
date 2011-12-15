/**
 * 
 */
package model.pojo;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author RM
 * 
 */
@SuppressWarnings("serial")
public class DonDatHang implements Serializable {

    private int maDonDatHang;
    private Date ngayDatHang;

    private KhachHang khachHang;
    private TinhTrangDonDatHang tinhTrang;

    public DonDatHang() {
    }

    /**
     * @param maDonDatHang
     * @param ngayDatHang
     * @param khachHang
     * @param tinhTrang
     */
    public DonDatHang(int maDonDatHang, Date ngayDatHang, KhachHang khachHang,
            TinhTrangDonDatHang tinhTrang) {
        this.maDonDatHang = maDonDatHang;
        this.ngayDatHang = ngayDatHang;
        this.khachHang = khachHang;
        this.tinhTrang = tinhTrang;
    }

    public int getMaDonDatHang() {
        return maDonDatHang;
    }

    public void setMaDonDatHang(int maDonDatHang) {
        this.maDonDatHang = maDonDatHang;
    }

    public Date getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(Date ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public TinhTrangDonDatHang getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(TinhTrangDonDatHang tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }
}
