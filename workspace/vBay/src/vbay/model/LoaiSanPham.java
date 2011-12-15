package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "loaisanpham")
public class LoaiSanPham implements java.io.Serializable {
    
    @Id
    @GeneratedValue
    @Column(name = "MaLoaiSanPham")
    private int maLoaiSanPham;
    
    @Column(name = "TenLoaiSanPham", nullable = false, length = 50)
    private String tenLoaiSanPham;

    public int getMaLoaiSanPham() {
        return maLoaiSanPham;
    }

    public void setMaLoaiSanPham(int maLoaiSanPham) {
        this.maLoaiSanPham = maLoaiSanPham;
    }

    public String getTenLoaiSanPham() {
        return tenLoaiSanPham;
    }

    public void setTenLoaiSanPham(String tenLoaiSanPham) {
        this.tenLoaiSanPham = tenLoaiSanPham;
    }
}
