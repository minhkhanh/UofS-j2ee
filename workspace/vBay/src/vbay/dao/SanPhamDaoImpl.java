package vbay.dao;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.SanPham;

@Repository("sanPhamDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class SanPhamDaoImpl implements SanPhamDao {

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    @Transactional(readOnly = false)
    public Integer themSanPham(SanPham sanPham) {
        sanPham.setNgayDang(new Date());
        return (Integer) sessionFactory.getCurrentSession().save(sanPham);
    }

    @Override
    @Transactional(readOnly = true)
    public SanPham laySanPham(int maSanPham) {
        return (SanPham) sessionFactory.getCurrentSession().get(SanPham.class, maSanPham);
    }
}
