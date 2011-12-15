package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.KhachHangDAO;
import model.pojo.KhachHang;

import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangDangNhap
 */
@WebServlet("/TrangDangNhap.do")
public class TrangDangNhap extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangDangNhap() {
        super();
        // TODO Auto-generated constructor stub
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

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        
        if (!ProcedureHelper.checkAccessRight(request, response, null)) {
            response.sendRedirect(Const.CTRL_HOME);
            return;
        }
        
        String fwdUrl = Const.VIEW_LOGGING;

        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");

        if (tenDangNhap != null && matKhau != null) {
            KhachHang khachHang = KhachHangDAO.kiemTraDangNhap(tenDangNhap, matKhau);
            if (khachHang != null) {
                HttpSession session = request.getSession();
                session.setAttribute(Const.SESS_CUSTOMER, khachHang);

                response.sendRedirect(Const.CTRL_HOME);
                return;
            } else {
                request.setAttribute("logMsg", "Tên đăng nhập hoặc mật khẩu không đúng.");
                fwdUrl = Const.VIEW_LOGGING;
            }
        }

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }

}
