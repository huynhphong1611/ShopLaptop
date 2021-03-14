package com.spring.controller.client;

import com.google.gson.Gson;
import com.spring.dao.ProductDAO;
import com.spring.entity.CartItem;
import com.spring.entity.JsonStatus;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView Cart(HttpSession session) {

        return new ModelAndView("client/cart");
    }

    @RequestMapping(value = "cart/addtocart", method = RequestMethod.GET)
    public @ResponseBody
    String AddToCart(HttpSession session, int prodid, int quantity) {
        try {
            ProductDAO db = new ProductDAO();
            if (quantity <= 0) {
                return new Gson().toJson(new JsonStatus(false, "Quantity cannot be 0 or lower"));
            }
            if (session.getAttribute("cartlist") == null) {
                List<CartItem> cart = new ArrayList<>();
                cart.add(new CartItem(db.GetDataByID(prodid), quantity));
                session.setAttribute("cartlist", cart);

                return new Gson().toJson(new JsonStatus(true, "Add moi"));
            } else {
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cartlist");
                int index = IsExist(session, prodid);
                if (index == -1) {
                    cart.add(new CartItem(db.GetDataByID(prodid), quantity));

                    return new Gson().toJson(new JsonStatus(true, "Add moi"));
                } else {
                    cart.get(index).quantity += quantity;

                    return new Gson().toJson(new JsonStatus(true, "Add them"));
                }
            }
        } catch (Exception e) {
            return new Gson().toJson(new JsonStatus(false, e.getMessage()));
        }
        //return list;
    }
	
	@RequestMapping(value = "cart/deletefromcart", method = RequestMethod.GET)
	public @ResponseBody
	ModelAndView DeleteFromCart(HttpSession, int prodid){
		try{
			List<CartItem> cart = (List<CartItem>) session.getAttribute("cartlist");
			for (int i = 0; i < cart.size(); i++){
				if(cart.get(i).product.getProductID() == prodid){
					cart.remove(i);
					return new ModelAndView("client/cart")
				}
			}
			return new ModelAndView("client/cart")
		}
		catch (Exception e){
			return new ModelAndView("client/cart")
		}
	}
	
	

    private int IsExist(HttpSession session, int id) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cartlist");
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).product.getProductID() == id) {
                return i;
            }
        }
        return -1;
    }
}

