/**
 * 
 */
package util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.pojo.KhachHang;
import model.pojo.Tivi;

import model.dao.TiviDAO;

/**
 * Write procedures into methods to use in many places.
 * 
 * @author RM
 */
public class ProcedureHelper {

    @SuppressWarnings("unchecked")
    public static void addToCart(HttpServletRequest request) {

        String action = request.getParameter(Const.ACTION);
        if (action != null && action.equals(Const.ACT_ADDCART)) {
            String maTivi = request.getParameter("maTivi");
            if (maTivi != null) {
                ArrayList<Tivi> gioHang = null;
                HttpSession session = request.getSession();
                if (session.getAttribute(Const.SESS_CART) == null) {
                    gioHang = new ArrayList<Tivi>();
                } else {
                    gioHang = (ArrayList<Tivi>) session.getAttribute(Const.SESS_CART);
                }

                int i = 0;
                for (; i < gioHang.size(); ++i) {
                    Tivi tiviTrongGio = gioHang.get(i);
                    if (tiviTrongGio.getMaTivi().equals(maTivi)) {
                        tiviTrongGio.setSoLuongTon(tiviTrongGio.getSoLuongTon() + 1);

                        break;
                    }
                }

                if (i == gioHang.size()) {
                    Tivi tiviMoi = TiviDAO.timTiviTheoId(maTivi);
                    gioHang.add(tiviMoi);
                }

                session.setAttribute(Const.SESS_CART, gioHang);
            }
        }
    }

    /**
     * Check access right of current logged user then redirect to a suitable page if access is abandoned.
     * 
     * @param request HttpServletRequest object in the context.
     * @param response HttpServletResponse object in the context.
     * @param userType user type name that have access right to the page, passed null to allow only unlogged users.
     * @param redirectPage link to the page for redirecting.
     */
    public static boolean checkAccessRight(HttpServletRequest request, HttpServletResponse response, String userType) {

        HttpSession session = request.getSession();
        KhachHang khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);

        if (userType == null) {
            if (khachHang != null) {
                return false;
            }
        } else {
            if (khachHang == null) {
                return false;
            } else {
                if (!khachHang.getPhanHe().getTenPhanHe().equals(userType)) { 
                    return false;
                }
            }
        }

        return true;
    }
}
