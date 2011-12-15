/**
 * 
 */
package model.pojo;

/**
 * @author RM
 * 
 */
public class ChiTietDonDatHang {
    private ChiTietId chiTietId;

    private int soLuong;
    private float donGia;

    private Tivi tivi;
    private DonDatHang donDatHang;

    public ChiTietDonDatHang() {
    }

    public ChiTietDonDatHang(ChiTietId chiTietId, Tivi tivi, int soLuong, float donGia) {
        this.chiTietId = chiTietId;
        this.tivi = tivi;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }

    public Tivi getTivi() {
        return tivi;
    }

    public void setTivi(Tivi tivi) {
        this.tivi = tivi;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public float getDonGia() {
        return donGia;
    }

    public void setDonGia(float donGia) {
        this.donGia = donGia;
    }
    
    public ChiTietId getChiTietId() {
        return chiTietId;
    }

    public void setChiTietId(ChiTietId chiTietId) {
        this.chiTietId = chiTietId;
    }

    public DonDatHang getDonDatHang() {
        return donDatHang;
    }

    public void setDonDatHang(DonDatHang donDatHang) {
        this.donDatHang = donDatHang;
    }    
}
