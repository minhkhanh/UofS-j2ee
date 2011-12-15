package vbay.controller;

import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiGioiTinhDao;
import vbay.dao.TaiKhoanDao;
import vbay.model.LoaiGioiTinh;
import vbay.model.TaiKhoan;
import vbay.util.Utils;

@Controller
@RequestMapping("/general")
public class GeneralController {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logOut(HttpSession session, String returnUrl) {
        session.removeAttribute(Utils.SESS_ACC);
        String mapPath = Utils.getMapPath(session.getServletContext(), returnUrl);
        return new ModelAndView("redirect:" + mapPath);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView logIn(HttpSession session, HttpServletRequest request, String tenTaiKhoan, String matKhau,
            String returnUrl) {
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }

        TaiKhoan taiKhoan = taiKhoanDao.dangNhap(tenTaiKhoan, matKhau);
        if (taiKhoan != null) {
            session.removeAttribute(Utils.SESS_ACTFAIL);
            session.removeAttribute(Utils.SESS_RETURL);
            session.setAttribute("taiKhoan", taiKhoan);
            String mapPath = Utils.getMapPath(session.getServletContext(), returnUrl);
            return new ModelAndView("redirect:" + mapPath);
        }

        session.setAttribute(Utils.SESS_ACTFAIL, "Bạn đã nhập không đúng tên tài khoản hoặc mật khẩu");
        session.setAttribute(Utils.SESS_RETURL, returnUrl);
        return new ModelAndView("redirect:/LogIn.vby");
    }
    
    @Autowired
    LoaiGioiTinhDao loaiGioiTinhDao;      
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(HttpSession session, HttpServletRequest request, String ngaySinh, String noiSinh, String maTheTinDung, String maLoaiGioiTinh) {
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }
        
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		String matKhauXacNhan = request.getParameter("matKhauXacNhan");
		String hoVaTen = request.getParameter("hoVaTen");
		String email = request.getParameter("email");
		String diaChi = request.getParameter("diaChi");
		String dienThoai = request.getParameter("dienThoai");
		
		boolean kq = true;
		String strNoti = "";
		if (tenDangNhap==null || tenDangNhap.length()<=4) kq = false;
		if (taiKhoanDao.kiemTraTonTaiTenTaiKhoan(tenDangNhap)) { 
			//kq = false;
			strNoti += "Tên đăng nhập bị trùng.<br/>";
		}
		if (matKhau==null || matKhau.length()<=4) kq = false;
		if (matKhauXacNhan==null || matKhauXacNhan.length()<=4 || matKhau.compareTo(matKhauXacNhan)!=0)  {
			//kq = false;
			strNoti += "Mật khẩu nhập lại phải giống.<br/>";
		}
		if (email==null || email.length()<=4) kq = false;
		
		
		if (hoVaTen==null || hoVaTen.length()<=4) kq = false;
		if (diaChi==null || diaChi.length()<=4) kq = false;
		if (dienThoai==null || dienThoai.length()<=4) kq = false;
        
        
        
	    List<LoaiGioiTinh> listLoaiGioiTinh = loaiGioiTinhDao.layDanhSachLoaiGioiTinh();
	    ModelAndView result = new ModelAndView("Register");
	    result.addObject("danhSachLoaiGioiTinh", listLoaiGioiTinh);
	    result.addObject("publicKey", Utils.RECAPTCHA_PUBLIC_KEY);
	    result.addObject("privateKey", Utils.RECAPTCHA_PRIVATE_KEY);
	    result.addObject(Utils.SESS_ACTFAIL, strNoti);
	    return result;
    }
    

    
}
