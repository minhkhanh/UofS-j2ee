package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@SuppressWarnings("serial")
@Entity
@Table(name = "loaitaikhoan")
public class LoaiTaiKhoan implements java.io.Serializable {

    @Id
    @GeneratedValue
    @Column(name = "MaLoaiTaiKhoan")
    private int maLoaiTaiKhoan;
    
    @Column(name = "TenLoaiTaiKhoan", nullable = false, length = 50)
    private String tenLoaiTaiKhoan;
    
    public LoaiTaiKhoan() {
        
    }

    public int getMaLoaiTaiKhoan() {
        return maLoaiTaiKhoan;
    }

    public void setMaLoaiTaiKhoan(int maLoaiTaiKhoan) {
        this.maLoaiTaiKhoan = maLoaiTaiKhoan;
    }

    public String getTenLoaiTaiKhoan() {
        return tenLoaiTaiKhoan;
    }

    public void setTenLoaiTaiKhoan(String tenLoaiTaiKhoan) {
        this.tenLoaiTaiKhoan = tenLoaiTaiKhoan;
    }
}
