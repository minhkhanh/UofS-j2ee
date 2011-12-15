package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "tinhtrangsanpham")
public class TinhTrangSanPham implements java.io.Serializable {

    @Id
    @GeneratedValue
    @Column(name = "MaTinhTrangSanPham")
    private int maTinhTrangSanPham;

    @Column(name = "TenTinhTrangSanPham", nullable = false, length = 50)
    private String tenTinhTrangSanPham;

    public int getMaTinhTrangSanPham() {
        return maTinhTrangSanPham;
    }

    public void setMaTinhTrangSanPham(int maTinhTrangSanPham) {
        this.maTinhTrangSanPham = maTinhTrangSanPham;
    }

    public String getTenTinhTrangSanPham() {
        return tenTinhTrangSanPham;
    }

    public void setTenTinhTrangSanPham(String tenTinhTrangSanPham) {
        this.tenTinhTrangSanPham = tenTinhTrangSanPham;
    }
}
