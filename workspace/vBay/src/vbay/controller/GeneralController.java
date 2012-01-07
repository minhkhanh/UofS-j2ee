package vbay.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiGioiTinhDao;
import vbay.dao.LoaiTaiKhoanDao;
import vbay.dao.TaiKhoanDao;
import vbay.dao.ThongTinTaiKhoanDao;
import vbay.model.LoaiGioiTinh;
import vbay.model.TaiKhoan;
import vbay.model.ThongTinTaiKhoan;
import vbay.util.Utils;

@Controller
@RequestMapping("/general")
public class GeneralController {

    @Autowired
    TaiKhoanDao taiKhoanDao;

    @Autowired
    LoaiGioiTinhDao loaiGioiTinhDao;

    @Autowired
    ThongTinTaiKhoanDao thongTinTaiKhoanDao;

    @Autowired
    LoaiTaiKhoanDao loaiTaiKhoanDao;

    @RequestMapping(params = { "id", "status" }, value = "/ytnext")
    public @ResponseBody
    String test(HttpSession session, String id, String status) {
        return id;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logOut(HttpSession session, HttpServletRequest request, HttpServletResponse response, String returnUrl) {
        session.removeAttribute(Utils.SESS_ACC);
        
        Utils.removeLoggingCookie(request.getCookies(), response);
        
        String mapPath = Utils.getMapPath(session.getServletContext(), returnUrl);
        return new ModelAndView("redirect:" + mapPath);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView logIn(HttpSession session, HttpServletRequest request,
            HttpServletResponse response, String tenTaiKhoan, String matKhau, String ghiNho,
            String returnUrl) {
        //System.out.println("/general/login");
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }

        TaiKhoan taiKhoan = taiKhoanDao.dangNhap(tenTaiKhoan, matKhau);
        if (taiKhoan != null) {
            session.removeAttribute(Utils.SESS_ACTFAIL);
            session.removeAttribute(Utils.SESS_RETURL);
            session.setAttribute(Utils.SESS_ACC, taiKhoan);

            if (ghiNho != null) {
                response.addCookie(Utils.createCookie(Utils.SESATT_ACCNAME, tenTaiKhoan, "/", 60*2));
                response.addCookie(Utils.createCookie(Utils.SESATT_PASSW, matKhau, "/", 60*2));
                System.out.println("logging cookie added");
            } else {
                Utils.removeLoggingCookie(request.getCookies(), response);
            }

            if (returnUrl == null) {
                returnUrl = "/Home.vby";
            }
            String mapPath = Utils.getMapPath(session.getServletContext(), returnUrl);
            return new ModelAndView("redirect:" + mapPath);
        }

        session.setAttribute(Utils.SESS_ACTFAIL,
                "Bạn đã nhập không đúng tên tài khoản hoặc mật khẩu");
        session.setAttribute(Utils.SESS_RETURL, returnUrl);
        return new ModelAndView("redirect:/LogIn.vby");
    }

    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(HttpSession session, HttpServletRequest request, String ngaySinh,
            String noiSinh, String maTheTinDung, String maLoaiGioiTinh) {
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }

        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        String matKhauXacNhan = request.getParameter("matKhauXacNhan");
        String hoVaTen = request.getParameter("hoVaTen");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        String dienThoai = request.getParameter("dienThoai");

        boolean kq = true;
        String strNoti = "";
        if (tenDangNhap == null || tenDangNhap.length() <= 4)
            kq = false;
        if (taiKhoanDao.kiemTraTonTaiTenTaiKhoan(tenDangNhap)) {
            // kq = false;
            strNoti += "Tên đăng nhập bị trùng.<br/>";
        }
        if (matKhau == null || matKhau.length() <= 4)
            kq = false;
        if (matKhauXacNhan == null || matKhauXacNhan.length() <= 4
                || matKhau.compareTo(matKhauXacNhan) != 0) {
            // kq = false;
            strNoti += "Mật khẩu nhập lại phải giống.<br/>";
        }
        if (email == null || email.length() <= 4)
            kq = false;

        if (hoVaTen == null || hoVaTen.length() <= 4)
            kq = false;
        if (diaChi == null || diaChi.length() <= 4)
            kq = false;
        if (dienThoai == null || dienThoai.length() <= 4)
            kq = false;
        Date objNgaySinh = null;
        if (ngaySinh == null || ngaySinh.length() <= 4)
            kq = false;
        else {
            try {
                objNgaySinh = new Date(Date.parse(ngaySinh));
            } catch (Exception e) {
                objNgaySinh = new Date(Calendar.getInstance().getTimeInMillis());
                kq = false;
            }
        }
        if (noiSinh == null || noiSinh.length() <= 4)
            kq = false;
        if (maTheTinDung == null || maTheTinDung.length() <= 4)
            kq = false;
        LoaiGioiTinh objLoaiGioiTinh = null;
        if (maLoaiGioiTinh == null || maLoaiGioiTinh.length() < 1)
            kq = false;
        else {
            int iMaLoaiGioiTinh = Integer.parseInt(maLoaiGioiTinh);
            objLoaiGioiTinh = loaiGioiTinhDao.layLoaiGioiTinh(iMaLoaiGioiTinh);
            if (objLoaiGioiTinh == null)
                kq = false;
        }

        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey(Utils.RECAPTCHA_PRIVATE_KEY);

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");

        if (challenge != null && uresponse != null) {
            ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge,
                    uresponse);
            if (!reCaptchaResponse.isValid()) {
                strNoti += "Thông tin captcha không đúng.<br/>";
            }
        }

        if (!kq) {
            strNoti += "Mọi thông tin đều bắt buộc.<br/>";
        }

        if (strNoti != "") { // tien hanh them vao csdl
            try {
                ThongTinTaiKhoan thongTinTaiKhoan = new ThongTinTaiKhoan();
                thongTinTaiKhoan.setDiaChi(diaChi);
                thongTinTaiKhoan.setHoTen(hoVaTen);
                thongTinTaiKhoan.setLoaiGioiTinh(objLoaiGioiTinh);
                thongTinTaiKhoan.setMaTheTinDung(maTheTinDung);
                thongTinTaiKhoan.setSoDienThoai(dienThoai);
                thongTinTaiKhoan.setNgaySinh(objNgaySinh);
                thongTinTaiKhoan.setNoiSinh(noiSinh);
                // thongTinTaiKhoanDao.themThongTinTaiKhoan(thongTinTaiKhoan);
                TaiKhoan taiKhoan = new TaiKhoan();
                taiKhoan.setCoHieuLuc(false);
                taiKhoan.setDaKichHoatEmail(false);
                taiKhoan.setEmail(email);
                taiKhoan.setMatKhau(matKhau);
                taiKhoan.setTenTaiKhoan(tenDangNhap);
                taiKhoan.setLoaiTaiKhoan(loaiTaiKhoanDao.layLoaiTaiKhoan("User"));
                taiKhoan.setThongTinTaiKhoan(thongTinTaiKhoan);
                taiKhoanDao.themTaiKhoan(taiKhoan);
                return new ModelAndView("redirect:/LogIn.vby");
            } catch (Exception e) {
                ModelAndView result = new ModelAndView("ErrorMessage");
                result.addObject(Utils.SESS_ACTFAIL,
                        "Server đang quá tải vui lòng đăng ký lúc khác");
                return result;
            }
        }
        List<LoaiGioiTinh> listLoaiGioiTinh = loaiGioiTinhDao.layDanhSachLoaiGioiTinh();
        ModelAndView result = new ModelAndView("Register");
        result.addObject("danhSachLoaiGioiTinh", listLoaiGioiTinh);
        result.addObject("publicKey", Utils.RECAPTCHA_PUBLIC_KEY);
        result.addObject("privateKey", Utils.RECAPTCHA_PRIVATE_KEY);
        result.addObject(Utils.SESS_ACTFAIL, strNoti);
        return result;
    }

}
