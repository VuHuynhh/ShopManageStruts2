/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import daos.ProductDAO;
import dtos.Cart;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class UpdateCartAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String id;
    private int quantity;
    private String msg;

    public UpdateCartAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            Map session = ActionContext.getContext().getSession();
            Cart cart = (Cart) session.get("CART");
            if (cart == null) {
                cart = new Cart();
            }
            ProductDAO dao = new ProductDAO();
            int requan = dao.getQuantity(id);
            if (id != null) {
                if (quantity > requan) {
                    setMsg("Only " + requan + " bike(s) about this product in store, please try again !");
                } else {
                cart.updateItemFromCart(id, quantity);
                return SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at UpdateCartController " + e.getMessage());
        }
        return url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
    

}
