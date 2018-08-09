/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import dtos.ProductDTO;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class SearchProductAction {
    private static final String SUCCESS = "success";
    private List<ProductDTO> list;
    private String searchValue;
    
    public SearchProductAction() {
    }
    
    public String execute() throws Exception {
        try {
            UserDAO dao = new UserDAO();
            list = dao.searchByName(searchValue);
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at SearchProductController: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<ProductDTO> getList() {
        return list;
    }

    public void setList(List<ProductDTO> list) {
        this.list = list;
    }
    
    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }
    
    
    
}
