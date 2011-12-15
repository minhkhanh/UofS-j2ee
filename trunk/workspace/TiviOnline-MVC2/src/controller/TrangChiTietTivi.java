package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TiviDAO;
import model.pojo.KhachHang;
import model.pojo.Tivi;
import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangChiTietTivi
 */
@WebServlet("/TrangChiTietTivi.do")
public class TrangChiTietTivi extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChiTietTivi() {
        super();
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

    // @SuppressWarnings("unchecked")
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fwdUrl = Const.VIEW_PRODUCTDETAIL;

        String maTivi = request.getParameter("maTivi");
        String action = request.getParameter(Const.ACTION);
        if (action != null) {
            if (action.equals("delete")) {
                TiviDAO.xoaTivi(maTivi);
                response.sendRedirect(Const.CTRL_QUICKSEARCH);
                return;
            }
        }

        Tivi tivi = TiviDAO.timTiviTheoId(maTivi);
        request.setAttribute("tivi", tivi);
        if (tivi != null) {
            request.setAttribute("danhMuc", tivi.getDanhMuc());
        }

        ProcedureHelper.addToCart(request);

        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);
        if (khachHang != null && khachHang.getPhanHe().getTenPhanHe().equals(Const.ROLE_ADMIN)) {
            request.setAttribute("isAdmin", "true");
        }
        
        request.setAttribute("deleteLink", "TrangChiTietTivi.do?action=delete&maTivi=" + maTivi);
        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
