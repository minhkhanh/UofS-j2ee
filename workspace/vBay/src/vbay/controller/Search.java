package vbay.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiSanPhamDao;
import vbay.dao.SanPhamDao;
import vbay.model.LoaiSanPham;
import vbay.model.SanPham;

@Controller
@RequestMapping("/Search.vby")
public class Search {
	@Autowired
	SanPhamDao sanPhamDao;

	@Autowired
	LoaiSanPhamDao loaiSanPhamDao;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView handle(HttpSession session, HttpServletRequest request) {
		String typeSearch = request.getParameter("typeSearch");
		if (typeSearch != null)
			if (typeSearch.equals("advancedSearch")) {
				List<LoaiSanPham> dsLoaiSP = loaiSanPhamDao
						.layDanhSachLoaiSanPham();
				request.setAttribute("dsLoaiSP", dsLoaiSP);
				return new ModelAndView("AdvancedSearch");
			}

		int soSPTrenTrang = 10;
		try {
			if (request.getParameter("soSPTrenTrang") != null) {
				soSPTrenTrang = Integer.valueOf(request
						.getParameter("soSPTrenTrang"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			request.setAttribute("soSPTrenTrang", soSPTrenTrang);
		}

		int trangHienThi = 1;
		try {
			if (request.getParameter("trangHienThi") != null) {
				trangHienThi = Integer.valueOf(request
						.getParameter("trangHienThi"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			request.setAttribute("trangHienThi", trangHienThi);
		}

		String khoaTimKiem = request.getParameter("khoaTimKiem");
		int maLoaiSanPham = -1;
		if (request.getParameter("maLoaiSanPham") != null
				&& !request.getParameter("maLoaiSanPham").equals("")) {
			maLoaiSanPham = Integer.valueOf(request
					.getParameter("maLoaiSanPham"));
		}

		int giaNhoNhat = 0;
		int giaLonNhat = 0;

		if (request.getParameter("giaNhoNhat") != null
				&& !request.getParameter("giaNhoNhat").equals("")) {
			giaNhoNhat = Integer.valueOf(request.getParameter("giaNhoNhat"));
		}
		request.setAttribute("giaNhoNhat", giaNhoNhat);

		if (request.getParameter("giaLonNhat") != null
				&& !request.getParameter("giaLonNhat").equals("")) {
			giaLonNhat = Integer.valueOf(request.getParameter("giaLonNhat"));
		}
		request.setAttribute("giaLonNhat", giaLonNhat);

		Date thoiGian = null;
		DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		if (request.getParameter("thoiGian") != null
				&& !request.getParameter("thoiGian").equals("")) {
			try {
				thoiGian = (Date) formatter.parse(request
						.getParameter("thoiGian"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("thoiGian", thoiGian);

		Integer soSPTimNhanh = sanPhamDao.soLuongSanPhamTimKiem(khoaTimKiem,
				maLoaiSanPham, giaNhoNhat, giaLonNhat, thoiGian);
		request.setAttribute("soSPTimNhanh", soSPTimNhanh);

		Integer soTrang = sanPhamDao.soLuongTrangTimKiem(khoaTimKiem,
				maLoaiSanPham, giaNhoNhat, giaLonNhat, thoiGian, soSPTrenTrang,
				soSPTimNhanh);
		request.setAttribute("soTrang", soTrang);

		List<SanPham> dsSanPham = sanPhamDao.timKiem(khoaTimKiem,
				maLoaiSanPham, giaNhoNhat, giaLonNhat, thoiGian, trangHienThi,
				soSPTrenTrang);
		request.setAttribute("dsSanPham", dsSanPham);

		ArrayList<String> dsHinhAnh = layDanhSachHinhAnh(dsSanPham);
		request.setAttribute("dsHinhAnh", dsHinhAnh);

		return new ModelAndView("Search");

	}

	public ArrayList<String> layDanhSachHinhAnh(List<SanPham> dsSanPham) {
		ArrayList<String> dsHinhAnh = new ArrayList<String>();
		if (dsSanPham == null)
			return null;
		else {
			for (SanPham sp : dsSanPham) {
				try {						
					dsHinhAnh.add(sanPhamDao.layDanhSachHinhAnh(sp).get(0));
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return dsHinhAnh;
	}

}
