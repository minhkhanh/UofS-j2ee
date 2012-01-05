package vbay.model;

import java.util.Date;

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
@Table(name = "chitietdaugia")
public class ChiTietDauGia implements java.io.Serializable{

	@Id
	@GeneratedValue
	@Column(name = "MaChiTietDauGia")
	private int maChiTietDauGia;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MaTaiKhoan")
	private TaiKhoan taiKhoan;
	
	@Column(name = "GiaGiaoDich")
	private int giaGiaoDich;
	
	@Column(name = "ThoiDiemGiaoDich")
	private Date thoiDiemGiaoDich;
	
	@Column(name = "TinhTrang")
	private String tinhTrang;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MaSanPham")
	private SanPham sanPham;

	public int getMaChiTietDauGia() {
		return maChiTietDauGia;
	}

	public void setMaChiTietDauGia(int maChiTietDauGia) {
		this.maChiTietDauGia = maChiTietDauGia;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public int getGiaGiaoDich() {
		return giaGiaoDich;
	}

	public void setGiaGiaoDich(int giaGiaoDich) {
		this.giaGiaoDich = giaGiaoDich;
	}

	public Date getThoiDiemGiaoDich() {
		return thoiDiemGiaoDich;
	}

	public void setThoiDiemGiaoDich(Date thoiDiemGiaoDich) {
		this.thoiDiemGiaoDich = thoiDiemGiaoDich;
	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}	
	
}
