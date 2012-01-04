package vbay.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.SanPhamDao;
import vbay.model.SanPham;

@Controller
@RequestMapping("/Product.vby")
public class Product {
    
    @Autowired
    SanPhamDao sanPhamDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(@RequestParam String maSanPham) {
        ModelAndView modelView = new ModelAndView("Product");
        
        SanPham sanPham = sanPhamDao.laySanPham(Integer.valueOf(maSanPham));        
        
        modelView.addObject(sanPham);
        
        return modelView;
    }
}
