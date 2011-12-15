package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.ChiTietDonDatHangDAO;
import model.dao.DonDatHangDAO;
import model.dao.TinhTrangDonDatHangDAO;
import model.pojo.ChiTietDonDatHang;
import model.pojo.ChiTietId;
import model.pojo.DonDatHang;
import model.pojo.KhachHang;
import model.pojo.TinhTrangDonDatHang;
import model.pojo.Tivi;
import util.Const;
import util.ProcedureHelper;

/**
 * Servlet implementation class TrangGioHang
 */
@WebServlet("/TrangGioHang.do")
public class TrangGioHang extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangGioHang() {
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

    @SuppressWarnings("unchecked")
    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fwdUrl = Const.VIEW_CART;

        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);
        if (!ProcedureHelper.checkAccessRight(request, response, Const.ROLE_USER)) {
            response.sendRedirect(Const.CTRL_LOGIN);
            return;
        }

        float sumPrice = 0;
        ArrayList<Tivi> gioHang = (ArrayList<Tivi>) session.getAttribute(Const.SESS_CART);
        if (gioHang != null) {
            String action = request.getParameter(Const.ACTION);
            if (action != null) {
                if (action.equals(Const.ACT_DELROW)) {
                    String strDelRow = request.getParameter("dongCanXoa");
                    if (strDelRow != null) {
                        int iDelRow = Integer.valueOf(strDelRow);

                        if (iDelRow < gioHang.size()) {
                            gioHang.remove(iDelRow);
                            session.setAttribute(Const.SESS_CART, gioHang);
                        }
                    }
                }

                if (action.equals(Const.ACT_CHECKOUT)) {
                    if (gioHang.size() > 0) {
                        DonDatHang donDatHang = new DonDatHang();
                        TinhTrangDonDatHang tinhTrang = TinhTrangDonDatHangDAO
                                .timTinhTrangTheoId(1); // tạm mặc định là chưa xác nhận
                        donDatHang.setTinhTrang(tinhTrang);
                        donDatHang.setKhachHang(khachHang);

                        DonDatHangDAO.themDonDatHang(donDatHang);

                        ChiTietDonDatHang chiTietDonDH = null;
                        Tivi tivi = null;
                        for (int i = 0; i < gioHang.size(); ++i) {
                            tivi = gioHang.get(i);
                            chiTietDonDH = new ChiTietDonDatHang();
                            chiTietDonDH.setDonGia(tivi.getGiaBan());
                            ChiTietId chiTietId = new ChiTietId(donDatHang.getMaDonDatHang(), i + 1);
                            chiTietDonDH.setChiTietId(chiTietId);
                            chiTietDonDH.setTivi(tivi);
                            chiTietDonDH.setSoLuong(tivi.getSoLuongTon());

                            ChiTietDonDatHangDAO.themChiTiet(chiTietDonDH);
                        }

                        session.removeAttribute(Const.SESS_CART);

                        response.sendRedirect("TrangChiTietDonDatHang.do?maDonDatHang="
                                + donDatHang.getMaDonDatHang());
                        return;
                    }
                }
            }

            for (int i = 0; i < gioHang.size(); ++i) {
                Tivi tivi = gioHang.get(i);
                sumPrice += tivi.getGiaBan() * tivi.getSoLuongTon();
            }

            request.setAttribute("sumPrice", sumPrice);

            ProcedureHelper.addToCart(request);
        }

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
