package controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class TrangTimKiemNhanh
 */
@WebServlet("/TrangTimKiemNhanh.do")
public class TrangTimKiemNhanh extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangTimKiemNhanh() {
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
        String fwdUrl = Const.VIEW_QUICKSEARCH;
        
        String action=request.getParameter(Const.ACTION);
        if (action != null) {
            if (action.equals("delete")) {
                String maTivi = request.getParameter("maTivi");
                TiviDAO.xoaTivi(maTivi);
            }
        }

        int soTiviTrenTrang = 5;
        try {
            soTiviTrenTrang = Integer.valueOf(request.getParameter("soTiviTrenTrang"));
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.setAttribute("soTiviTrenTrang", soTiviTrenTrang);
        }

        String kieuHienThi = request.getParameter("kieuHienThi");
        if (kieuHienThi == null) {
            kieuHienThi = "detail";
        }
        request.setAttribute("kieuHienThi", kieuHienThi);

        int soTiviTrenTrangPrev = 5;
        try {
            soTiviTrenTrangPrev = Integer.valueOf(request.getParameter("soTiviTrenTrangPrev"));
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.setAttribute("soTiviTrenTrangPrev", soTiviTrenTrangPrev);
        }

        int trangHienThi = 1;
        try {
            if (soTiviTrenTrangPrev == soTiviTrenTrang) {
                trangHienThi = Integer.valueOf(request.getParameter("trangHienThi"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            request.setAttribute("trangHienThi", trangHienThi);
        }

        String tenTivi = request.getParameter("tenTivi");
        String maDanhMuc = request.getParameter("maDanhMuc");
        int soTrang = TiviDAO.demSoTrangTimNhanh(tenTivi, maDanhMuc, soTiviTrenTrang);
        request.setAttribute("soTrang", soTrang);

        List<Tivi> dsTivi = TiviDAO.timTiviNhanh(tenTivi, maDanhMuc, trangHienThi, soTiviTrenTrang);
        request.setAttribute("dsTivi", dsTivi);
        
//        String[] dsTenDanhMuc = new String[dsTivi.size()];
//        for (int i = 0; i < dsTivi.size(); ++i) {
////            dsTenDanhMuc[i] = DanhMucDAO.timDanhMucTheoId(dsTivi.get(i).getMaDanhMuc()).getTenDanhMuc();
//            dsTenDanhMuc[i] = dsTivi.get(i).getDanhMuc().getTenDanhMuc();
//        }
//        request.setAttribute("dsTenDanhMuc", dsTenDanhMuc);

        String url = "TrangTimKiemNhanh.do?";
        url += tenTivi != null ? "&tenTivi=" + tenTivi : "";
        url += maDanhMuc != null ? "&maDanhMuc=" + maDanhMuc : "";
        url += "&soTiviTrenTrang=" + soTiviTrenTrang + "&soTiviTrenTrangPrev=" + soTiviTrenTrang + "&kieuHienThi="
                + kieuHienThi;
        request.setAttribute("url", url);

        ProcedureHelper.addToCart(request);

        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);
        if (khachHang != null
                && khachHang.getPhanHe().getTenPhanHe().equals(Const.ROLE_ADMIN)) {
            request.setAttribute("isAdmin", "true");
        }

        request.setAttribute("deleteLink", "TrangTimKiemNhanh.do?action=delete");

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
