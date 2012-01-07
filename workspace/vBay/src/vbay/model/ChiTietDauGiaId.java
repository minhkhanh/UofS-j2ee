package vbay.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Embeddable
public class ChiTietDauGiaId implements Serializable {

    @ManyToOne(cascade = CascadeType.ALL)
    private SanPham sanPham;

    @ManyToOne(cascade = CascadeType.ALL)
    private TaiKhoan taiKhoan;

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        ChiTietDauGiaId that = (ChiTietDauGiaId) o;

        if (sanPham != null ? !sanPham.equals(that.sanPham) : that.sanPham != null)
            return false;
        if (taiKhoan != null ? !taiKhoan.equals(that.taiKhoan) : that.taiKhoan != null)
            return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (sanPham != null ? sanPham.hashCode() : 0);
        result = 31 * result + (taiKhoan != null ? taiKhoan.hashCode() : 0);
        return result;
    }
}
