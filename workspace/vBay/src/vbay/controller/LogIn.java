package vbay.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vbay.util.Utils;

@Controller
@RequestMapping("/LogIn.vby")
public class LogIn {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handle(HttpSession session) {
        if (session.getAttribute(Utils.SESS_ACC) != null) {
            return new ModelAndView("redirect:/Home.vby");
        }
        
        return new ModelAndView("LogIn");
    }
}
