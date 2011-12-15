package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.KhachHangDAO;
import model.dao.PhanHeDAO;
import model.pojo.KhachHang;
import model.pojo.PhanHe;

import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangDangKy
 */
@WebServlet("/TrangDangKy.do")
public class TrangDangKy extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangDangKy() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fwdUrl = Const.VIEW_REGISTRATION;

        if (!ProcedureHelper.checkAccessRight(request, response, null)) {
            response.sendRedirect(Const.CTRL_HOME);
            return;
        }

        String tenDangNhap = request.getParameter("tenDangNhap");

        if (tenDangNhap != null) {
            if (KhachHangDAO.timKhachHangTheoId(tenDangNhap) == null) {
                String matKhau = request.getParameter("matKhau");
                String hoVaTen = request.getParameter("hoVaTen");
                String email = request.getParameter("email");
                String diaChi = request.getParameter("diaChi");
                String dienThoai = request.getParameter("dienThoai");
                PhanHe phanHe = PhanHeDAO.timPhanHeTheoId(1); // mặc định phân hệ user

                KhachHang khachHang = new KhachHang(tenDangNhap, matKhau, hoVaTen, diaChi, email,
                        dienThoai, phanHe);
                if (KhachHangDAO.themKhachHang(khachHang)) {
                    HttpSession session = request.getSession();
                    session = request.getSession();
                    session.setAttribute(Const.SESS_CUSTOMER, khachHang);

                    response.sendRedirect(Const.CTRL_HOME);
                    return;
                } else {
                    request.setAttribute("regMsg", "Đăng ký thất bại.");
                }
            } else {
                request.setAttribute("regMsg", "Tên đăng nhập đã có người sử dụng.");
            }
        }

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
