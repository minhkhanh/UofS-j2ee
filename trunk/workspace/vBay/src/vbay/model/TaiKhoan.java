package vbay.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "taikhoan")
public class TaiKhoan implements java.io.Serializable {
    
    @Id
    @GeneratedValue
    @Column(name = "MaTaiKhoan")
    private int maTaiKhoan;
    
    @Column(name = "TenTaiKhoan", nullable = false, length = 50)
    private String tenTaiKhoan;
    
    @Column(name = "MatKhau", nullable = false, length = 50)
    private String matKhau;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaLoaiTaiKhoan")
    private LoaiTaiKhoan loaiTaiKhoan;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaMultimediaAvatar")
    private Multimedia multimediaAvatar;
    
    @Column(name = "CoHieuLuc")
    private boolean coHieuLuc;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaThongTinTaiKhoan")
    private ThongTinTaiKhoan thongTinTaiKhoan;
    
    public ThongTinTaiKhoan getThongTinTaiKhoan() {
        return thongTinTaiKhoan;
    }

    public void setThongTinTaiKhoan(ThongTinTaiKhoan thongTinTaiKhoan) {
        this.thongTinTaiKhoan = thongTinTaiKhoan;
    }

    public TaiKhoan() {
    }

    public int getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(int maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public LoaiTaiKhoan getLoaiTaiKhoan() {
        return loaiTaiKhoan;
    }

    public void setLoaiTaiKhoan(LoaiTaiKhoan loaiTaiKhoan) {
        this.loaiTaiKhoan = loaiTaiKhoan;
    }

    public Multimedia getMultimediaAvatar() {
        return multimediaAvatar;
    }

    public void setMultimediaAvatar(Multimedia multimediaAvatar) {
        this.multimediaAvatar = multimediaAvatar;
    }

    public boolean isCoHieuLuc() {
        return coHieuLuc;
    }

    public void setCoHieuLuc(boolean coHieuLuc) {
        this.coHieuLuc = coHieuLuc;
    }
}
