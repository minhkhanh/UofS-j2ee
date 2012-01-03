package vbay.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.Multimedia;
import vbay.model.SanPham;

@Repository("sanPhamDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class SanPhamDaoImpl implements SanPhamDao {

    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    @Transactional(readOnly = false)
    public Integer themSanPham(SanPham sanPham) {
        sanPham.setNgayDang(new Date());
        return (Integer) sessionFactory.getCurrentSession().save(sanPham);
    }

    @Override
	@Transactional(readOnly = true)
	public ArrayList<String> layDanhSachHinhAnh(int maSanPham) {
		SanPham sp = new SanPham();
		ArrayList<String> dsHinhAnh = new ArrayList<String>();
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "from SanPham sp where sp.maSanPham =:maSanPham";
			Query query = session.createQuery(hql);
			query.setInteger("maSanPham", maSanPham);
			sp = (SanPham) query.list().get(0);
			Iterator<Multimedia> multimedias = sp.getMultimedias().iterator();
			while (multimedias.hasNext()) {
				String linkUrl = multimedias.next().getLinkURL();
				dsHinhAnh.add(linkUrl);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			dsHinhAnh = null;
		}

		return dsHinhAnh;
	}

	@Override
	@Transactional(readOnly = true)
	public SanPham laySanPham(int maSanPham) {
		return (SanPham) sessionFactory.getCurrentSession().get(SanPham.class,
				maSanPham);
	}

	@Override
	@Transactional(readOnly = true)
	public Integer soLuongSanPhamTimKiem(String khoaTimKiem, int maLoaiSanPham,
			int giaNhoNhat, int giaLonNhat, Date thoiGian) {
		
		if (khoaTimKiem == null) {
			khoaTimKiem = "";			
		}
		
		if (khoaTimKiem.equals("") && maLoaiSanPham == -1 && giaNhoNhat == 0 && giaLonNhat == 0 && thoiGian == null) {
			return 0;
		}
		
		Integer soLuong = 0;
		
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
			String hql = "select count(*) from SanPham sp where 1=1";

			if (!khoaTimKiem.equals("")) {
				hql += " and sp.tenSanPham like :khoaTimKiem";
			}
			
			if (maLoaiSanPham != -1) {
				hql += " and sp.loaiSanPham.maLoaiSanPham =:maLoaiSanPham";
			}
			if (giaNhoNhat != 0) {
				hql += " and sp.giaHienTai>=:giaNhoNhat";
			}
			if (giaLonNhat != 0) {
				hql += " and sp.giaHienTai<=:giaLonNhat";
			}
			if (thoiGian != null) {
				hql += " and (sp.ngayDang>=:thoiGian) or (sp.ngayHetHan>=:thoiGian)";
			}

			Query query = session.createQuery(hql);
			query.setString("khoaTimKiem", "%" + khoaTimKiem + "%");
			if (giaNhoNhat != 0) {
				query.setInteger("giaNhoNhat", giaNhoNhat);
			}
			if (giaLonNhat != 0) {
				query.setInteger("giaLonNhat", giaLonNhat);
			}
			if (thoiGian != null) {
				query.setDate("thoiGian", thoiGian);
			}
			if (maLoaiSanPham != -1)
				query.setInteger("maLoaiSanPham", maLoaiSanPham);

			soLuong = ((Long) query.list().get(0)).intValue();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
		}

		return soLuong;
	}

	@Override
	@Transactional(readOnly = true)
	public Integer soLuongTrangTimKiem(String khoaTimKiem, int maLoaiSanPham,
			int giaNhoNhat, int giaLonNhat, Date thoiGian, int soSPTrenTrang,
			Integer soLuong) {
		Integer pageNume = 0;
		if (khoaTimKiem == null) {
			khoaTimKiem = "";
		}
		try {
			pageNume = soLuong / soSPTrenTrang;
			if (soLuong % soSPTrenTrang != 0) {
				++pageNume;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
		}

		return pageNume;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = true)
	public List<SanPham> timKiem(String khoaTimKiem, int maLoaiSanPham,
			int giaNhoNhat, int giaLonNhat, Date thoiGian, int trangHienThi,
			int soSPTrenTrang) {
		
		if (khoaTimKiem == null) {
			khoaTimKiem = "";
		}
		
		if (khoaTimKiem.equals("") && maLoaiSanPham == -1 && giaNhoNhat == 0 && giaLonNhat == 0 && thoiGian == null) {
			return null;
		}
		
		List<SanPham> dsSanPham = null;
		Session session = null;
		
		try {
			session = sessionFactory.getCurrentSession();
			session.beginTransaction();
			String hql = "from SanPham sp where 1=1";
			if (khoaTimKiem != "") {
				hql += " and sp.tenSanPham like :khoaTimKiem";
			}

			if (maLoaiSanPham != -1) {
				hql += " and sp.loaiSanPham.maLoaiSanPham =:maLoaiSanPham";
			}
			if (giaNhoNhat != 0) {
				hql += " and sp.giaHienTai>=:giaNhoNhat";
			}
			if (giaLonNhat != 0) {
				hql += " and sp.giaHienTai<=:giaLonNhat";
			}
			if (thoiGian != null) {
				hql += " and (sp.ngayHetHan>=:thoiGian)";
			}

			Query query = session.createQuery(hql);
			if (!khoaTimKiem.equals("")) {
				query.setString("khoaTimKiem", "%" + khoaTimKiem + "%");
			}
			if (giaNhoNhat != 0) {
				query.setInteger("giaNhoNhat", giaNhoNhat * 1000000);
			}
			if (giaLonNhat != 0) {
				query.setInteger("giaLonNhat", giaLonNhat * 1000000);
			}
			if (thoiGian != null) {
				query.setDate("thoiGian", thoiGian);
			}
			if (maLoaiSanPham != -1)
				query.setInteger("maLoaiSanPham", maLoaiSanPham);

			int pos = (trangHienThi - 1) * soSPTrenTrang;
			dsSanPham = query.setFirstResult(pos).setMaxResults(soSPTrenTrang)
					.list();
		} catch (Exception e) {
			e.printStackTrace();
			dsSanPham = null;
		} 
		
		return dsSanPham;
	}
}
