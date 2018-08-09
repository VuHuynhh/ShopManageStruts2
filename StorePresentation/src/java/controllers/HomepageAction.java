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
public class HomepageAction {

    private final String SUCCESS = "success";
    private List<ProductDTO> productList;

    public HomepageAction() {
    }

    public String execute() throws Exception {
        try {
            ProductDAO dao = new ProductDAO();
            productList = dao.getNewProduct();
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at HomepageAction " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<ProductDTO> getProductList() {
        return productList;
    }

    public void setProductList(List<ProductDTO> productList) {
        this.productList = productList;
    }

}
