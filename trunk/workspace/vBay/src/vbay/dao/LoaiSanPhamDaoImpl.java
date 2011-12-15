package vbay.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.LoaiSanPham;

@Repository("loaiSanPhamDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class LoaiSanPhamDaoImpl implements LoaiSanPhamDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional(readOnly = true)
    public LoaiSanPham layLoaiSanPham(int maLoaiSanPham) {
        return (LoaiSanPham) sessionFactory.getCurrentSession().get(LoaiSanPham.class,
                maLoaiSanPham);
    }

}
