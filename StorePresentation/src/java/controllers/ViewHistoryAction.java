/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import daos.UserDAO;
import dtos.OrderDTO;
import dtos.UserDTO;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class ViewHistoryAction {

    private static final String SUCCESS = "success";
    private List<OrderDTO> listOrder;

    public ViewHistoryAction() {
    }

    public String execute() throws Exception {
        try {
            UserDAO dao = new UserDAO();
            Map session = ActionContext.getContext().getSession();
            if (session != null) {
                UserDTO user = (UserDTO) session.get("USER");
                if (user != null) {
                    listOrder = dao.getHistoryOrder(user.getId());
                    if (listOrder.isEmpty()) {
                        ServletActionContext.getServletContext().setAttribute("ERROR", "You did't buy anthing before");
                    }
                }
            }

        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ViewHistoryAction: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<OrderDTO> getListOrder() {
        return listOrder;
    }

    public void setListOrder(List<OrderDTO> listOrder) {
        this.listOrder = listOrder;
    }

}
