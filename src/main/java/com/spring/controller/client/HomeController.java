package com.spring.controller.client;

import com.spring.dao.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfClient")
public class HomeController {

    @Autowired
    ProductDAO productdao;

    @RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mnv = new ModelAndView("client/index");
        mnv.addObject("viewcount", productdao.GetTopView());
        mnv.addObject("lastest", productdao.GetLastest());
        return mnv;
    }

    @RequestMapping(value = "/help", method = RequestMethod.GET)
    public ModelAndView help() {
        return new ModelAndView("client/help");
    }
}
