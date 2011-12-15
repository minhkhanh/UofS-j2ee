/**
 * 
 */
package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.pojo.DonDatHang;

import util.HibernateUtil;

/**
 * @author RM
 * 
 */
public class DonDatHangDAO {

    @SuppressWarnings("unchecked")
    public static List<DonDatHang> timDonDatHangTheoUser(String tenDangNhap) {
        List<DonDatHang> dsDonDatHang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "from DonDatHang ddh where ddh.khachHang.tenDangNhap = :tenDangNhap";

            transaction = session.beginTransaction();
            dsDonDatHang = session.createQuery(hqlString).setString("tenDangNhap", tenDangNhap)
                    .list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            dsDonDatHang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsDonDatHang;
    }

    public static DonDatHang timDonDatHang(int maDonDatHang, String tenDangNhap) {
        DonDatHang donDatHang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "from DonDatHang ddh where ddh.maDonDatHang = :maDonDatHang"
                    + " and ddh.khachHang.tenDangNhap = :tenDangNhap";

            transaction = session.beginTransaction();
            donDatHang = (DonDatHang) session.createQuery(hqlString)
                    .setInteger("maDonDatHang", maDonDatHang)
                    .setString("tenDangNhap", tenDangNhap)
                    .list().get(0);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            donDatHang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return donDatHang;
    }

    public static DonDatHang timDonDatHangTheoId(int maDonDatHang) {
        DonDatHang donDatHang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            donDatHang = (DonDatHang) session.get(DonDatHang.class, maDonDatHang);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            donDatHang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return donDatHang;
    }

    public static boolean themDonDatHang(DonDatHang donDatHang) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            donDatHang.setMaDonDatHang((Integer) session.save(donDatHang));
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            result = false;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return result;
    }
}
