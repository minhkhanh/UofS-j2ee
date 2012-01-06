package vbay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.CuaHangDao;
import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;
import vbay.dao.ThongTinTaiKhoanDao;
import vbay.model.CuaHang;
import vbay.model.SanPham;
import vbay.model.TaiKhoan;
import vbay.util.Utils;

@Controller
@RequestMapping("/Store.vby")
public class Store {
	@Autowired
	CuaHangDao cuaHangDao;
	@Autowired
	ThongTinTaiKhoanDao thongTinTaiKhoanDao;
	@Autowired
	TaiKhoanDao taiKhoanDao;
	@Autowired
	SanPhamDao sanPhamDao;

/*    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới sử dụng được chức năng này.");
            session.setAttribute(Utils.SESS_RETURL, "/Store.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn hiện chưa có trang cửa hàng! Cần tạo trang.");
        	return new ModelAndView("CreateStore");
        }
        request.setAttribute("cuaHang", cuaHang);  
        return new ModelAndView("Store");
    }*/
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(HttpSession session, HttpServletRequest request, String id) {
    	System.out.println("id:" + id);
    	if (id==null) {
            if (session.getAttribute(Utils.SESS_ACC) == null) {
                session.setAttribute(Utils.SESS_ACTFAIL,
                        "Bạn cần phải đăng nhập mới sử dụng được chức năng này.");
                session.setAttribute(Utils.SESS_RETURL, "/Store.vby");
                return new ModelAndView("redirect:/LogIn.vby");
            }

            TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
            CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
            if (cuaHang==null) {
                session.setAttribute(Utils.SESS_ACTFAIL,
                        "Bạn hiện chưa có trang cửa hàng! Cần tạo trang.");
            	return new ModelAndView("CreateStore");
            }
            request.setAttribute("cuaHang", cuaHang);  
            return new ModelAndView("redirect:/Store.vby?id="+tk.getMaTaiKhoan());    		
    	}
    	int maTaiKhoan = Integer.parseInt(id);;    	
    	TaiKhoan tk = taiKhoanDao.layTaiKhoanTheoMa(maTaiKhoan);
        if (tk == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Liên kết cửa hàng không tồn tài.");
            session.setAttribute(Utils.SESS_RETURL, "/Home.vby");
            return new ModelAndView("ErrorMessage");
        }
        System.out.println("ton tai id:" + id);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Liên kết cửa hàng không tồn tài.");
            session.setAttribute(Utils.SESS_RETURL, "/Home.vby");
            return new ModelAndView("ErrorMessage");
        }
        List<SanPham> dsSanPhamMoiDang = sanPhamDao.sanPhamMoiDang(tk.getMaTaiKhoan());
        request.setAttribute("cuaHang", cuaHang);
        if (dsSanPhamMoiDang!=null && dsSanPhamMoiDang.size()>0) request.setAttribute("dsSanPhamMoiDang", dsSanPhamMoiDang);
        
        List<SanPham> dsSanPhamSapKetThuc = sanPhamDao.sanPhamSapKetThuc(tk.getMaTaiKhoan());
        if (dsSanPhamSapKetThuc!=null && dsSanPhamSapKetThuc.size()>0) request.setAttribute("dsSanPhamSapKetThuc", dsSanPhamSapKetThuc);
        
        request.setAttribute("id", id);
        //---clone
        
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



		Integer soSPTimNhanh = sanPhamDao.soLuongSanPhamCuaHang(maTaiKhoan);
		request.setAttribute("soSPTimNhanh", soSPTimNhanh);

		Integer soTrang = sanPhamDao.soLuongTrangCuaHang(maTaiKhoan, soSPTrenTrang, soSPTimNhanh);
		request.setAttribute("soTrang", soTrang);

		List<SanPham> dsSanPham = sanPhamDao.sanPhamCuaHang(maTaiKhoan, trangHienThi, soSPTrenTrang);
		request.setAttribute("dsSanPham", dsSanPham);

		ArrayList<String> dsHinhAnh = layDanhSachHinhAnh(dsSanPham);
		request.setAttribute("dsHinhAnh", dsHinhAnh);
        
        
        return new ModelAndView("Store");
    }
    @RequestMapping(value="/createStore", method = RequestMethod.POST)
    public ModelAndView createStore(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn phải đăng nhập mới có thể dùng chức năng này.");
            session.setAttribute(Utils.SESS_RETURL, "/Store.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }
        
        TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
        	System.out.println("tao cua hang.");
        	cuaHang = new CuaHang();
        	cuaHang.setMoTaCuaHang("Mô tả cửa hàng.");
        	if (cuaHangDao.themCuaHang(cuaHang)) {
        		tk.getThongTinTaiKhoan().setCuaHang(cuaHang);
        		thongTinTaiKhoanDao.capNhatThongTinTaiKhoan(tk.getThongTinTaiKhoan());
        		return new ModelAndView("redirect:/Store.vby");
        	}
        }
        request.setAttribute("cuaHang", cuaHang);
        return new ModelAndView("Store");
    }    
    @RequestMapping(value="/capNhatMoTaCuaHang", method = RequestMethod.POST)
    public @ResponseBody String capNhatMoTaCuaHang(HttpServletRequest request , HttpSession session) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            return "false";
        }
        String moTaCuaHang = request.getParameter("moTaCuaHang");
        TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
        	return "false";
        }
        if (moTaCuaHang==null || moTaCuaHang.length()<5) return "false";
        
        System.out.println("ajax cap nhat mo ta:" + moTaCuaHang);
        cuaHang.setMoTaCuaHang(moTaCuaHang);
        cuaHangDao.capNhatCuaHang(cuaHang);
        return "true";
    }
    
	private ArrayList<String> layDanhSachHinhAnh(List<SanPham> dsSanPham) {
		ArrayList<String> dsHinhAnh = new ArrayList<String>();
		if (dsSanPham == null)
			return null;
		else {
			for (SanPham sp : dsSanPham) {
				try {						
					dsHinhAnh.add(sanPhamDao.layDanhSachHinhAnh(sp.getMaSanPham()).get(0));
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return dsHinhAnh;
	}
}
