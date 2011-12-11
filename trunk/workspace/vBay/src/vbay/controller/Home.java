package vbay.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.TaiKhoanDao;

@Controller
@RequestMapping("/Home.vby")
public class Home {
    
    @Autowired
    TaiKhoanDao taiKhoanDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle() {
        return new ModelAndView("Home");
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView handle(HttpSession session, String tenTaiKhoan, String matKhau) {
        session.setAttribute("taiKhoan", taiKhoanDao.dangNhap(tenTaiKhoan, matKhau));
        
        return new ModelAndView("Home");
    }
}
