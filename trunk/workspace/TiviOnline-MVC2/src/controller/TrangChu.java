package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.TiviDAO;

import util.Const;
import util.EmailService;

/**
 * Servlet implementation class TrangChu
 */
@WebServlet("/TrangChu.do")
public class TrangChu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChu() {
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
//        String fwdUrl = Const.CTRL_HOTTIVI;
        String fwdUrl = Const.VIEW_HOME;

        String action = request.getParameter(Const.ACTION);
        if (action != null) {
            if (action.equals(Const.ACT_LOGOUT)) {
                HttpSession session = request.getSession();

                // remove session attributes about customer and cart
                session.removeAttribute(Const.SESS_CUSTOMER);
                session.removeAttribute(Const.SESS_CART);

                fwdUrl = Const.CTRL_HOTTIVI;
            } else if (action.equals("delete")) {
                String maTivi = request.getParameter("maTivi");
                TiviDAO.xoaTivi(maTivi);
            } else if (action.equals("sendmail")) {
                try {
                    EmailService.send("pop.gmail.com", "akhoi90@yahoo.com", "akhoi90@gmail.com", "pegasuscode0015", "test", "test text");
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        
        request.setAttribute("deleteLink", "TrangChu.do?action=delete");

        request.getRequestDispatcher(fwdUrl).forward(request, response);
    }
}
