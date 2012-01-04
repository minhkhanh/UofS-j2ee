package vbay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;
import vbay.util.Utils;

@Controller
@RequestMapping("/Home.vby")
public class Home {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @Autowired
    SanPhamDao sanPhamDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpServletRequest request) {
        System.out.println("home " + request.getCookies().length);
        return new ModelAndView("Home");
    }
}
