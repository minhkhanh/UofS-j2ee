package vbay.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
    
    @Column(name = "Email", nullable = false, length = 100)
    private String email;

    @Column(name = "DaKichHoatEmail", nullable = false)
    private boolean daKichHoatEmail;
    
    @OneToMany(fetch=FetchType.EAGER, mappedBy="chiTietDauGiaId.taiKhoan", cascade = CascadeType.ALL)
    private Set<ChiTietDauGia> chiTietDauGias = new HashSet<ChiTietDauGia>(0);
    
    public Set<ChiTietDauGia> getChiTietDauGias() {
        return chiTietDauGias;
    }

    public void setChiTietDauGias(Set<ChiTietDauGia> chiTietDauGias) {
        this.chiTietDauGias = chiTietDauGias;
    }

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getDaKichHoatEmail() {
		return daKichHoatEmail;
	}

	public void setDaKichHoatEmail(boolean daKichHoatEmail) {
		this.daKichHoatEmail = daKichHoatEmail;
	}
}
