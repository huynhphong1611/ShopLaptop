package com.spring.controller.admin;

import com.spring.dao.OrderDAO;
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
            m.addAttribute("soluongsucces", String.valueOf(a.get(0)));
            m.addAttribute("total", String.valueOf(a.get(1)));
            m.addAttribute("soluongfail", String.valueOf(new OrderDAO().OrderUnSucces(thang,nam)));
            m.addAttribute("soluong", String.valueOf(new OrderDAO().OrderInMonth(thang,nam)));
            }
            return "/admin/report";
        }
}
