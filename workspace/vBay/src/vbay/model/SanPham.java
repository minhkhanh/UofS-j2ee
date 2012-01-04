package vbay.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "sanpham")
public class SanPham implements java.io.Serializable {

    @Id
    @GeneratedValue
    @Column(name = "MaSanPham")
    private int maSanPham;

    @Column(name = "TenSanPham", nullable = false, length = 50)
    private String tenSanPham;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaLoaiSanPham")
    private LoaiSanPham loaiSanPham;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaTaiKhoan")
    private TaiKhoan taiKhoan;

    @Column(name = "GiaKhoiDiem")
    private Integer giaKhoiDiem;

    @Column(name = "GiaHienTai")
    private Integer giaHienTai;

    @Column(name = "NgayDang")
    private Date ngayDang;

    @Column(name = "NgayHetHan")
    private Date ngayHetHan;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaTinhTrangSanPham")
    private TinhTrangSanPham tinhTrangSanPham;

    @Column(name = "MoTaSanPham", length = 5000)
    private String moTaSanPham;

    @ManyToMany(fetch=FetchType.EAGER, targetEntity = Multimedia.class, cascade = CascadeType.ALL)
    @JoinTable(name = "sanpham_multimedia", joinColumns = @JoinColumn(name = "MaSanPham"), inverseJoinColumns = @JoinColumn(name = "MaMultimedia"))
    private Set<Multimedia> multimedias = new HashSet<Multimedia>(0);

    public Set<Multimedia> getMultimedias() {
        return multimedias;
    }

    public void setMultimedias(Set<Multimedia> multimedias) {
        this.multimedias = multimedias;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public LoaiSanPham getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(LoaiSanPham loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public Integer getGiaKhoiDiem() {
        return giaKhoiDiem;
    }

    public void setGiaKhoiDiem(Integer giaKhoiDiem) {
        this.giaKhoiDiem = giaKhoiDiem;
    }

    public Integer getGiaHienTai() {
        return giaHienTai;
    }

    public void setGiaHienTai(Integer giaHienTai) {
        this.giaHienTai = giaHienTai;
    }

    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }

    public Date getNgayHetHan() {
        return ngayHetHan;
    }

    public void setNgayHetHan(Date ngayHetHan) {
        this.ngayHetHan = ngayHetHan;
    }

    public TinhTrangSanPham getTinhTrangSanPham() {
        return tinhTrangSanPham;
    }

    public void setTinhTrangSanPham(TinhTrangSanPham tinhTrangSanPham) {
        this.tinhTrangSanPham = tinhTrangSanPham;
    }

    public String getMoTaSanPham() {
        return moTaSanPham;
    }

    public void setMoTaSanPham(String moTaSanPham) {
        this.moTaSanPham = moTaSanPham;
    }
}
