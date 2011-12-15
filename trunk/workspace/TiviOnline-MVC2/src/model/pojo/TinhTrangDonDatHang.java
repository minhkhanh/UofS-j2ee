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
public class TinhTrangDonDatHang implements Serializable {
    int maTinhTrang;
    String tenTinhTrang;

    public TinhTrangDonDatHang() {
    }    

    /**
     * @param maTinhTrang
     * @param tenTinhTrang
     */
    public TinhTrangDonDatHang(int maTinhTrang, String tenTinhTrang) {
        this.maTinhTrang = maTinhTrang;
        this.tenTinhTrang = tenTinhTrang;
    }

    public int getMaTinhTrang() {
        return maTinhTrang;
    }
    public void setMaTinhTrang(int maTinhTrang) {
        this.maTinhTrang = maTinhTrang;
    }
    public String getTenTinhTrang() {
        return tenTinhTrang;
    }
    public void setTenTinhTrang(String tenTinhTrang) {
        this.tenTinhTrang = tenTinhTrang;
    }
}
