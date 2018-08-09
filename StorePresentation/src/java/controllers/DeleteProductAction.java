/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.ProductDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class DeleteProductAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private int productId;
    private String msg;

    public DeleteProductAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            ProductDAO dao = new ProductDAO();
            boolean check = dao.deleteProduct(productId);
            if (check) {
                setMsg("Remove product success");
                url = SUCCESS;
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at DeleteProductAction: " + e.getMessage());
            setMsg("Remove fail");
        }
        return url;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
