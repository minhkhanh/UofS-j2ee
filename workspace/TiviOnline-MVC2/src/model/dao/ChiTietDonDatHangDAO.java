/**
 * 
 */
package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.pojo.ChiTietDonDatHang;

import util.HibernateUtil;

/**
 * @author RM
 *
 */
public class ChiTietDonDatHangDAO {
    
    public static boolean themChiTiet(ChiTietDonDatHang chiTiet) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(chiTiet);
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
    
    @SuppressWarnings("unchecked")
    public static List<ChiTietDonDatHang> timChiTietTheoMaDDH(int maDonDatHang) {
        List<ChiTietDonDatHang> dsChiTiet = null;
        Session session = null;
        Transaction transaction = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            
            String hqlString = "from ChiTietDonDatHang ct" +
            		" where ct.donDatHang.maDonDatHang = :maDonDatHang";
            
            transaction = session.beginTransaction();
            dsChiTiet = session.createQuery(hqlString)
                    .setInteger("maDonDatHang", maDonDatHang)
                    .list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            
            dsChiTiet = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return dsChiTiet;
    }
}
