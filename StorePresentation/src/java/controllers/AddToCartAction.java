/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import daos.ProductDAO;
import dtos.Cart;
import dtos.ProductDTO;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class AddToCartAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    int id;

    public AddToCartAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            Map session = ActionContext.getContext().getSession();
            Cart cart = (Cart) session.get("CART");
            if (cart == null) {
                cart = new Cart();
            }
            ProductDAO productDAO = new ProductDAO();
            ProductDTO product = productDAO.getProductDetail(id);
            cart.addItemToCart(product);
            session.put("CART", cart);
            url = SUCCESS;
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at AddToCartAction: " + e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
