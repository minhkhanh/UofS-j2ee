package vbay.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.ChiTietDauGia;
import vbay.model.ChiTietDauGiaId;
import vbay.model.SanPham;

@Repository("chiTietDauGiaDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class ChiTietDauGiaDaoImpl implements ChiTietDauGiaDao {

    @Autowired
    SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public List<SanPham> hotAuctions() {
        List<SanPham> dsSanPham = null;
        Session session = null;

        try {
            session = sessionFactory.getCurrentSession();
            String hql = "select ct.chiTietDauGiaId.sanPham from ChiTietDauGia ct where ct.chiTietDauGiaId.sanPham.tinhTrangSanPham.maTinhTrangSanPham=1";
            hql += " group by ct.chiTietDauGiaId.sanPham.maSanPham order by count(ct.chiTietDauGiaId.sanPham) desc";
            Query query = session.createQuery(hql);
            dsSanPham = query.setMaxResults(5).list();
        } catch (Exception ex) {
            ex.printStackTrace();
            dsSanPham = null;
        }

        return dsSanPham;
    }

    @SuppressWarnings("unchecked")
    @Override
    @Transactional(readOnly = true)
    public List<ChiTietDauGia> recentlySoldProducts() {
        List<ChiTietDauGia> dsChiTietDauGiaThanhCong = null;
        Session session = null;

        try {
            session = sessionFactory.getCurrentSession();
            String hql = "select ct from ChiTietDauGia ct  where ct.chiTietDauGiaId.sanPham.tinhTrangSanPham.maTinhTrangSanPham=2 order by ct.chiTietDauGiaId.sanPham.ngayDang desc";
            Query query = session.createQuery(hql);
            dsChiTietDauGiaThanhCong = query.setMaxResults(5).list();
        } catch (Exception ex) {
            ex.printStackTrace();
            dsChiTietDauGiaThanhCong = null;
        }

        return dsChiTietDauGiaThanhCong;
    }

    @Override
    public ChiTietDauGiaId themChiTietDauGia(ChiTietDauGia chiTietDauGia) {
        return (ChiTietDauGiaId) sessionFactory.getCurrentSession().save(chiTietDauGia);
    }

    @Override
    public ChiTietDauGia timChiTietDauGiaLonNhat(int maSanPham) {
        try {
            String hql = "select ct from ChiTietDauGia ct where ct.chiTietDauGiaId.sanPham.maSanPham = :maSanPham and ct.giaGiaoDich = (select max(ct2.giaGiaoDich) from ChiTietDauGia ct2 where ct2.chiTietDauGiaId.sanPham.maSanPham = :maSanPham2)";
            Query query = sessionFactory.getCurrentSession().createQuery(hql).setInteger("maSanPham", maSanPham).setInteger("maSanPham2", maSanPham);;
            return (ChiTietDauGia) query.list().get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
