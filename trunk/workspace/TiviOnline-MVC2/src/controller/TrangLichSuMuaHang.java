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
 * Servlet implementation class TrangLichSuMuaHang
 */
@WebServlet("/TrangLichSuMuaHang.do")
public class TrangLichSuMuaHang extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangLichSuMuaHang() {
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
        String fwdUrl = Const.VIEW_HISTORY;
        
        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);
        if (!ProcedureHelper.checkAccessRight(request, response, Const.ROLE_USER)) {
            response.sendRedirect(Const.CTRL_LOGIN);
            return;
        }
        
        List<DonDatHang> dsDonDatHang = DonDatHangDAO.timDonDatHangTheoUser(khachHang.getTenDangNhap());
        
        float[] sumPriceArray = new float[dsDonDatHang.size()];
        DonDatHang donDH = null;
//        String[] tenTinhTrangArray = new String[dsDonDatHang.size()];
        for (int i = 0; i < dsDonDatHang.size(); ++i) {
            float sum = 0;
            donDH = dsDonDatHang.get(i);
            List<ChiTietDonDatHang> dsChiTiet = ChiTietDonDatHangDAO.timChiTietTheoMaDDH(donDH.getMaDonDatHang());
            for (int j = 0; j < dsChiTiet.size(); ++j) {
                sum += dsChiTiet.get(j).getDonGia();
            }
            
            sumPriceArray[i] = sum;            
//            tenTinhTrangArray[i] = TinhTrangDonDatHangDAO.timTinhTrangTheoId(donDH.getTinhTrang().getMaTinhTrang()).getTenTinhTrang();
        }
        
        request.setAttribute("sumPriceArray", sumPriceArray);
//        request.setAttribute("tenTinhTrangArray", tenTinhTrangArray);
        request.setAttribute("dsDonDatHang", dsDonDatHang);
        
        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }

}
