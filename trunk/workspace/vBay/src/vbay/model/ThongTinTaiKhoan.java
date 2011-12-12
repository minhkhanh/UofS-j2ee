package vbay.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "thongtintaikhoan")
public class ThongTinTaiKhoan implements java.io.Serializable {
    
    @Id
    @GeneratedValue
    @Column(name = "MaThongTinTaiKhoan")
    private int maThongTinTaiKhoan;
    
    @Column(name = "HoTen", length = 50)
    private String hoTen;
    
    @Column(name = "NgaySinh")
    private Date ngaySinh;
    
    @Column(name = "DiaChi", length = 50)
    private String diaChi;
    
    @Column(name = "SoDienThoai", length = 50)
    private String soDienThoai;
    
    @Column(name = "MaTheTinDung", length = 50)
    private String maTheTinDung;
    
    @Column(name = "Email", length = 50)
    private String email;
    
    @Column(name = "DiemTinCayBan")
    private Integer diemTinCayBan;
    
    @Column(name = "DiemTinCayMua")
    private Integer diemTinCayMua;
    
    @Column(name = "GioiTinh")
    private int gioiTinh;

    public int getMaThongTinTaiKhoan() {
        return maThongTinTaiKhoan;
    }

    public void setMaThongTinTaiKhoan(int maThongTinTaiKhoan) {
        this.maThongTinTaiKhoan = maThongTinTaiKhoan;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getMaTheTinDung() {
        return maTheTinDung;
    }

    public void setMaTheTinDung(String maTheTinDung) {
        this.maTheTinDung = maTheTinDung;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getDiemTinCayBan() {
        return diemTinCayBan;
    }

    public void setDiemTinCayBan(Integer diemTinCayBan) {
        this.diemTinCayBan = diemTinCayBan;
    }

    public Integer getDiemTinCayMua() {
        return diemTinCayMua;
    }

    public void setDiemTinCayMua(Integer diemTinCayMua) {
        this.diemTinCayMua = diemTinCayMua;
    }

    public int getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(int gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
}
