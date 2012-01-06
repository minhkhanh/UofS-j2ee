package vbay.model;

import java.util.Date;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import vbay.controller.Account;

@SuppressWarnings("serial")
@Entity
@Table(name = "chitietdaugia")
@AssociationOverrides({
        @AssociationOverride(name = "chiTietDauGiaId.taiKhoan", joinColumns = @JoinColumn(name = "MaTaiKhoan")),
        @AssociationOverride(name = "chiTietDauGiaId.sanPham", joinColumns = @JoinColumn(name = "MaSanPham")) })
public class ChiTietDauGia implements java.io.Serializable {

    @EmbeddedId
    private ChiTietDauGiaId chiTietDauGiaId = new ChiTietDauGiaId();

    // @ManyToOne(cascade = CascadeType.ALL)
    // @JoinColumn(name = "MaTaiKhoan")
    // private TaiKhoan taiKhoan;

    @Column(name = "GiaGiaoDich")
    private int giaGiaoDich;

    @Column(name = "ThoiGianGiaoDich")
    private Date thoiGianGiaoDich;

    @Column(name = "TinhTrang")
    private String tinhTrang;

    // @ManyToOne(cascade = CascadeType.ALL)
    // @JoinColumn(name = "MaSanPham")
    // private SanPham sanPham;

    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        ChiTietDauGia that = (ChiTietDauGia) o;

        if (getChiTietDauGiaId() != null ? !getChiTietDauGiaId().equals(that.getChiTietDauGiaId())
                : that.getChiTietDauGiaId() != null)
            return false;

        return true;
    }

    public int hashCode() {
        return (getChiTietDauGiaId() != null ? getChiTietDauGiaId().hashCode() : 0);
    }

    @Transient
    public TaiKhoan getTaiKhoan() {
        return getChiTietDauGiaId().getTaiKhoan();
    }

    @Transient
    public SanPham getSanPham() {
        return getChiTietDauGiaId().getSanPham();
    }

    public ChiTietDauGiaId getChiTietDauGiaId() {
        return chiTietDauGiaId;
    }

    public void setChiTietDauGiaId(ChiTietDauGiaId chiTietDauGiaId) {
        this.chiTietDauGiaId = chiTietDauGiaId;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        getChiTietDauGiaId().setTaiKhoan(taiKhoan);
    }

    public int getGiaGiaoDich() {
        return giaGiaoDich;
    }

    public void setGiaGiaoDich(int giaGiaoDich) {
        this.giaGiaoDich = giaGiaoDich;
    }

    public Date getThoiGianGiaoDich() {
        return thoiGianGiaoDich;
    }

    public void setThoiGianGiaoDich(Date thoiGianGiaoDich) {
        this.thoiGianGiaoDich = thoiGianGiaoDich;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public void setSanPham(SanPham sanPham) {
        getChiTietDauGiaId().setSanPham(sanPham);
    }
}
