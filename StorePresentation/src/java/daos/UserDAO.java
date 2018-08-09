/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import connections.DBUtils;
import dtos.OrderDTO;
import dtos.ProductDTO;
import dtos.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class UserDAO implements Serializable {

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

    public UserDTO checkLogin(String email, String password) throws Exception {
        UserDTO user = null;
        try {
            String query = "SELECT id, email, first_Name, last_Name, phone, role_Id "
                    + "FROM tbl_User WHERE email = ? and password = ? and status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, email);
            pStm.setString(2, password);
            rs = pStm.executeQuery();
            while (rs.next()) {
                user = new UserDTO(rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("first_Name"),
                        rs.getString("last_Name"),
                        rs.getString("phone"),
                        rs.getInt("role_Id"));
            }

        } finally {
            closeConnection();
        }
        return user;
    }

    public int getUserId() throws Exception {
        int result = 0;
        try {
            String query = "SELECT max(id) as id FROM tbl_User";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("id");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean createAccount(UserDTO user) throws Exception {
        boolean check = false;
        try {
            String query = "insert into tbl_User(id, email, password, first_Name, last_Name, phone, status, role_Id) "
                    + "values (?,?,?,?,?,?,1,2)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, user.getId());
            pStm.setString(2, user.getEmail());
            pStm.setString(3, user.getPassword());
            pStm.setString(4, user.getFirstName());
            pStm.setString(5, user.getLastName());
            pStm.setString(6, user.getPhone());
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateUserProfile(String firstName, String lastName, String phone, int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_User set first_Name = ?, last_Name = ?, phone = ? where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, firstName);
            pStm.setString(2, lastName);
            pStm.setString(3, phone);
            pStm.setInt(4, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getPassword(int userId) throws Exception {
        String password = null;
        try {
            String query = "select password from tbl_User where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, userId);
            rs = pStm.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
        } finally {
            closeConnection();
        }
        return password;
    }

    public boolean updatePassword(String newPassword, int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_User set password = ? where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, newPassword);
            pStm.setInt(2, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<UserDTO> getAllUser() throws Exception {
        List<UserDTO> result = null;
        try {
            String query = "select id, email, first_Name, last_Name, "
                    + "phone, status from tbl_User where role_Id = 2 order by id";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFirstName(rs.getString("first_Name"));
                user.setLastName(rs.getString("last_Name"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getInt("status"));
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<UserDTO> getAllUser(int page, int rows) throws Exception {
        List<UserDTO> result = null;
        try {
            int offset = (page - 1) * rows;
            String query = "select id,email,first_Name,last_Name,phone,status "
                    + "from tbl_User where role_Id = 2 order by id offset ? rows fetch next ? rows only";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, offset);
            pStm.setInt(2, rows);
            rs = pStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setFirstName(rs.getString("first_Name"));
                user.setLastName(rs.getString("last_Name"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getInt("status"));
                result.add(user);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean banUser(int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_User set status = 0 where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean restoreUser(int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_User set status = 1 where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<OrderDTO> getHistoryOrder(int id) throws Exception {
        List<OrderDTO> result = null;
        try {
            String query = "select d.id, o.creation_Date, o.total_Price, d.quantity, p.name "
                    + "from tbl_Order o, tbl_OrderDetail d, tbl_Product p "
                    + "where o.id = d.order_Id and d.product_Id = p.id and o.user_Id = ? and d.status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setId(rs.getInt("id"));
                order.setDate(rs.getString("creation_Date"));
                order.setPrice(rs.getDouble("total_Price"));
                order.setQuantity(rs.getInt("quantity"));
                order.setName(rs.getString("name"));
                result.add(order);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> searchByName(String searchValue) throws Exception {
        List<ProductDTO> result = null;
        try {
            String query = "select p.id, p.name, p.price, i.path from tbl_Product p, "
                    + "tbl_Image i where p.id = i.product_Id and p.remainQuantity > 0 "
                    + "and p.status = 1 and i.status = 1 and p.name like ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, "%" + searchValue + "%");
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setPrice(rs.getDouble("price"));
                dto.setImgPath(rs.getString("path"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getUserCount() throws Exception {
        int count = 0;
        try {
            String sql = "select count(id) from tbl_User";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(sql);
            rs = pStm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return count;
    }

}
