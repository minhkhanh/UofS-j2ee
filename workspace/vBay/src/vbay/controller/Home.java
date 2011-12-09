package vbay.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Home")
public class Home {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView show(String name) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("nameAttr", name);
        System.out.println(name);
        return new ModelAndView("Home", model);
    }
}
