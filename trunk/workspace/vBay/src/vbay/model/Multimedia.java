package vbay.model;

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
@Table(name = "multimedia")
public class Multimedia implements java.io.Serializable {
    
    @Id
    @GeneratedValue
    @Column(name = "MaMultimedia")
    private int maMultimedia;
    
    @Column(name = "TenMultimedia", nullable = false, length = 50)
    private String tenMultimedia;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaLoaiMultimedia")
    LoaiMultimedia loaiMultimedia;
    
    @Column(name = "DungLuong")
    private Integer dungLuong;
    
    @Column(name = "LinkURL")
    private String LinkURL;
    
    public Multimedia() {
        
    }

    public int getMaMultimedia() {
        return maMultimedia;
    }

    public void setMaMultimedia(int maMultimedia) {
        this.maMultimedia = maMultimedia;
    }

    public String getTenMultimedia() {
        return tenMultimedia;
    }

    public void setTenMultimedia(String tenMultimedia) {
        this.tenMultimedia = tenMultimedia;
    }

    public LoaiMultimedia getLoaiMultimedia() {
        return loaiMultimedia;
    }

    public void setLoaiMultimedia(LoaiMultimedia loaiMultimedia) {
        this.loaiMultimedia = loaiMultimedia;
    }

    public int getDungLuong() {
        return dungLuong;
    }

    public void setDungLuong(int dungLuong) {
        this.dungLuong = dungLuong;
    }

    public String getLinkURL() {
        return LinkURL;
    }

    public void setLinkURL(String linkURL) {
        LinkURL = linkURL;
    }
}
