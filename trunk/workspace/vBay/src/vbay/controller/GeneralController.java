package vbay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.TaiKhoanDao;
import vbay.model.TaiKhoan;
import vbay.util.Const;

@Controller
@RequestMapping("/general")
public class GeneralController {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logOut(HttpSession session, String returnUrl) {
        session.removeAttribute(Const.SESS_ACC);
        String mapPath = Const.getMapPath(session.getServletContext(), returnUrl);
        return new ModelAndView("redirect:" + mapPath);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView logIn(HttpSession session, HttpServletRequest request, String tenTaiKhoan, String matKhau,
            String returnUrl) {
        if (session.getAttribute(Const.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }

        TaiKhoan taiKhoan = taiKhoanDao.dangNhap(tenTaiKhoan, matKhau);
        if (taiKhoan != null) {
            session.setAttribute("taiKhoan", taiKhoan);
            String mapPath = Const.getMapPath(session.getServletContext(), returnUrl);
            return new ModelAndView("redirect:" + mapPath);
        }

        session.setAttribute("actionFailure", "Bạn đã nhập không đúng tên tài khoản hoặc mật khẩu");
        session.setAttribute("returnUrl", returnUrl);
        return new ModelAndView("redirect:/LogIn.vby");
    }
}
