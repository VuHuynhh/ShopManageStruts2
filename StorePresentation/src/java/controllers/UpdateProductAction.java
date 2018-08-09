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
public class UpdateProductAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private int productId;
    private String productName, chassis, tire, fork, date, color, image, msg;

    public UpdateProductAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
                ProductDAO dao = new ProductDAO();
                boolean check = dao.updateProductDetail(chassis, tire, color, fork, date, productId);
                if (check) {
                    boolean checkImg = dao.updateImgPath(image, productId);
                    if (checkImg) {
                        boolean checkName = dao.updateProductName(productName, productId);
                        if (checkName) {
                            setMsg("Update success");
                            url = SUCCESS;
                        }
                    }
                }
            return url;
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at UpdateProductAction: " + e.getMessage());
        }
        return url;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getChassis() {
        return chassis;
    }

    public void setChassis(String chassis) {
        this.chassis = chassis;
    }

    public String getTire() {
        return tire;
    }

    public void setTire(String tire) {
        this.tire = tire;
    }

    public String getFork() {
        return fork;
    }

    public void setFork(String fork) {
        this.fork = fork;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
