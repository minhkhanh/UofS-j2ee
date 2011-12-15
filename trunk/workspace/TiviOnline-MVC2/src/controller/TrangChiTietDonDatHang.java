package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ChiTietDonDatHangDAO;
import model.dao.DonDatHangDAO;
import model.pojo.ChiTietDonDatHang;
import model.pojo.DonDatHang;
import model.pojo.KhachHang;
import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangChiTietDonDatHang
 */
@WebServlet("/TrangChiTietDonDatHang.do")
public class TrangChiTietDonDatHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChiTietDonDatHang() {
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

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String fwdUrl = Const.VIEW_ORDERDETAIL;

        if (!ProcedureHelper.checkAccessRight(request, response, Const.ROLE_USER)) {
            response.sendRedirect(Const.CTRL_LOGIN);
            return;
        }
        
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);

        DonDatHang donDatHang = null;
        int iMaDonDatHang = -1;

        String strMaDonDatHang = request.getParameter("maDonDatHang");
        if (strMaDonDatHang != null) {
            iMaDonDatHang = Integer.valueOf(strMaDonDatHang);
        }

        // không cho phép xem đơn đặt hàng của người khác
        donDatHang = DonDatHangDAO.timDonDatHang(iMaDonDatHang, khachHang.getTenDangNhap());
        if (donDatHang == null) {
            response.sendRedirect("TrangChu.do");
            return;
        }
        
//        String tenTinhTrang = donDatHang.getTinhTrang().getTenTinhTrang();
        List<ChiTietDonDatHang> dsChiTietDonDatHang = ChiTietDonDatHangDAO.timChiTietTheoMaDDH(iMaDonDatHang);
//        Tivi[] dsTivi = new Tivi[dsChiTietDonDatHang.size()];
//        for (int i = 0; i < dsChiTietDonDatHang.size(); ++i) {
//            dsTivi[i] = TiviDAO.timTiviTheoId(dsChiTietDonDatHang.get(i).getTivi().getMaTivi());
//        }
        
        request.setAttribute("donDatHang", donDatHang);
//        request.setAttribute("tenTinhTrang", tenTinhTrang);
        request.setAttribute("dsChiTietDonDatHang", dsChiTietDonDatHang);
//        request.setAttribute("dsTivi", dsTivi);

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
