package vbay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vbay.dao.ChiTietDauGiaDao;
import vbay.dao.SanPhamDao;
import vbay.dao.TinhTrangSanPhamDao;
import vbay.model.ChiTietDauGia;
import vbay.model.SanPham;
import vbay.model.TinhTrangSanPham;
import vbay.util.EmailService;

@Controller
@RequestMapping("/product")
public class ProductServices {

    @Autowired
    SanPhamDao sanPhamDao;

    @Autowired
    ChiTietDauGiaDao chiTietDauGiaDao;

    @Autowired
    TinhTrangSanPhamDao tinhTrangSanPhamDao;

    @RequestMapping(params = { "maSanPham" }, value = "/check", method = RequestMethod.POST)
    public @ResponseBody
    String checkProductStatus(@RequestParam String maSanPham) {
        try {
            int iMaSanPham = Integer.valueOf(maSanPham);
            SanPham sanPham = sanPhamDao.timSanPhamTheoId(iMaSanPham);
            if (sanPham.getTinhTrangSanPham().getMaTinhTrangSanPham() != 1) {
                return "";
            }

            System.out.println("Check product: " + maSanPham);
            return sanPham.getGiaHienTai().toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    @RequestMapping(value = "/checkall", method = RequestMethod.POST)
    public @ResponseBody
    String checkProductStatus() {
        List<SanPham> dsSanPhamDangDauGia = sanPhamDao.timSanPhamTheoTinhTrang(1);
//        System.out.println("dsSanPhamDauGia: " + dsSanPhamDangDauGia == null ? "null" : dsSanPhamDangDauGia.size());
        for (SanPham sanPham : dsSanPhamDangDauGia) {
            long status = 0;
            if (sanPham.getTinhTrangSanPham().getMaTinhTrangSanPham() == 1) { // 'dang dau gia'
                status = (sanPham.getNgayHetHan().getTime() - new java.util.Date().getTime()) / 1000;
                if (status <= 0) {
                    ChiTietDauGia chiTietDauGiaLonNhat = chiTietDauGiaDao
                            .timChiTietDauGiaLonNhat(sanPham.getMaSanPham());
                    TinhTrangSanPham tinhTrangSanPham = null;

                    if (chiTietDauGiaLonNhat == null) {
//                        System.out.println("chiTietDauGia: null");                        
                        tinhTrangSanPham = tinhTrangSanPhamDao.timTinhTrangSanPham(3); // het han
                                                                                       // khong ai
                                                                                       // mua
                    } else {
//                        System.out.println("chiTietDauGia: NOT NULL");
                        tinhTrangSanPham = tinhTrangSanPhamDao.timTinhTrangSanPham(2); // dau gia
                                                                                       // thanh cong

                        try {
                            EmailService
                                    .send("pop.gmail.com", chiTietDauGiaLonNhat.getTaiKhoan()
                                            .getEmail(), "vbaynet@gmail.com", "ak127601",
                                            "vBay Đấu giá Online - Đấu giá thành công",
                                            "Bạn vừa làm chủ một món hàng đấu giá trên vBay. Mời bạn đăng nhập để kiểm tra.");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
//                    System.out.println("tinhTrangSanPham: " + tinhTrangSanPham == null ? "null" : tinhTrangSanPham.getTenTinhTrangSanPham());

                    sanPham.setTinhTrangSanPham(tinhTrangSanPham);
                    sanPhamDao.capNhat(sanPham);
                }
            }
        }

        System.out.println("Check all product.");
        return "";

    }
}
