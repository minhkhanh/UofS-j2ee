package vbay.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;


import vbay.dao.TaiKhoanDao;
import vbay.model.TaiKhoan;
import vbay.util.Utils;

/**
 * Servlet Filter implementation class SpringFilter
 */
@WebFilter(dispatcherTypes = { DispatcherType.REQUEST
// DispatcherType.FORWARD,
// DispatcherType.INCLUDE,
// DispatcherType.ERROR
}, servletNames = { "SpringDispatcher" })
public class MainFilter implements Filter {
    @Autowired
    TaiKhoanDao taiKhoanDao;

    /**
     * Default constructor.
     */
    public MainFilter() {
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        HttpServletRequest hreq = (HttpServletRequest) request;
        HttpServletResponse hres = (HttpServletResponse) response;
        
        HttpSession session = hreq.getSession();
        
//        System.out.println("filter " + cookies.length);
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            Cookie[] cookies = hreq.getCookies();
            if (cookies != null) {
                String tenTaiKhoan = null;
                String matKhau = null;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals(Utils.SESATT_ACCNAME)) {
                        tenTaiKhoan = cookie.getValue();
                        System.out.println("cookie value " + tenTaiKhoan);
                    } else if (cookie.getName().equals(Utils.SESATT_PASSW)) {
                        matKhau = cookie.getValue();
                        System.out.println("cookie value " + matKhau);
                    }
                }

                if (tenTaiKhoan != null && matKhau != null) {
                    TaiKhoan taiKhoan = taiKhoanDao.dangNhap(tenTaiKhoan, matKhau);
                    if (taiKhoan != null) {
                        System.out.println("cookie logged");
                        session.removeAttribute(Utils.SESS_ACTFAIL);
                        session.removeAttribute(Utils.SESS_RETURL);
                        session.setAttribute(Utils.SESS_ACC, taiKhoan);
                    }
                }

                // still no account logged
//                if (session.getAttribute(Utils.SESS_ACC) == null) {
////                    response.setContentType("text/html");
//                    Utils.removeLoggingCookie(hres);
//                }
            }
        }

        // pass the request along the filter chain
        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {

    }

}
