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
import utils.ImageFolder;

/**
 *
 * @author Dell
 */
public class EditProductAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private int productId;
    private ProductDTO product;
    private String img;
    private String msg;
    private List<String> imageList;

    public EditProductAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (productId > 0) {
                ProductDAO dao = new ProductDAO();
                product = dao.getEditProduct(productId);
                if (product != null) {
                    imageList = ImageFolder.getImages("images/product/");
                    img = dao.getEditImgPath(productId);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at EditProductAction: " + e.getMessage());
        }
        return url;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }

}
