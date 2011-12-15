package vbay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;

@Controller
@RequestMapping("/Home.vby")
public class Home {

    @Autowired
    TaiKhoanDao taiKhoanDao;
    
    @Autowired
    SanPhamDao sanPhamDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle() {
        return new ModelAndView("Home");
    }
}
