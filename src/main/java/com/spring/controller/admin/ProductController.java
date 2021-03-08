/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.controller.admin;

import com.google.gson.Gson;
import com.spring.dao.BrandDAO;
import com.spring.dao.ProductDAO;
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
@Controller(value = "AdminProductController")
public class ProductController {
    
    @Autowired
    private ProductDAO productdao;

    @RequestMapping("admin/productlist")
    public ModelAndView ProductList() {

        return new ModelAndView("admin/productlist", "product", productdao.GetData());
    }

    @RequestMapping(value = "admin/product/submitcreate", method = RequestMethod.GET)
    public @ResponseBody
    String SubmitCreate(Product product) {

        int result = productdao.InsertData(product);
        System.out.println(result);
        if (result == -1) {

            return new Gson().toJson(new JsonStatus(false, "Db Error"));
        } else if (result == 0) {
            return new Gson().toJson(new JsonStatus(false, "Fail"));
        } else {
            return new Gson().toJson(new JsonStatus(true, "Success"));
        }
    }

    @RequestMapping(value = "admin/product/submitdelete", method = RequestMethod.GET)
    public @ResponseBody
    String SubmitDelete(int id) {

        boolean result = productdao.DeleteData(id);
        System.out.println(result);
        if (result) {
            return new Gson().toJson(new JsonStatus(true, "Success"));
        } else {
            return new Gson().toJson(new JsonStatus(false, "Fail"));
        }
    }

    @RequestMapping("admin/editproduct/{id}")
    public ModelAndView GetByID(@PathVariable int id) {

        return new ModelAndView("admin/editproduct", "product", productdao.GetDataByID(id));
    }
    
    @RequestMapping(value = "admin/product/submitedit", method = RequestMethod.GET)
    public @ResponseBody
    String SubmitEdit(Product product) {

        int result = productdao.EditData(product);
        System.out.println(result);
        if (result == -1) {

            return new Gson().toJson(new JsonStatus(false, "Db Error"));
        } else if (result == 0) {
            return new Gson().toJson(new JsonStatus(false, "Fail"));
        } else {
            
            return new Gson().toJson(new JsonStatus(true, "Success"));
        }
    }


    @RequestMapping("admin/product/selectbrand")
    public ModelAndView SelectBrand() {

        return new ModelAndView("admin/selectbrand", "brand", new BrandDAO().GetData());
    }
    
    

}
