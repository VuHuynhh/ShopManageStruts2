/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.ProductDAO;
import dtos.ProductDTO;
import java.util.List;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class ManageProductAction {
    private static final String SUCCESS = "success";
    private List<ProductDTO> listManage;
    
    public ManageProductAction() {
    }
    
    public String execute() throws Exception {
        try {
            ProductDAO dao = new ProductDAO();
            listManage = dao.getManageProduct();
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ManageProductAction: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<ProductDTO> getListManage() {
        return listManage;
    }

    public void setListManage(List<ProductDTO> listManage) {
        this.listManage = listManage;
    }   
    
    
}
