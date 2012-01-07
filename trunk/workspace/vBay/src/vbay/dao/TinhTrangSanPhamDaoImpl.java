package vbay.dao;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.TaiKhoan;
import vbay.model.TinhTrangSanPham;

@Repository("tinhTrangSanPhamDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class TinhTrangSanPhamDaoImpl implements TinhTrangSanPhamDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public TinhTrangSanPham timTinhTrangSanPham(int maTinhTrangSanPham) {
        try {
            return (TinhTrangSanPham) sessionFactory.getCurrentSession().get(TinhTrangSanPham.class, maTinhTrangSanPham);
        } catch (Exception e) {
            e.printStackTrace();
            return null;    
        }        
    }
}
