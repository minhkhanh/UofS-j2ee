/**
 * 
 */
package model.pojo;

import java.io.Serializable;

/**
 * @author RM
 * 
 */
@SuppressWarnings("serial")
public class Tivi implements Serializable {

    private String maTivi;
    private String tenTivi;
    private float giaBan;
    private int soLuongTon;
    private String hinhAnh;
    private String moTa;
    private String kichThuoc;
    private String khuyenMai;
    private String xuatXu;
    private boolean biXoa;

    private DanhMuc danhMuc;

    public Tivi() {
    }

    /**
     * @param maTivi
     * @param tenTivi
     * @param giaBan
     * @param soLuongTon
     * @param hinhAnh
     * @param moTa
     * @param kichThuoc
     * @param khuyenMai
     * @param xuatXu
     * @param biXoa
     * @param danhMuc
     */
    public Tivi(String maTivi, String tenTivi, float giaBan, int soLuongTon, String hinhAnh,
            String moTa, String kichThuoc, String khuyenMai, String xuatXu, boolean biXoa,
            DanhMuc danhMuc) {
        super();
        this.maTivi = maTivi;
        this.tenTivi = tenTivi;
        this.giaBan = giaBan;
        this.soLuongTon = soLuongTon;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.kichThuoc = kichThuoc;
        this.khuyenMai = khuyenMai;
        this.xuatXu = xuatXu;
        this.biXoa = biXoa;
        this.danhMuc = danhMuc;
    }

    public String getMaTivi() {
        return maTivi;
    }

    public void setMaTivi(String maSach) {
        this.maTivi = maSach;
    }

    public String getTenTivi() {
        return tenTivi;
    }

    public void setTenTivi(String tenSach) {
        this.tenTivi = tenSach;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    public float getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(float giaBan) {
        this.giaBan = giaBan;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getKichThuoc() {
        return kichThuoc;
    }

    public void setKichThuoc(String kichThuoc) {
        this.kichThuoc = kichThuoc;
    }

    public String getKhuyenMai() {
        return khuyenMai;
    }

    public void setKhuyenMai(String khuyenMai) {
        this.khuyenMai = khuyenMai;
    }

    public String getXuatXu() {
        return xuatXu;
    }

    public void setXuatXu(String xuatXu) {
        this.xuatXu = xuatXu;
    }

    public boolean isBiXoa() {
        return biXoa;
    }

    public void setBiXoa(boolean biXoa) {
        this.biXoa = biXoa;
    }

    public DanhMuc getDanhMuc() {
        return danhMuc;
    }

    public void setDanhMuc(DanhMuc danhMuc) {
        this.danhMuc = danhMuc;
    }
}
