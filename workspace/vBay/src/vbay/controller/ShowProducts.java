
package vbay.controller;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;
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
@RequestMapping("/ShowProducts.vby")
public class ShowProducts {
	@Autowired
	SanPhamDao sanPhamDao;
	@Autowired
	LoaiSanPhamDao loaiSanPhamDao;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView handle(HttpSession session, HttpServletRequest request) {
		
		int trangHienThi = 1;
		if (request.getParameter("trangHienThi") != null && !request.getParameter("trangHienThi").equals("")){
			trangHienThi = Integer.parseInt(request.getParameter("trangHienThi"));
		}
		
		int soLuongSPTrenTrang = 10;
		if (request.getParameter("soLuongSPTrenTrang") != null && !request.getParameter("soLuongSPTrenTrang").equals("")){
			soLuongSPTrenTrang = Integer.parseInt(request.getParameter("soLuongSPTrenTrang"));
		}
		
		int maLoaiSanPham = -1;
		String tenLoaiSanPham = "";
		
		if (request.getParameter("maLoaiSanPham")!=null){
			maLoaiSanPham = Integer.parseInt(request.getParameter("maLoaiSanPham"));
		}
		if (request.getParameter("tenLoaiSanPham") != null){
			tenLoaiSanPham = request.getParameter("tenLoaiSanPham");					
		}
		
		int soLuongSanPham = sanPhamDao.laySanPhamTheoDanhMuc(maLoaiSanPham, -1, -1).size();
		int soTrang = soLuongSanPham / soLuongSPTrenTrang;
		if (soLuongSanPham % soLuongSPTrenTrang != 0){
			 soTrang += 1;
		}
		List<SanPham> dsSanPhamTheoDanhMuc = sanPhamDao.laySanPhamTheoDanhMuc(maLoaiSanPham,trangHienThi,soLuongSPTrenTrang);
		ArrayList<String> dsHinhAnh = layDanhSachHinhAnh(dsSanPhamTheoDanhMuc);
		List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamDao.layDanhSachLoaiSanPham();
		
		request.setAttribute("dsHinhAnh", dsHinhAnh);
		request.setAttribute("dsSanPhamTheoDanhMuc", dsSanPhamTheoDanhMuc);
		request.setAttribute("tenLoaiSanPham", tenLoaiSanPham);
		request.setAttribute("soTrang", soTrang);
		request.setAttribute("dsHinhAnh", dsHinhAnh);
		request.setAttribute("dsLoaiSanPham", dsLoaiSanPham);
		return new ModelAndView("ShowProducts");
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
