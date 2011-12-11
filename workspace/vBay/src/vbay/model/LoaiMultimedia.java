package vbay.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "loaimultimedia")
public class LoaiMultimedia implements java.io.Serializable {
    
    @Id
    @GeneratedValue
    @Column(name = "MaLoaiMultimedia")
    private int maLoaiMultimedia;
    
    @Column(name = "TenLoaiMultimedia", nullable = false, length = 50)
    private String tenLoaiMultimedia;
    
    public LoaiMultimedia() {
        
    }

    public int getMaLoaiMultimedia() {
        return maLoaiMultimedia;
    }

    public void setMaLoaiMultimedia(int maLoaiMultimedia) {
        this.maLoaiMultimedia = maLoaiMultimedia;
    }

    public String getTenLoaiMultimedia() {
        return tenLoaiMultimedia;
    }

    public void setTenLoaiMultimedia(String tenLoaiMultimedia) {
        this.tenLoaiMultimedia = tenLoaiMultimedia;
    }
}
