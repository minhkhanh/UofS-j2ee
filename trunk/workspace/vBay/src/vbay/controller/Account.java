package vbay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.util.Const;

@Controller
@RequestMapping("/Account.vby")
public class Account {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Const.SESS_ACC) == null) {
            session.setAttribute("actionFailure", "Bạn cần phải đăng nhập mới xem được trang Account");
            session.setAttribute("returnUrl",
                    Const.getFullPath(request.getServletContext(), "/Account.vby"));
            return new ModelAndView("redirect:/LogIn.vby");
        }

        return new ModelAndView("Account");
    }
}
