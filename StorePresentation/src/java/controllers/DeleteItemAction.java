/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import dtos.Cart;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class DeleteItemAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String id;

    public DeleteItemAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            Map session = ActionContext.getContext().getSession();
            Cart cart = (Cart) session.get("CART");
            if (cart != null) {
                cart.deleteItemFromCart(id);
                session.put("CART", cart);
            }
            return SUCCESS;
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at DeleteItemAction " + e.getMessage());
        }
        return url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
