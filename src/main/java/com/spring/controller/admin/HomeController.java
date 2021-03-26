package com.spring.controller.admin;

import com.spring.dao.OrderDAO;
import com.spring.dao.ProductDAO;
import com.spring.entity.Product;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
    
    OrderDAO orderDAO;

    @RequestMapping(value = "/admin/home", method = RequestMethod.GET)
    public ModelAndView home() {
        return new ModelAndView("admin/home");
    }
    @RequestMapping("/admin/report")    
        public String report(Model m, @RequestParam("thang") int thang, @RequestParam("nam") int nam){
            if (String.valueOf(nam) == "" || String.valueOf(thang) == ""){
                m.addAttribute("thang", 3);
                m.addAttribute("nam", 2021);
                List<Integer> a = new OrderDAO().OrderSucces(3,2021);
                List<Product> b = new ArrayList<Product>();
                List<Integer> top3product = new ProductDAO().Top3ProductOfMonth(3,2021);
                List qualityTop3Product = new ArrayList<Integer>();
                for (int i = 1;i < top3product.size(); i += 2){
                    qualityTop3Product.add(top3product.get(i));
                    b.add(new ProductDAO().GetDataByID(top3product.get(i - 1)));
                }
                m.addAttribute("orderlist", b);
                m.addAttribute("qualityProduct", qualityTop3Product);
                m.addAttribute("soluongsucces", String.valueOf(a.get(0)));
                m.addAttribute("total", String.valueOf(a.get(1)));
                m.addAttribute("soluongfail", String.valueOf(new OrderDAO().OrderUnSucces(3,2021)));
                m.addAttribute("soluong", String.valueOf(new OrderDAO().OrderInMonth(3,2021)));
                return "/admin/report";
            }
            else{
            m.addAttribute("thang", thang);
            m.addAttribute("nam", nam);
            List<Integer> a = new OrderDAO().OrderSucces(thang,nam);
            List<Product> b = new ArrayList<Product>();
            List<Integer> top3product = new ProductDAO().Top3ProductOfMonth(3,2021);
            List qualityTop3Product = new ArrayList<Integer>();
            for (int i = 1;i < top3product.size(); i += 2){
                qualityTop3Product.add(top3product.get(i));
                b.add(new ProductDAO().GetDataByID(top3product.get(i - 1)));
            }
            m.addAttribute("orderlist", b);
            m.addAttribute("qualityProduct", qualityTop3Product);
            m.addAttribute("soluongsucces", String.valueOf(a.get(0)));
            m.addAttribute("total", String.valueOf(a.get(1)));
            m.addAttribute("soluongfail", String.valueOf(new OrderDAO().OrderUnSucces(thang,nam)));
            m.addAttribute("soluong", String.valueOf(new OrderDAO().OrderInMonth(thang,nam)));
            }
            return "/admin/report";
        }
}
