package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@SuppressWarnings("serial")
@Entity
@Table(name = "CuaHang")
public class CuaHang implements java.io.Serializable {

    @Id
    @GeneratedValue
    @Column(name = "MaCuaHang")
    private int maCuaHang;
    
    @Column(name = "MoTaCuaHang", columnDefinition="TEXT")
    private String moTaCuaHang;
    
    public CuaHang() {
        
    }

    public int getMaCuaHang() {
        return maCuaHang;
    }

    public void setMaCuaHang(int maCuaHang) {
        this.maCuaHang = maCuaHang;
    }

    public String getMoTaCuaHang() {
        return moTaCuaHang;
    }

    public void setMoTaCuaHang(String moTaCuaHang) {
        this.moTaCuaHang = moTaCuaHang;
    }
}
