package com.myorg.springmvctutorial.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myorg.springmvctutorial.web.dao.ArticleDao;
import com.myorg.springmvctutorial.web.model.Article;

@Controller
@RequestMapping("/controller2")
public class Controller2 {

    @Autowired
    private ArticleDao articleDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listArticles() {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("articles", articleDao.listArticles());

        return new ModelAndView("List", model);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addArticle(@ModelAttribute("article") Article article, BindingResult result) {
        return new ModelAndView("Add");
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveArticle(@ModelAttribute("article") Article article, BindingResult result) {
        articleDao.saveArticle(article);
        return new ModelAndView("redirect:/controller2/list");
    }
}
