/**
 * 
 */
package model.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.pojo.TinhTrangDonDatHang;

import util.HibernateUtil;

/**
 * @author RM
 *
 */
public class TinhTrangDonDatHangDAO {
    
    public static TinhTrangDonDatHang timTinhTrangTheoId(int maTinhTrang) {
        TinhTrangDonDatHang tinhTrang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tinhTrang = (TinhTrangDonDatHang) session.get(TinhTrangDonDatHang.class, maTinhTrang);
            transaction.commit();            
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            
            tinhTrang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        
        return tinhTrang;
    }
}
