/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.controller.admin;

import com.google.gson.Gson;
import com.spring.dao.OrderDAO;
import com.spring.entity.JsonStatus;
import com.spring.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author FR
 */
@Controller(value = "AdminOrderController")
public class OrderController {

    @Autowired
    private OrderDAO orderdao;

    @RequestMapping("admin/orderlist")
    public ModelAndView OrderList() {
        return new ModelAndView("admin/orderlist", "orderlist", orderdao.GetData());
    }
    
    @RequestMapping(value = "admin/orderdetail/{orderid}", method = RequestMethod.GET)
    public ModelAndView OrderDetail(@PathVariable(required = true, name = "orderid") int orderid) {
        ModelAndView mnv = new ModelAndView("admin/orderdetail");
        mnv.addObject("orderdetail", orderdao.LoadOrderDetail(orderid));
        mnv.addObject("productlist", orderdao.LoadOrderProduct(orderid));

        return mnv;
    }
    
    @RequestMapping(value = "editorder", method = RequestMethod.GET)
    public @ResponseBody
    String SubmitCreate(int OrderID, int StatusID) {

        int result = orderdao.EditOrder(OrderID, StatusID);
        System.out.println(result);
        if (result == -1) {

            return new Gson().toJson(new JsonStatus(false, "Db Error"));
        } else if (result == 0) {
            return new Gson().toJson(new JsonStatus(false, "Fail"));
        } else {
            return new Gson().toJson(new JsonStatus(true, "Success"));
        }
    }
}
