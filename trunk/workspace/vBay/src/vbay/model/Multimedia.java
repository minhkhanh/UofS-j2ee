package vbay.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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

    @Column(name = "TenMultimedia", length = 50)
    private String tenMultimedia;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaLoaiMultimedia")
    LoaiMultimedia loaiMultimedia;

    @Column(name = "DungLuong")
    private Integer dungLuong;

    @Column(name = "LinkURL", length = 50)
    private String linkURL;

    // @ManyToMany(targetEntity = SanPham.class, cascade = CascadeType.ALL)
    // @JoinTable(name = "sanpham_multimedia", joinColumns = @JoinColumn(name = "MaMultimedia"),
    // inverseJoinColumns = @JoinColumn(name = "MaSanPham"))
//    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "multimedias", targetEntity = SanPham.class)
//    private Set<SanPham> sanPhams = new HashSet<SanPham>();
//
//    public Set<SanPham> getSanPhams() {
//        return sanPhams;
//    }
//
//    public void setSanPhams(Set<SanPham> sanPhams) {
//        this.sanPhams = sanPhams;
//    }

    public void setDungLuong(Integer dungLuong) {
        this.dungLuong = dungLuong;
    }

    public Integer getDungLuong() {
        return dungLuong;
    }

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

    public String getLinkURL() {
        return linkURL;
    }

    public void setLinkURL(String linkURL) {
        this.linkURL = linkURL;
    }
}
