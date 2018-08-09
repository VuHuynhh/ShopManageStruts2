/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class LogoutAction {

    private final String SUCCESS = "success";

    public LogoutAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        try {
            if (session.get("USER") != null) {
                session.remove("USER");
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("error at log out action" +e.getMessage());
        }
        return SUCCESS;
    }

}
