/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import utils.ImageFolder;

/**
 *
 * @author Dell
 */
public class ViewImageAction {
    private static final String SUCCESS = "success";
    private List<String> imageList;
    
    public ViewImageAction() {
    }
    
    public String execute() throws Exception {
        try {
            imageList = ImageFolder.getImages("images/product/");
            ServletActionContext.getServletContext().log("Imggg: " + imageList.size());
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at ViewImageAction: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<String> getImageList() {
        return imageList;
    }

    public void setImageList(List<String> imageList) {
        this.imageList = imageList;
    }
    
    
    
}
