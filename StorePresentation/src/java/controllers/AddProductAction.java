/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.ProductDAO;
import java.sql.Timestamp;
import java.util.Date;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class AddProductAction {
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String productName, chassis, tire, fork, color, date, desc, image;
    private int quantity;
    private double price;
    private String msg;
    private Timestamp creationDate;

    public AddProductAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        try {
            ProductDAO dao = new ProductDAO();
            int productId = dao.insertDetail((dao.getProductDetailId() + 1) , chassis, tire, color, fork, date, quantity, 1);
            if (productId > 0) {
                setCreationDate(new Timestamp(new Date().getTime()));
                boolean checkPro = dao.insertProduct(dao.getProductId() + 1, productName, price, desc, quantity, 1, productId, getCreationDate());
                if (checkPro) {
                    dao.insertImagePath(dao.getImageId() + 1, image, productId, 1);
                    setMsg("Add new product successful");
                    url = SUCCESS;
                }
            }
            
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at AddProductAction: " + e.getMessage());
            setMsg("There is something wrong, please try again");
        }
        return url;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }
    
    
    
}
