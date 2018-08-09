/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import daos.OrderDAO;
import dtos.Cart;
import dtos.UserDTO;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class CheckOutAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private final String LOGIN = "login";
    private int orderId;
    private Timestamp date;
    private Cart cart;
    private double total;

    public CheckOutAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            Map session = ActionContext.getContext().getSession();
            cart = (Cart) session.get("CART");
            UserDTO user = (UserDTO) session.get("USER");
            if (user == null) {
                ServletActionContext.getRequest().setAttribute("requireLogin", "Please login to check out");
                url = LOGIN;
            } else if (cart != null && cart.getItems().size() > 0) {
                OrderDAO dao = new OrderDAO();
                int id = dao.getOrderId() + 1;
                setDate(new Timestamp(new Date().getTime()));
                total = cart.getTotal();
                orderId = dao.insertOrder(id, user.getId(), getDate(), total);
                if (orderId > -1) {
                    int orderDetailId = dao.getOrderDetailId() + 1;
                    boolean check = dao.insertOrderDetail(orderDetailId, orderId, cart,1);
                    if (check) {
                        dao.updateQuantity(cart);
                        setCart(cart);
                        session.remove("CART");
                        return SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at CheckOutAction: " + e.getMessage());
        }
        return url;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }


}
