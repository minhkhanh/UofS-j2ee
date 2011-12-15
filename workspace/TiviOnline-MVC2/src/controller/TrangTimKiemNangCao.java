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
 * Servlet implementation class TrangTimKiemNangCao
 */
@WebServlet("/TrangTimKiemNangCao.do")
public class TrangTimKiemNangCao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangTimKiemNangCao() {
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
        String fwdUrl = Const.VIEW_ADVSEARCH;
        
        String action=request.getParameter(Const.ACTION);
        if (action != null) {
            if (action.equals("delete")) {
                String maTivi = request.getParameter("maTivi");
                TiviDAO.xoaTivi(maTivi);
            }
        }

        float giaMin = -1;
        try {
            giaMin = Float.valueOf(request.getParameter("giaMin"));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("giaMin", giaMin);
        }

        float giaMax = -1;
        try {
            giaMax = Float.valueOf(request.getParameter("giaMax"));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("giaMax", giaMax);
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
        int soTrang = TiviDAO.demSoTrangTimNangCao(tenTivi, giaMin, giaMax, maDanhMuc, soTiviTrenTrang);
        request.setAttribute("soTrang", soTrang);

        List<Tivi> dsTivi = TiviDAO.timTiviNangCao(tenTivi, giaMin, giaMax, maDanhMuc, trangHienThi,
                soTiviTrenTrang);
        request.setAttribute("dsTivi", dsTivi);
        
        String url = "TrangTimKiemNangCao.do?";
        url += tenTivi != null ? "&tenTivi=" + tenTivi : "";
        url += maDanhMuc != null ? "&maDanhMuc=" + maDanhMuc : "";
        url += giaMin > 0 ? "&giaMin=" + giaMin : "";
        url += giaMax > 0 ? "&giaMax=" + giaMax : "";
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
        
        request.setAttribute("deleteLink", "TrangTimKiemNangCao.do?action=delete");

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }

}
