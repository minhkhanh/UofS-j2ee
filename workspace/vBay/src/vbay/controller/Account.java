package vbay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.util.Utils;

@Controller
@RequestMapping("/Account.vby")
public class Account {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session, HttpServletRequest request) {
        if (session.getAttribute(Utils.SESS_ACC) == null) {
            session.setAttribute(Utils.SESS_ACTFAIL,
                    "Bạn cần phải đăng nhập mới xem được trang Account");
            session.setAttribute(Utils.SESS_RETURL, "/Account.vby");
            return new ModelAndView("redirect:/LogIn.vby");
        }

        Utils.removeTransferAttributes(session);
        return new ModelAndView("Account");
    }
}
