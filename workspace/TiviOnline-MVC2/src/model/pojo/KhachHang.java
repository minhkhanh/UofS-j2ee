/**
 * 
 */
package model.pojo;

/**
 * @author RM
 * 
 */
@SuppressWarnings("serial")
public class KhachHang implements java.io.Serializable {

    private String tenDangNhap;
    private String matKhau;
    private String hoVaTen;
    private String diaChi;
    private String email;
    private String dienThoai;

    private PhanHe phanHe;

    public KhachHang() {
    }

    public KhachHang(String tenDangNhap, String matKhau, String hoVaTen, String diaChi,
            String email, String dienThoai, PhanHe phanHe) {
        setTenDangNhap(tenDangNhap);
        setMatKhau(matKhau);
        setHoVaTen(hoVaTen);
        setDiaChi(diaChi);
        setEmail(email);
        setDienThoai(dienThoai);
        setPhanHe(phanHe);
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String maKhachHang) {
        this.tenDangNhap = maKhachHang;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public PhanHe getPhanHe() {
        return phanHe;
    }

    public void setPhanHe(PhanHe phanHe) {
        this.phanHe = phanHe;
    }
}
