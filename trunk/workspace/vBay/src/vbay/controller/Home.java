package vbay.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;
import vbay.model.ChiTietDauGia;
import vbay.model.SanPham;

@Controller
@RequestMapping("/Home.vby")
public class Home {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @Autowired
    SanPhamDao sanPhamDao;
    
   
	@SuppressWarnings("null")
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpServletRequest request) {
        System.out.println("home " + request.getCookies().length);
        List<SanPham> hotAuctions = sanPhamDao.hotAuctions();
        ArrayList<String> listImageHotAuctions = layHinhAnhSanPham(hotAuctions);
        List<SanPham> newAuctions = sanPhamDao.newAuctions();
        ArrayList<String> listImageNewAuctions = layHinhAnhSanPham(newAuctions);
        List<ChiTietDauGia> recentlySoldProducts=sanPhamDao.recentlySoldProducts();
        List<SanPham> listProducts = new ArrayList<SanPham>() ;
        for (ChiTietDauGia chiTiet : recentlySoldProducts) {
        	listProducts.add(chiTiet.getSanPham());
		}
        ArrayList<String> listImageRecentlySold = layHinhAnhSanPham(listProducts);
        request.setAttribute("hotAuctions", hotAuctions);
        request.setAttribute("newAuctions", newAuctions);
        request.setAttribute("recentlySoldProducts",recentlySoldProducts);
        request.setAttribute("listImageNewAuctions", listImageNewAuctions);
        request.setAttribute("listImageHotAuctions", listImageHotAuctions);
        request.setAttribute("listImageRecentlySold", listImageRecentlySold);
        return new ModelAndView("Home");
    }
    
    public ArrayList<String> layHinhAnhSanPham(List<SanPham> dsSanPham) {
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
