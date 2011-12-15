/**
 * 
 */
package custom;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import util.Const;

import model.pojo.KhachHang;

/**
 * @author RM
 * 
 */
@SuppressWarnings("serial")
public class UserPanelTag extends TagSupport {
    private KhachHang khachHang = null;

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = this.pageContext.getOut();

        // job below will ignore value assigning to khachHang from outside
        HttpSession session = this.pageContext.getSession();
        khachHang = (KhachHang) session.getAttribute(Const.SESS_CUSTOMER);

        try {
            if (this.khachHang != null) {
                out.println("   <div id='displayname'>Chào, <b>" + this.khachHang.getTenDangNhap() + "</b>.</div>");
                out.println("   <div id='userlocations'>");

                String tenPhanHe = this.khachHang.getPhanHe().getTenPhanHe();
                if (tenPhanHe.equals(Const.ROLE_USER)) {
                    out.println("    <a href='TrangGioHang.do'>Giỏ hàng</a> <a href='TrangLichSuMuaHang.do'>Lịch sử mua hàng</a>");
                } else if (tenPhanHe.equals(Const.ROLE_ADMIN)) {
                    out.println("    <a href='TrangThemTivi.do'>Thêm tivi</a>");
                }

                out.println("<a href='TrangChu.do?action=dangXuat'>Đăng xuất</a>");
                out.println("</div>");
            } else {
                out.println("<div id='userlocations'>");
                out.println("    <a href='TrangDangNhap.do'>Đăng nhập</a> <a href='TrangDangKy.do'>Đăng ký</a>");
                out.println("</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    @Override
    public void release() {
        khachHang = null;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }
}
