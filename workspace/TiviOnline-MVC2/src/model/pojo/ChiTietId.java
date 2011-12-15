/**
 * 
 */
package model.pojo;

/**
 * @author RM
 * 
 */
@SuppressWarnings("serial")
public class ChiTietId implements java.io.Serializable {
    private int maDonDatHang;
    private int soThuTu;

    public ChiTietId() {
    }

    /**
     * @param maDonDatHang
     * @param soThuTu
     */
    public ChiTietId(int maDonDatHang, int soThuTu) {
        this.maDonDatHang = maDonDatHang;
        this.soThuTu = soThuTu;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null)
            return false;
        if (!(obj instanceof ChiTietId))
            return false;
        ChiTietId arg1 = (ChiTietId) obj;
        return (this.maDonDatHang == arg1.maDonDatHang) && (this.soThuTu == arg1.soThuTu);
    }

    @Override
    public int hashCode() {
        int hash = 6;
        hash = 6 * hash + maDonDatHang;
        hash = 6 * hash + soThuTu;

        return hash;
    }

    public int getMaDonDatHang() {
        return maDonDatHang;
    }

    public void setMaDonDatHang(int maDonDatHang) {
        this.maDonDatHang = maDonDatHang;
    }

    public int getSoThuTu() {
        return soThuTu;
    }

    public void setSoThuTu(int soThuTu) {
        this.soThuTu = soThuTu;
    }
}
