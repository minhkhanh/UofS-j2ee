package vbay.dao;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.LoaiTaiKhoan;

@Repository("loaiTaiKhoanDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class LoaiTaiKhoanDaoImpl implements LoaiTaiKhoanDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional(readOnly = true)
    public LoaiTaiKhoan layLoaiTaiKhoan(int maLoaiTaiKhoan) {
        return (LoaiTaiKhoan) sessionFactory.getCurrentSession().get(LoaiTaiKhoan.class,
        		maLoaiTaiKhoan);
    }

	@Override
	@Transactional(readOnly = true)
	public LoaiTaiKhoan layLoaiTaiKhoan(String tenLoaiTaiKhoan) {
        LoaiTaiKhoan loaiTaiKhoan = null;
        Session session = null;

        try {
            session = sessionFactory.getCurrentSession();

            String hqlString = "select obj from LoaiTaiKhoan obj"
                    + " where obj.tenLoaiTaiKhoan = :tenLoaiTaiKhoan";

            loaiTaiKhoan = (LoaiTaiKhoan) session.createQuery(hqlString)
                    .setString("tenLoaiTaiKhoan", tenLoaiTaiKhoan).list()
                    .get(0);
        } catch (Exception e) {

            e.printStackTrace();
            loaiTaiKhoan = null;
        }

        return loaiTaiKhoan;

	}

}
