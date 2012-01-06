package vbay.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiMultimediaDao;
import vbay.dao.TaiKhoanDao;
import vbay.model.LoaiMultimedia;
import vbay.model.Multimedia;
import vbay.model.TaiKhoan;
import vbay.model.ThongTinTaiKhoan;
import vbay.util.Utils;

@Controller
@RequestMapping("/Account.vby")
public class Account {
    
    @Autowired
    TaiKhoanDao taiKhoanDao;
    
    @Autowired
    LoaiMultimediaDao loaiMultimediaDao;
    
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView updateInfo(HttpSession session, HttpServletRequest request) {        
        TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute(Utils.SESS_ACC);
        if (taiKhoan == null) {
            return new ModelAndView("redirect:/LogIn.vby");
        }
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {

            ThongTinTaiKhoan thongTinTaiKhoan = taiKhoan.getThongTinTaiKhoan();

            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<?> items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                ex.printStackTrace();
            }

            // Process the uploaded items
            Iterator<?> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                String name = item.getFieldName();
                if (item.isFormField()) {
                    // processFormField(item);

                    String value = null;
                    try {
                        value = item.getString("UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }

                    if (name.equals("hoTen")) {
                        thongTinTaiKhoan.setHoTen(value);
                    } else if (name.equals("email")) {
                        taiKhoan.setEmail(value);
                    } else if (name.equals("diaChi")) {
                        thongTinTaiKhoan.setDiaChi(value);
                    } else if (name.equals("soDienThoai")) {
                        thongTinTaiKhoan.setSoDienThoai(value);
                    } else if (name.equals("maTheTinDung")) {
                        thongTinTaiKhoan.setMaTheTinDung(value);
                    }
                } else { // hinhAnh, video
                    if (name.equals("anhDaiDien")) {
                        // processUploadedFile(item);
                        // String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        // String contentType = item.getContentType();
                        // boolean isInMemory = item.isInMemory();
                        // long sizeInBytes = item.getSize();

                        if (fileName != null && fileName.length() > 0) {
                            File tam = new File(request.getServletContext().getRealPath(
                                    "/res/image/avatar"));

                            if (!tam.exists())
                                tam.mkdirs();

                            File uploadedFile = new File(tam, item.getName());
                            try {
                                item.write(uploadedFile);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            LoaiMultimedia loaiMultimedia = loaiMultimediaDao.layLoaiMultimedia(1);
                            Multimedia multimedia = new Multimedia();
                            multimedia.setLinkURL("/res/image/avatar/" + item.getName());
                            multimedia.setLoaiMultimedia(loaiMultimedia);
                            taiKhoan.setMultimediaAvatar(multimedia);
                        }
                    }
                }
            }
            
            taiKhoan.setThongTinTaiKhoan(thongTinTaiKhoan);            
            taiKhoanDao.capNhat(taiKhoan);
        }
        
        ModelAndView modelView = new ModelAndView("Account");
        return modelView;
    }

    @RequestMapping(params = { "matKhauCu" }, method = RequestMethod.POST)
    public @ResponseBody
    String checkOldPassword(HttpServletResponse response, HttpSession session, String matKhauCu) {
        TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute(Utils.SESS_ACC);
        if (taiKhoan == null) {
            return "true";
        }

        if (taiKhoan.getMatKhau().equals(matKhauCu)) {
            return "true";
        }

        //return "Mật khẩu cũ không đúng.";
        return "false";
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới xem được trang Account");
            session.setAttribute(Utils.SESS_RETURL, "/Account.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        Utils.removeTransferAttributes(session);
        return new ModelAndView("Account");
    }

    @RequestMapping(params = { "matKhauCu", "matKhauMoi", "matKhauMoi02", "submit" }, method = RequestMethod.POST)
    public ModelAndView changePassword(HttpSession session, String matKhauCu, String matKhauMoi,
            String matKhauMoi02, String submit) {
        ModelAndView modelView = new ModelAndView("Account");

        TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute(Utils.SESS_ACC);
        if (taiKhoan == null) {
            return new ModelAndView("redirect:/LogIn.vby");
        }

        if (matKhauCu.equals(taiKhoan.getMatKhau()) && matKhauMoi.equals(matKhauMoi02)) {
            taiKhoan.setMatKhau(matKhauMoi);
            taiKhoanDao.capNhat(taiKhoan);
        }

        return modelView;
    }
}
