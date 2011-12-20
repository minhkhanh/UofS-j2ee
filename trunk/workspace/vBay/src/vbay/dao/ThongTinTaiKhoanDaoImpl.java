package vbay.dao;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.ThongTinTaiKhoan;

@Repository("thongTinTaiKhoanDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class ThongTinTaiKhoanDaoImpl implements ThongTinTaiKhoanDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional(readOnly = false)
	public boolean themThongTinTaiKhoan(ThongTinTaiKhoan thongTinTaiKhoan) {
   		Session session = null;
   		try {
   			session = sessionFactory.getCurrentSession();
   			session.beginTransaction();
   			session.save(thongTinTaiKhoan);
   			session.getTransaction().commit();
   			return true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println(e);
			return false;
		}
	}

}
