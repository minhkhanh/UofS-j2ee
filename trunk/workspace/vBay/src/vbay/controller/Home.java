package vbay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiSanPhamDao;
import vbay.dao.SanPhamDao;
import vbay.dao.TaiKhoanDao;
import vbay.model.ChiTietDauGia;
import vbay.model.LoaiSanPham;
import vbay.model.SanPham;

@Controller
@RequestMapping("/Home.vby")
public class Home {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @Autowired
    SanPhamDao sanPhamDao;
    
    @Autowired
    LoaiSanPhamDao loaiSanPhamDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpServletRequest request) {
        System.out.println("home " + request.getCookies().length);

        List<SanPham> hotAuctions = sanPhamDao.hotAuctions();
        for (SanPham sanPham : hotAuctions) {
        	if (sanPham.getTenSanPham().length() > 12){
        		String tenSanPhamRutGon = sanPham.getTenSanPham().substring(0, 12) + "...";
        		sanPham.setTenSanPham(tenSanPhamRutGon);
        	}
			
		}
        ArrayList<String> listImageHotAuctions = layHinhAnhSanPham(hotAuctions);

        List<SanPham> newAuctions = sanPhamDao.newAuctions();
        for (SanPham sanPham : newAuctions) {
        	if (sanPham.getTenSanPham().length() > 12){
        		String tenSanPhamRutGon = sanPham.getTenSanPham().substring(0, 12) + "...";
        		sanPham.setTenSanPham(tenSanPhamRutGon);
        	}
			
		}
        ArrayList<String> listImageNewAuctions = layHinhAnhSanPham(newAuctions);

        List<ChiTietDauGia> recentlySoldProducts = sanPhamDao.recentlySoldProducts();

        List<SanPham> listProducts = new ArrayList<SanPham>();
        for (ChiTietDauGia chiTiet : recentlySoldProducts) {
            listProducts.add(chiTiet.getSanPham());
            if (chiTiet.getSanPham().getTenSanPham().length() > 12){
				String tenSanPhamRutGon = chiTiet.getSanPham().getTenSanPham().substring(0,12)+" ...";
				chiTiet.getSanPham().setTenSanPham(tenSanPhamRutGon);
			}
        }
       
        ArrayList<String> listImageRecentlySold = layHinhAnhSanPham(listProducts);
        List<LoaiSanPham> dsLoaiSanPham = loaiSanPhamDao.layDanhSachLoaiSanPham();
        request.setAttribute("dsLoaiSanPham", dsLoaiSanPham);
        request.setAttribute("hotAuctions", hotAuctions);
        request.setAttribute("newAuctions", newAuctions);
        request.setAttribute("recentlySoldProducts", recentlySoldProducts);
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
                	ArrayList<String> ds = sanPhamDao.layDanhSachHinhAnh(sp);
                	String url = ds.get(0);
                    dsHinhAnh.add(url);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
        return dsHinhAnh;
    }
        
}
