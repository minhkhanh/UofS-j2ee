package vbay.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.dao.LoaiMultimediaDao;
import vbay.dao.LoaiSanPhamDao;
import vbay.dao.MultimediaDao;
import vbay.dao.SanPhamDao;
import vbay.model.LoaiMultimedia;
import vbay.model.LoaiSanPham;
import vbay.model.Multimedia;
import vbay.model.SanPham;
import vbay.util.Utils;

@Controller
@RequestMapping("/PostProduct.vby")
public class PostProduct {
    @Autowired
    SanPhamDao sanPhamDao;

    @Autowired
    MultimediaDao multimediaDao;

    @Autowired
    LoaiMultimediaDao loaiMultimediaDao;

    @Autowired
    LoaiSanPhamDao loaiSanPhamDao;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới được đăng sản phẩm.");
            session.setAttribute(Utils.SESS_RETURL, "/PostProduct.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        Utils.removeTransferAttributes(session);

        return new ModelAndView("PostProduct");
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView postProduct(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới được đăng sản phẩm.");
            session.setAttribute(Utils.SESS_RETURL, "/PostProduct.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        Utils.removeTransferAttributes(session);

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {

            SanPham sanPham = new SanPham();

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
            // Transaction transaction = sessionFactory.getCurrentSession().beginTransaction();
            Set<Multimedia> multimedias = new HashSet<Multimedia>();
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

                    if (name.equals("tenSanPham")) {
                        sanPham.setTenSanPham(value);
                    } else if (name.equals("moTaSanPham")) {
                        sanPham.setMoTaSanPham(value);
                        System.out.println("editor");
                    } else if (name.equals("giaKhoiDiem")) {
                        sanPham.setGiaKhoiDiem(Integer.valueOf(value));
                    } else if (name.equals("ngayHetHan")) {
                        try {
                            DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
                            Date date = (Date) dateFormat.parse(value.trim());
                            sanPham.setNgayHetHan(date);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                } else { // hinhAnh, video
                    if (name.equals("hinhAnh")) {
                        // processUploadedFile(item);
                        // String fieldName = item.getFieldName();
                        String fileName = item.getName();
                        // String contentType = item.getContentType();
                        // boolean isInMemory = item.isInMemory();
                        // long sizeInBytes = item.getSize();

                        if (fileName != null && fileName.length() > 0) {
                            File tam = new File(request.getServletContext().getRealPath(
                                    "/res/image/product"));
                            // System.out.println(getServletContext().getRealPath("/images/tivi"));

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
                            multimedia.setLinkURL("/res/image/product/" + item.getName());
                            multimedia.setLoaiMultimedia(loaiMultimedia);
                            // multimedia.setTenMultimedia(tenMultimedia)
                            multimedias.add(multimedia);
                            System.out.println(item.getName());

                            // multimediaDao.themMultimedia(multimedia);
                        }
                    }
                }
            }

            // sanPham.setNgayDang(new Date());

            LoaiSanPham loaiSanPham = loaiSanPhamDao.layLoaiSanPham(1);
            sanPham.setLoaiSanPham(loaiSanPham);
            sanPham.setMultimedias(multimedias);

            int a = sanPhamDao.themSanPham(sanPham);
            // transaction.commit();
            System.out.println("new product id: " + a);

            // if (resultMsg.equals("")) {
            // if (TiviDAO.themTivi(sanPham)) {
            // request.setAttribute("actionDone", "Sản phẩm đã được thêm.");
            // } else {
            // resultMsg = "Thêm không thành công";
            // }
            // }
        }

        return new ModelAndView();
    }
}
