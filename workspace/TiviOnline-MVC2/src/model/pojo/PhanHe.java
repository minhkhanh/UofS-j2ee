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
public class PhanHe implements Serializable {
    int maPhanHe;
    String tenPhanHe;
    String moTa;

    public PhanHe() {
    }

    /**
     * @param maPhanHe
     * @param tenPhanHe
     * @param moTa
     */
    public PhanHe(int maPhanHe, String tenPhanHe, String moTa) {
        this.maPhanHe = maPhanHe;
        this.tenPhanHe = tenPhanHe;
        this.moTa = moTa;
    }

    public int getMaPhanHe() {
        return maPhanHe;
    }

    public void setMaPhanHe(int maPhanHe) {
        this.maPhanHe = maPhanHe;
    }

    public String getTenPhanHe() {
        return tenPhanHe;
    }

    public void setTenPhanHe(String tenPhanHe) {
        this.tenPhanHe = tenPhanHe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
}
