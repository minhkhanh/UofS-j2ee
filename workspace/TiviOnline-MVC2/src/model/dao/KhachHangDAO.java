/**
 * 
 */
package model.dao;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import model.pojo.KhachHang;

import util.HibernateUtil;
import util.SecurityHelper;

/**
 * @author RM
 * 
 */
public class KhachHangDAO {

    public static KhachHang kiemTraDangNhap(String tenDangNhap, String matKhau) {
        String matKhauMaHoa = SecurityHelper.encriptPassword(matKhau, "MD5");

        KhachHang khachHang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select kh from KhachHang kh"
                    + " where kh.tenDangNhap = :tenDangNhap and kh.matKhau = :matKhauMaHoa";

            transaction = session.beginTransaction();
            khachHang = (KhachHang) session.createQuery(hqlString)
                    .setString("tenDangNhap", tenDangNhap).setString("matKhauMaHoa", matKhauMaHoa)
                    .list().get(0);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            khachHang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return khachHang;
    }

    public static boolean themKhachHang(KhachHang khachHang) {
        khachHang.setMatKhau(SecurityHelper.encriptPassword(khachHang.getMatKhau(), "MD5"));
        
        boolean result = true;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(khachHang);
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

    /**
     * Tìm khách hàng theo cặp tên đăng nhập & mật khẩu.
     * 
     * @param tenDangNhap username.
     * @param matKhau password chưa được mã hóa.
     * @return null hoặc đối tượng POJO khách hàng tìm được.
     */
    public static KhachHang timKhachHangTheoId(String tenDangNhap) {
        KhachHang khachHang = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            khachHang = (KhachHang) session.get(KhachHang.class, tenDangNhap);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }

            e.printStackTrace();

            khachHang = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return khachHang;
    }
}
