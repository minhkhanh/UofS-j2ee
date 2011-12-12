package vbay.dao;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.TaiKhoan;

@Repository("taiKhoanDao")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TaiKhoanDaoImpl implements TaiKhoanDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public TaiKhoan dangNhap(String tenTaiKhoan, String matKhau) {
        TaiKhoan taiKhoan = null;
        Session session = null;
        // Transaction transaction = null;

        try {
            session = sessionFactory.getCurrentSession();

            String hqlString = "select tk from TaiKhoan tk"
                    + " where tk.tenTaiKhoan = :tenTaiKhoan and tk.matKhau = :matKhau";

            // transaction = session.beginTransaction();
            taiKhoan = (TaiKhoan) session.createQuery(hqlString)
                    .setString("tenTaiKhoan", tenTaiKhoan).setString("matKhau", matKhau).list()
                    .get(0);
            // transaction.commit();
        } catch (Exception e) {
            // if (transaction != null) {
            // transaction.rollback();
            // }

            e.printStackTrace();

            taiKhoan = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return taiKhoan;
    }

}
