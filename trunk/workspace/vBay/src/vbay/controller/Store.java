package vbay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.CuaHangDao;
import vbay.dao.ThongTinTaiKhoanDao;
import vbay.model.CuaHang;
import vbay.model.TaiKhoan;
import vbay.util.Utils;

@Controller
@RequestMapping("/Store.vby")
public class Store {
	@Autowired
	CuaHangDao cuaHangDao;
	@Autowired
	ThongTinTaiKhoanDao thongTinTaiKhoanDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới được dùng chức năng này.");
            session.setAttribute(Utils.SESS_RETURL, "/Store.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn hiện chưa có trang cửa hàng cần tạo trước.");
        	return new ModelAndView("CreateStore");
        }
        request.setAttribute("cuaHang", cuaHang);        
        return new ModelAndView("Store");
    }
    @RequestMapping(value="/createStore", method = RequestMethod.POST)
    public ModelAndView createStore(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới được dùng chức năng này.");
            session.setAttribute(Utils.SESS_RETURL, "/Store.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }
        
        TaiKhoan tk = (TaiKhoan)session.getAttribute(Utils.SESS_ACC);
        CuaHang cuaHang = tk.getThongTinTaiKhoan().getCuaHang();
        if (cuaHang==null) {
        	System.out.println("tạo cửa hàng.");
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
}
