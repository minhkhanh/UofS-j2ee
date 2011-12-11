package vbay.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.util.Const;

@Controller
@RequestMapping("/general")
public class GeneralActionController {

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logOut(HttpSession session, String returnUrl) {
        session.removeAttribute(Const.SESS_ACC);
        return new ModelAndView("redirect:" + returnUrl);
    }
}
