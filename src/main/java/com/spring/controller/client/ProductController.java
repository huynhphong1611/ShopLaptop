package com.spring.controller.client;

import com.google.gson.Gson;
import com.spring.dao.ProductDAO;
import com.spring.entity.Product;
import java.util.ArrayList;
import java.util.List;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "ClientProductController")
public class ProductController {

    @Autowired
    private ProductDAO productdao;
    
    @RequestMapping(value = {"shop", "shop/{page}"}, method = RequestMethod.GET)
    public ModelAndView Shop(@PathVariable(required = false, name = "page") String page, HttpServletRequest req, HttpServletResponse res) {
        int pageSize = 8;

        ModelAndView mv = new ModelAndView("client/shop");
        PagedListHolder<Product> productlist;
        if (page == null) {
            productlist = new PagedListHolder<>();
            List<Product> productList = productdao.GetData();
            productlist.setSource(productList);
            productlist.setPageSize(pageSize);
            req.getSession().setAttribute("productlist", productlist);
        } else {
            int pageNum = Integer.parseInt(page);
            productlist = (PagedListHolder<Product>) req.getSession().getAttribute("productlist");
            productlist.setPage(pageNum - 1);
        }

        return mv;
    }

    @RequestMapping(value = "shop/productdata", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public @ResponseBody
    String ProductData() {
        return new Gson().toJson(productdao.GetData());
    }

    @RequestMapping(value = "product/{url}/{id}", method = RequestMethod.GET)
    public ModelAndView Detail(@PathVariable(name = "url") String url, @PathVariable(name = "id") int id) {

        return new ModelAndView("client/productdetail", "product", productdao.GetDataByID(id));
    }
    
    @RequestMapping("/shop/searchresult")
    public ModelAndView search(@RequestParam("search") String search, HttpServletRequest req, HttpServletResponse res) {
        ///int pageSize = 6;
        ModelAndView mv = new ModelAndView("client/searchresult");
        PagedListHolder<Product> productlist;
        productlist = new PagedListHolder<>();
        List<Product> productList = productdao.GetProdByName(search);
        productlist.setSource(productList);
        productlist.setPageSize(productList.size());
        req.getSession().setAttribute("productlist", productlist);
        return mv;
    }
    
//    @RequestMapping("/shop/searchresult")    
//        public String search(Model m, @RequestParam("search") String search){
//            List<Product> productlist = productdao.GetProdByName(search);
//            m.addAttribute("productlist", search);  
//            return "/client/searchresult";
//        }
    @RequestMapping("/shop/hello")    
        public String editnhanvien(Model m, @RequestParam("search") String search){
            m.addAttribute("search", search);  
            return "/client/hello";
        }
}
