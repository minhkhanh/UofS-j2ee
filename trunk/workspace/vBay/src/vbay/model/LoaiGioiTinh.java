package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@SuppressWarnings("serial")
@Entity
@Table(name = "LoaiGioiTinh")
public class LoaiGioiTinh implements java.io.Serializable {

    @Id
    @GeneratedValue
    @Column(name = "MaLoaiGioiTinh")
    private int maLoaiGioiTinh;
    
    @Column(name = "TenLoaiGioiTinh", nullable = false, length = 45)
    private String tenLoaiGioiTinh;
    
    public LoaiGioiTinh() {
        
    }

    public int getMaLoaiGioiTinh() {
        return maLoaiGioiTinh;
    }

    public void setMaLoaiGioiTinh(int maLoaiGioiTinh) {
        this.maLoaiGioiTinh = maLoaiGioiTinh;
    }

    public String getTenLoaiGioiTinh() {
        return tenLoaiGioiTinh;
    }

    public void setTenLoaiGioiTinh(String tenLoaiGioiTinh) {
        this.tenLoaiGioiTinh = tenLoaiGioiTinh;
    }
}
