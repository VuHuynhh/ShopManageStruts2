/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class RestoreUserAction {
    private int id;
    private int page;
    
    public RestoreUserAction() {
    }
    
    public String execute() throws Exception {
        try {
            UserDAO dao = new UserDAO();
            boolean check = dao.restoreUser(id);
            if (!check) {
                ServletActionContext.getServletContext().setAttribute("ERROR", "Restore user fail please try again");
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at RestoreUserAction: " + e.getMessage());
        }
        return "success";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
    
    
}
