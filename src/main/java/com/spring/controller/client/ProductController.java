package com.spring.controller.client;

import com.google.gson.Gson;
import com.spring.dao.ProductDAO;
import com.spring.entity.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "ClientProductController")
public class ProductController {

    @Autowired
    private ProductDAO productdao;
    
    @RequestMapping(value = {"shop", "shop/{page}"}, method = RequestMethod.GET)
    public ModelAndView Shop(@PathVariable(required = false, name = "page") String page, HttpServletRequest req, HttpServletResponse res) {
        int pageSize = 6;

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
    
    @RequestMapping(value = "/searchresult/{searchTerm}", method = RequestMethod.GET)
    public ModelAndView Search(@PathVariable("searchTerm") String pSearchTerm) {
        ModelAndView mv = new ModelAndView("client/searchresult");

        mv.addObject("searchTerm", pSearchTerm);
        mv.addObject("searchResult", productdao.GetProdByName(pSearchTerm));
        return mv;
    }
}
