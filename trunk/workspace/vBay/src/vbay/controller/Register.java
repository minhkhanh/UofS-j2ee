package vbay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.tanesha.recaptcha.ReCaptchaImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiGioiTinhDao;
import vbay.model.LoaiGioiTinh;
import vbay.util.Utils;

@Controller
@RequestMapping("/Register.vby")
public class Register {
    @Autowired
    LoaiGioiTinhDao loaiGioiTinhDao;    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }
	    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
	    reCaptcha.setPrivateKey(Utils.RECAPTCHA_PRIVATE_KEY);
	    request.setAttribute("publicKey", Utils.RECAPTCHA_PUBLIC_KEY);
	    request.setAttribute("privateKey", Utils.RECAPTCHA_PRIVATE_KEY);
	    List<LoaiGioiTinh> listLoaiGioiTinh = loaiGioiTinhDao.layDanhSachLoaiGioiTinh();
	    request.setAttribute("danhSachLoaiGioiTinh", listLoaiGioiTinh);
        return new ModelAndView("Register");
    }
}
