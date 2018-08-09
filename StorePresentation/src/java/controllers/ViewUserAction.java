/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import dtos.UserDTO;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class ViewUserAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private List<UserDTO> list;
    private int rows;
    private int page;
    private int total;

    public ViewUserAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (page > 0) {
                UserDAO dao = new UserDAO();
                setRows(5);
                total = dao.getUserCount();
                list = dao.getAllUser(page, rows);
                if (list != null) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ViewUserAction: " + e.getMessage());
        }
        return url;
    }

    public List<UserDTO> getList() {
        return list;
    }

    public void setList(List<UserDTO> list) {
        this.list = list;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

}
