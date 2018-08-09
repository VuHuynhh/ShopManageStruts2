/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import connections.DBUtils;
import dtos.Cart;
import dtos.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 *
 * @author Dell
 */
public class OrderDAO {

    private Connection conn;
    private PreparedStatement pStm;
    private ResultSet rs;

    public void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pStm != null) {
            pStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public int getOrderId() throws Exception {
        int id = 0;
        try {
            String query = "select max(id) as id from tbl_Order";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public int getOrderDetailId() throws Exception {
        int id = 0;
        try {
            String query = "Select max(id) as id from tbl_OrderDetail";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }
    
    public int insertOrder(int id, int userId, Timestamp date, double price) throws Exception {
        try {
            String query = "Insert into tbl_Order values (?,?,?,?,1)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            pStm.setInt(2, userId);
            pStm.setTimestamp(3, date);
            pStm.setDouble(4, price);
            pStm.executeUpdate();       
        } finally {
            closeConnection();
        }
        return id;
        
    }
    
    public boolean insertOrderDetail(int id, int orderId, Cart cart, int status) throws Exception {
        boolean check = false;
        int successRow = 0;
        int i = 1;
        try {
            String query = "Insert into tbl_OrderDetail(id ,order_Id ,product_Id ,quantity ,total,status) values (?,?,?,?,?,?)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            for (ProductDTO dto : cart.getItems().keySet()) {
                ++i;
                pStm.setInt(1, id + i);
                pStm.setInt(2, orderId);
                pStm.setString(3, dto.getId());
                pStm.setInt(4, cart.getItems().get(dto));
                pStm.setDouble(5, dto.getPrice());
                pStm.setInt(6, status);
                successRow += pStm.executeUpdate();
            }
            if(successRow == cart.getItems().size()) check = true;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public void updateQuantity(Cart cart) throws Exception {
        try {
            String query = "update tbl_Product set remainQuantity = ? where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            for (ProductDTO dto : cart.getItems().keySet()) {
                pStm.setInt(1, dto.getQuantity() -  cart.getItems().get(dto));
                pStm.setString(2, dto.getId());
                pStm.executeUpdate();
            }
        } finally {
            closeConnection();
        }
    }
    
}
