package controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import model.dao.DanhMucDAO;
import model.dao.TiviDAO;
import model.pojo.DanhMuc;
import model.pojo.Tivi;

import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangSuaTivi
 */
@WebServlet("/TrangSuaTivi.do")
public class TrangSuaTivi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangSuaTivi() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        processRequest(request, response);
    }

    @SuppressWarnings("rawtypes")
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        if (!ProcedureHelper.checkAccessRight(request, response, Const.ROLE_ADMIN)) {
            response.sendRedirect(Const.CTRL_LOGIN);
            return;
        }

        String fwdUrl = Const.VIEW_UPDATEPRODUCT;

        String resultMsg = "";
        Tivi tivi = new Tivi();
        String maTivi = request.getParameter("maTivi");
        if (maTivi == null || maTivi.equals("")) {
            resultMsg = "Hãy tìm kiếm một sản phẩm để sửa.";
        } else {
            resultMsg = "";
            tivi = TiviDAO.timTiviTheoId(maTivi);
        }

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//        System.out.println(isMultipart);
//        System.out.println(resultMsg);
        if (isMultipart && resultMsg.equals("")) {

            // TiviPOJO tivi = TiviDAO.timTiviTheoId(maTivi);

            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e1) {
                e1.printStackTrace();
            }

            // Process the uploaded items
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField()) {
                    // processFormField(item);

                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");

                    if (name.equals("maTivi")) {
                        tivi.setMaTivi(value);
                    } else if (name.equals("tenTivi")) {
                        tivi.setTenTivi(value);
                    } else if (name.equals("moTa")) {
                        tivi.setMoTa(value);
                    } else if (name.equals("giaBan")) {
                        try {
                            tivi.setGiaBan(Float.valueOf(value));
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            resultMsg = "Giá bán không hợp lệ.";
                        }
                    } else if (name.equals("soLuongTon")) {
                        try {
                            tivi.setSoLuongTon(Integer.valueOf(value));
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            resultMsg = "Số lượng tồn không hợp lệ.";
                        }
                    } else if (name.equals("kichThuoc")) {
                        tivi.setKichThuoc(value);
                    } else if (name.equals("khuyenMai")) {
                        tivi.setKhuyenMai(value);
                    } else if (name.equals("xuatXu")) {
                        tivi.setXuatXu(value);
                    } else if (name.equals("maDanhMuc")) {
                        DanhMuc danhMuc = DanhMucDAO.timDanhMucTheoId(value);
                        tivi.setDanhMuc(danhMuc);
                    }

                } else { // hinhAnh
                    // processUploadedFile(item);
                    // String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    // String contentType = item.getContentType();
                    // boolean isInMemory = item.isInMemory();
                    // long sizeInBytes = item.getSize();

                    if (fileName != null && fileName.length() > 0) {
                        File tam = new File(getServletContext().getRealPath("/images/tivi"));
                        // System.out.println(getServletContext().getRealPath("/images/tivi"));

                        if (!tam.exists())
                            tam.mkdirs();

                        File uploadedFile = new File(tam, item.getName());
                        try {
                            item.write(uploadedFile);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        tivi.setHinhAnh("images/tivi/" + item.getName());
                    }
                }
            }

            if (resultMsg == "") {
                if (TiviDAO.suaTivi(tivi)) {
                    resultMsg = "Sản phẩm đã được cập nhật.";
                }
            }
        }
        
        request.setAttribute("tivi", tivi);
        request.setAttribute("resultMsg", resultMsg);

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }

}
