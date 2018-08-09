/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.ProductDAO;
import dtos.ProductDTO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class ViewProductAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private int id;
    private ProductDTO product;

    public ViewProductAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (id > 0) {
                ProductDAO productDAO = new ProductDAO();
                product = productDAO.getProductDetail(id);
                if (product != null) {
                    return SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ViewProductAction " + e.getMessage());
        }
        return url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

}
