package vbay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.TaiKhoanDao;
import vbay.model.TaiKhoan;
import vbay.util.EmailService;
import vbay.util.SecurityHelper;
import vbay.util.Utils;

@Controller
@RequestMapping("/PasswordRecover.vby")
public class PasswordRecover {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle() {
        return new ModelAndView("PasswordRecover");
    }

    @RequestMapping(params = { "email", "tenTaiKhoan" }, method = RequestMethod.POST)
    public ModelAndView handle(@RequestParam String email, @RequestParam String tenTaiKhoan) {
        ModelAndView modelView = new ModelAndView("PasswordRecover");

        TaiKhoan taiKhoan = taiKhoanDao.timTaiKhoanTheoEmail(email);
        if (email == null || taiKhoan == null) {
            taiKhoan = taiKhoanDao.timTaiKhoanTheoTenTaiKhoan(tenTaiKhoan);
            if (taiKhoan == null) {
                modelView.addObject(Utils.SESS_ACTFAIL, "Hệ thống không tìm được email của bạn.");
                return modelView;
            }

            email = taiKhoan.getEmail();
        }
        
        String newPwd = Utils.genRandPassword(12);
        String hashPwd = SecurityHelper.encriptPassword(newPwd, "MD5");
        taiKhoan.setMatKhau(hashPwd);
        taiKhoanDao.capNhat(taiKhoan);
        
        try {
            EmailService.send("pop.gmail.com", email, "vbaynet@gmail.com", "ak127601", "vBay Đấu giá Online - Phục hồi mật khẩu", "Dưới đây là mật khẩu mới của bạn:\r\n" + newPwd + "\r\nBạn nên đăng nhập ngay và đổi mật khẩu mới.");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return modelView;
    }
}
