package vbay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Store.vby")
public class Store {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show() {
        return new ModelAndView("Store");
    }
}
