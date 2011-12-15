/**
 * 
 */
package model.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.pojo.Tivi;

import util.HibernateUtil;

/**
 * @author RM
 * 
 */
public class TiviDAO {

    public static boolean xoaTivi(String maTivi) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hqlDelete = "delete Tivi t where t.maTivi = :maTivi";

            transaction = session.beginTransaction();
            session.createQuery(hqlDelete).setString("maTivi", maTivi).executeUpdate();
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

    public static boolean suaTivi(Tivi tivi) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.update(tivi);
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

    public static boolean themTivi(Tivi tivi) {
        boolean result = true;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(tivi);
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
     * Tính số trang dùng để hiển thị tivi bán chạy.
     * 
     * @param soLuong số lượng tivi cần tìm.
     * @param soTiviTrenTrang số tivi trên một trang.
     * @return danh sách tivi cần tìm.
     */
    public static int demSoTrangTiviBanChay(int soLuong, int soTiviTrenTrang) {
        int pageNum = 0;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            // Criteria crit = session.createCriteria(ChiTietDonDatHang.class)
            // .setProjection(Projections.sum("soLuong").as("Total"))
            // .setProjection(Projections.groupProperty("tivi"))
            // .add(Restrictions.eq("tivi.biXoa", 0))
            // .addOrder(Order.desc("Total"))
            // .setMaxResults(soLuong);

            String hqlString = "select sum(ct.soLuong) as TotalRecord"
                    + " from ChiTietDonDatHang ct where ct.tivi.biXoa = 0"
                    + " group by ct.tivi order by TotalRecord desc)";

            transaction = session.beginTransaction();
            int soLuongThuc = session.createQuery(hqlString).setMaxResults(soLuong).list().size();
            transaction.commit();

            pageNum = soLuongThuc / soTiviTrenTrang;
            if (soLuongThuc % soTiviTrenTrang != 0) {
                ++pageNum;
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            pageNum = -1;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return pageNum;
    }

    @SuppressWarnings("unchecked")
    public static List<Tivi> timTiviBanChay(int soLuong) {
        List<Tivi> dsTivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select ct.tivi"
                    + " from ChiTietDonDatHang ct where ct.tivi.biXoa = 0"
                    + " group by ct.tivi order by sum(ct.soLuong) desc";

            transaction = session.beginTransaction();
            dsTivi = session.createQuery(hqlString).setMaxResults(soLuong).list();
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsTivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsTivi;
    }

    /**
     * Tìm những tivi bán chạy dựa vào số lượng bán trong các đơn đặt hàng.
     * 
     * @param soLuong số lượng tivi cần tìm.
     * @param trangHienThi trang tivi cần hiển thị.
     * @param soTiviTrenTrang số tivi trên một trang.
     * @return danh sách tivi cần tìm.
     */
    @SuppressWarnings("unchecked")
    public static List<Tivi> timTiviBanChay(int trangHienThi, int soTiviTrenTrang) {
        List<Tivi> dsTivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select ct.tivi"
                    + " from ChiTietDonDatHang ct where ct.tivi.biXoa = 0"
                    + " group by ct.tivi order by sum(ct.soLuong) desc";

            int pos = (trangHienThi - 1) * soTiviTrenTrang;
            transaction = session.beginTransaction();
            dsTivi = session.createQuery(hqlString).setFirstResult(pos)
                    .setMaxResults(soTiviTrenTrang).list();
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsTivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsTivi;
    }

    /**
     * Lấy danh sách tivi theo chức năng tìm kiếm nâng cao. Bổ sung tham số cho biết số lượng sản
     * phẩm trên một trang và cần hiển thị trang nào.
     * 
     * @param tenTivi tên tivi.
     * @param giaMin giá thấp nhất.
     * @param giaMax giá cao nhất.
     * @param maDanhMuc mã danh mục.
     * @param trangHienThi trang sản phẩm cần hiển thị.
     * @param soTiviTrenTrang số tivi trên một trang.
     * @return danh sách tất cả tivi.
     */
    @SuppressWarnings("unchecked")
    public static List<Tivi> timTiviNangCao(String tenTivi, float giaMin, float giaMax,
            String maDanhMuc, int trangHienThi, int soTiviTrenTrang) {

        if (tenTivi == null) {
            tenTivi = "";
        }

        List<Tivi> dsTivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "from Tivi t where t.biXoa = 0 and t.tenTivi like :tenTivi";
            hqlString += giaMin >= 0 ? " and t.giaBan >= :giaMin" : "";
            hqlString += giaMax >= 0 ? " and t.giaBan <= :giaMax" : "";
            hqlString += maDanhMuc != null && maDanhMuc != "" ? " and t.danhMuc.maDanhMuc = :maDanhMuc"
                    : "";

            transaction = session.beginTransaction();
            Query query = session.createQuery(hqlString);
            query.setString("tenTivi", "%" + tenTivi + "%");

            if (giaMin >= 0) {
                query.setFloat("giaMin", giaMin);
            }
            if (giaMax >= 0) {
                query.setFloat("giaMax", giaMax);
            }
            if (maDanhMuc != null && maDanhMuc != "") {
                query.setString("maDanhMuc", maDanhMuc);
            }

            int pos = (trangHienThi - 1) * soTiviTrenTrang;
            dsTivi = query.setFirstResult(pos).setMaxResults(soTiviTrenTrang).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsTivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsTivi;
    }

    /**
     * Lấy danh sách tất cả tivi theo mã tivi, ứng với chức năng xem chi tiết tivi.
     * 
     * @param maTivi mã tivi.
     * @return một tivi tìm được.
     */
    public static Tivi timTiviTheoId(String maTivi) {
        Tivi tivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            tivi = (Tivi) session.get(Tivi.class, maTivi);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            tivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return tivi;
    }

    /**
     * Lấy danh sách tất cả tivi theo danh mục.
     * 
     * @param maDanhMuc mã danh mục.
     * @return danh sách tất cả tivi.
     */
    @SuppressWarnings("unchecked")
    public static List<Tivi> timTiviTheoDanhMuc(String maDanhMuc) {
        List<Tivi> dsTivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "from Tivi t where t.biXoa = 0 and t.danhMuc.maDanhMuc = :maDanhMuc";

            transaction = session.beginTransaction();
            dsTivi = session.createQuery(hqlString).setString("maDanhMuc", maDanhMuc).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsTivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsTivi;
    }

    /**
     * Lấy danh sách tất cả tivi theo tên và danh mục, ứng với chức năng tìm nhanh. Có xử lý ch�?n
     * l�?c tiêu chí tìm kiếm. Bổ sung tham số cho biết số lượng sản phẩm trên một trang và cần hiển
     * thị trang nào.
     * 
     * @param tenTivi tên tivi.
     * @param maDanhMuc mã danh mục.
     * @param soTiviTrenTrang số lượng tivi trên một trangHienThi.
     * @param trangHienThi trang cần hiển thị.
     * @return danh sách tất cả tivi.
     */
    @SuppressWarnings("unchecked")
    public static List<Tivi> timTiviNhanh(String tenTivi, String maDanhMuc, int trangHienThi,
            int soTiviTrenTrang) {
        if (tenTivi == null) {
            tenTivi = "";
        }

        List<Tivi> dsTivi = null;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "from Tivi t where t.biXoa = 0 and t.tenTivi like :tenTivi";
            if (maDanhMuc != null && maDanhMuc != "") {
                hqlString += " and t.danhMuc.maDanhMuc = :maDanhMuc";
            }

            transaction = session.beginTransaction();
            Query query = session.createQuery(hqlString).setString("tenTivi", "%" + tenTivi + "%");
            if (maDanhMuc != null && maDanhMuc != "") {
                query.setString("maDanhMuc", maDanhMuc);
            }

            int pos = (trangHienThi - 1) * soTiviTrenTrang;
            dsTivi = query.setFirstResult(pos).setMaxResults(soTiviTrenTrang).list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            dsTivi = null;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return dsTivi;
    }

    /**
     * Tính số lượng kết quả tivi tìm thấy theo tên và danh mục, ứng với chức năng tìm nhanh.
     * 
     * @param tenTivi tên tivi.
     * @param maDanhMuc mã danh mục.
     * @param soTiviTrenTrang số lượng tivi trên một trang.
     * @param trangHienThi trang cần hiển thị.
     * @return danh sách tất cả tivi.
     */
    public static int demSoTrangTimNhanh(String tenTivi, String maDanhMuc, int soTiviTrenTrang) {
        int pageNum = 0;
        if (tenTivi == null) {
            tenTivi = "";
        }

        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select count(*) from Tivi t where t.biXoa = 0 and t.tenTivi like :tenTivi";
            if (maDanhMuc != null && maDanhMuc != "") {
                hqlString += " and t.danhMuc.maDanhMuc = :maDanhMuc";
            }

            transaction = session.beginTransaction();
            Query query = session.createQuery(hqlString).setString("tenTivi", "%" + tenTivi + "%");
            if (maDanhMuc != null && maDanhMuc != "") {
                query.setString("maDanhMuc", maDanhMuc);
            }

            int soLuong = ((Long) query.list().get(0)).intValue();
            transaction.commit();
            pageNum = soLuong / soTiviTrenTrang;
            if (soLuong % soTiviTrenTrang != 0) {
                ++pageNum;
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

            pageNum = -1;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return pageNum;
    }

    /**
     * Tính số lượng kết quả tivi tìm thấy qua chức năng tìm nâng cao.
     * 
     * @param tenTivi tên tivi.
     * @param maDanhMuc mã danh mục.
     * @param soTiviTrenTrang số lượng tivi trên một trang.
     * @param trangHienThi trang cần hiển thị.
     * @return danh sách tất cả tivi.
     */
    public static int demSoTrangTimNangCao(String tenTivi, float giaMin, float giaMax,
            String maDanhMuc, int soTiviTrenTrang) {
        if (tenTivi == null) {
            tenTivi = "";
        }
        int pageNum = 0;
        Session session = null;
        Transaction transaction = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            String hqlString = "select count(*) from Tivi t where t.biXoa = 0 and t.tenTivi like :tenTivi";
            hqlString += giaMin >= 0 ? " and t.giaBan >= :giaMin" : "";
            hqlString += giaMax >= 0 ? " and t.giaBan <= :giaMax" : "";
            hqlString += maDanhMuc != null && maDanhMuc != "" ? " and t.danhMuc.maDanhMuc = :maDanhMuc"
                    : "";

            transaction = session.beginTransaction();
            Query query = session.createQuery(hqlString).setString("tenTivi", "%" + tenTivi + "%");
            if (giaMin >= 0) {
                query.setFloat("giaMin", giaMin);
            }
            if (giaMax >= 0) {
                query.setFloat("giaMax", giaMax);
            }
            if (maDanhMuc != null && maDanhMuc != "") {
                query.setString("maDanhMuc", maDanhMuc);
            }

            int soLuong = ((Long) query.iterate().next()).intValue();
            transaction.commit();
            pageNum = soLuong / soTiviTrenTrang;
            if (soLuong % soTiviTrenTrang != 0) {
                ++pageNum;
            }
        } catch (Exception e) {
            e.printStackTrace();

            pageNum = -1;
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return pageNum;
    }
}
