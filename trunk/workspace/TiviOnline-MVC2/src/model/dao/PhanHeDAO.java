/**
 * 
 */
package model.dao;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import model.pojo.PhanHe;

import util.HibernateUtil;

/**
 * @author RM
 * 
 */
public class PhanHeDAO {

    public static PhanHe timPhanHeTheoId(int maPhanHe) {
        PhanHe phanHe = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            phanHe = (PhanHe) session.get(PhanHe.class, maPhanHe);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            phanHe = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return phanHe;
    }

    public static PhanHe timPhanHeTheoTen(String tenPhanHe) {
        PhanHe phanHe = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select ph from PhanHe ph where ph.tenPhanHe = :tenPhanHe";

            transaction = session.beginTransaction();
            phanHe = (PhanHe) session.createQuery(hqlString).setString("tenPhanHe", tenPhanHe)
                    .list().get(0);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return phanHe;
    }
}
