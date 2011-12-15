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
public class DanhMuc implements Serializable{
    private String maDanhMuc;
    private String tenDanhMuc;

    public DanhMuc() {
    }

    /**
     * @param maDanhMuc
     * @param tenDanhMuc
     */
    public DanhMuc(String maDanhMuc, String tenDanhMuc) {
        this.maDanhMuc = maDanhMuc;
        this.tenDanhMuc = tenDanhMuc;
    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }
    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }
    public String getTenDanhMuc() {
        return tenDanhMuc;
    }
    public void setTenDanhMuc(String tenDanhMuc) {
        this.tenDanhMuc = tenDanhMuc;
    }
}
