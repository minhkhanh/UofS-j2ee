package vbay.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.LoaiGioiTinh;

@Repository("loaiGioiTinhDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class LoaiGioiTinhDaoImpl implements LoaiGioiTinhDao {

    @Autowired
    SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
	@Override
    @Transactional(readOnly = true)
    public List<LoaiGioiTinh> layDanhSachLoaiGioiTinh() {
        List<LoaiGioiTinh> dsLoaiGioiTinh = null;
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        String hql = "from LoaiGioiTinh";
        Query query = session.createQuery(hql);
        dsLoaiGioiTinh = query.list();
        return dsLoaiGioiTinh;
    }
}
