package vbay.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;
import vbay.model.SanPham;

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
        List<SanPham> hotAuctions = sanPhamDao.hotAuctions();
        List<SanPham> newAuctions = sanPhamDao.newAuctions();
        List<SanPham> recentlySoldProducts=sanPhamDao.recentlySoldProducts();
        request.setAttribute("hotAuctions", hotAuctions);
        request.setAttribute("newAuctions", newAuctions);
        request.setAttribute("recentlySoldProducts",recentlySoldProducts);
        return new ModelAndView("Home");
    }
}
