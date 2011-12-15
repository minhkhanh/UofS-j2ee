/**
 * 
 */
package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.pojo.DanhMuc;

import util.HibernateUtil;

/**
 * @author RM
 * 
 */
public class DanhMucDAO {

    /**
     * Lấy tất cả danh mục có mã danh mục bằng mã danh mục cho trước.
     * 
     * @return ArrayList các danh mục.
     */
    public static DanhMuc timDanhMucTheoId(String maDanhMuc) {
        DanhMuc danhMuc = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            danhMuc = (DanhMuc) session.get(DanhMuc.class, maDanhMuc);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            danhMuc = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return danhMuc;
    }

    /**
     * Lấy tất cả danh mục có trong csdl.
     * 
     * @return ArrayList các danh mục.
     */
    @SuppressWarnings("unchecked")
    public static List<DanhMuc> layDSDanhMuc() {
        List<DanhMuc> dsDanhMuc = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            
            String hqlString = "from DanhMuc";
            
            transaction = session.beginTransaction();
            dsDanhMuc = session.createQuery(hqlString).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsDanhMuc = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsDanhMuc;
    }
}
