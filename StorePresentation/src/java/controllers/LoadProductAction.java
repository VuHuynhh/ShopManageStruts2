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
public class LoadProductAction {

    private final String SUCCESS = "success";
    List<ProductDTO> list;
    private int page;
    private int rows;
    private int total;

    public LoadProductAction() {
    }

    public String execute() throws Exception {
        try {
            if (page > 0) {
                ProductDAO productDAO = new ProductDAO();
                setRows(9);
                total = productDAO.getProductCount();
                list = productDAO.getAllProduct(page, rows);
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at LoadProduct action: " + e.getMessage());
        }
        return SUCCESS;
    }

    public List<ProductDTO> getList() {
        return list;
    }

    public void setList(List<ProductDTO> list) {
        this.list = list;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

}
