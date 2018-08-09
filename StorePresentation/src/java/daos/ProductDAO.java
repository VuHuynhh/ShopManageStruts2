/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import connections.DBUtils;
import dtos.ProductDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import utils.FormatDate;

/**
 *
 * @author Dell
 */
public class ProductDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement pStm = null;
    private ResultSet rs = null;

    private void closeConnection() throws Exception {
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

    public List<ProductDTO> getNewProduct() throws Exception {
        List<ProductDTO> result = null;
        try {
            String query = "select p.id, p.name, p.price, i.path "
                    + "from tbl_Product p, tbl_Image i "
                    + "where p.id = i.product_Id and p.remainQuantity > 0 and p.status = 1 "
                    + "and i.status = 1 order by p.creationDate desc offset 0 rows fetch next 3 rows only";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setImgPath(rs.getString("path"));
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDTO> getAllProduct(int page, int rows) throws Exception {
        List<ProductDTO> result = null;
        try {
            int offset = (page - 1) * rows;
            String query = "select p.id, p.name, p.price, p.remainQuantity, p.description, i.path "
                    + "from tbl_Product p, tbl_Image i where p.id = i.product_Id "
                    + "and p.remainQuantity > 0 and p.status = 1 and i.status = 1 order by p.id desc "
                    + "offset ? rows fetch next ? rows only";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, offset);
            pStm.setInt(2, rows);
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setQuantity(rs.getInt("remainQuantity"));
                product.setDescription(rs.getString("description"));
                product.setImgPath(rs.getString("path"));
                result.add(product);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public int getProductCount() throws Exception {
        int count = 0;
        try {
            String sql = "select count(id) from tbl_Product";
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

    public ProductDTO getProductDetail(int id) throws Exception {
        ProductDTO product = null;
        try {
            String query = "select p.id, d.productId, p.name, p.price, p.remainQuantity, p.description ,d.chassis, d.color, d.fork, d.release_Date, d.tire, i.path "
                    + "from tbl_Product p, tbl_ProductDetail d, tbl_Image i "
                    + "where p.productId = d.productId and p.id = i.product_Id and p.id = ? and p.status = 1 and d.status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                product = new ProductDTO();
                product.setId(rs.getString("id"));
                product.setProductId(rs.getString("productId"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setDescription(rs.getString("description"));
                product.setQuantity(rs.getInt("remainQuantity"));
                product.setChassis(rs.getString("chassis"));
                product.setFork(rs.getString("fork"));
                product.setColor(rs.getString("color"));
                product.setReleaseDate(FormatDate.formatDate(rs.getTimestamp("release_Date")));
                product.setTire(rs.getString("tire"));
                product.setImgPath(rs.getString("path"));
            }

        } finally {
            closeConnection();
        }
        return product;
    }

    public int getQuantity(String id) throws Exception {
        int quantity = 0;
        try {
            String query = "select remainQuantity from tbl_Product where id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("remainQuantity");
            }
        } finally {
            closeConnection();
        }
        return quantity;
    }

    public String getImagePath(int id) throws Exception {
        String path = null;
        try {
            String query = "select path from tbl_Image where status = 1 "
                    + "and product_Id in (select productId from tbl_ProductDetail where id = ?)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                path = rs.getString("path");
            }
        } finally {
            closeConnection();
        }
        return path;
    }

    public String getProductName(int id) throws Exception {
        String productName = null;
        try {
            String query = "select name from tbl_Product where id = ? and status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                productName = rs.getString("name");
            }
        } finally {
            closeConnection();
        }
        return productName;
    }

    public int getProductId() throws Exception {
        int id = 0;
        try {
            String query = "select max(id) as id from tbl_Product";
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

    public int getProductDetailId() throws Exception {
        int id = 0;
        try {
            String query = "select max(productId) as productId from tbl_ProductDetail";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (rs.next()) {
                id = rs.getInt("productId");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public int getImageId() throws Exception {
        int id = 0;
        try {
            String query = "select max(id) as id from tbl_Image";
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

    public int insertDetail(int id, String chassis, String tire, String color, String fork, String date, int quantity, int status) throws Exception {
        try {
            String query = "insert into tbl_ProductDetail(productId, chassis, tire, color, fork, release_Date, quantity, status) "
                    + "values(?,?,?,?,?,?,?,?)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            pStm.setString(2, chassis);
            pStm.setString(3, tire);
            pStm.setString(4, color);
            pStm.setString(5, fork);
            pStm.setTimestamp(6, new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime()));
            pStm.setInt(7, quantity);
            pStm.setInt(8, status);
            pStm.executeUpdate();
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean insertProduct(int id, String name, double price, String desc, int quantity, int status, int productId, Timestamp date) throws Exception {
        boolean check = false;
        try {
            String query = "Insert into tbl_Product(id, name, price, description, remainQuantity, status, productId, creationDate) values "
                    + "(?,?,?,?,?,?,?,?)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            pStm.setString(2, name);
            pStm.setDouble(3, price);
            pStm.setString(4, desc);
            pStm.setInt(5, quantity);
            pStm.setInt(6, status);
            pStm.setInt(7, productId);
            pStm.setTimestamp(8, date);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertImagePath(int id, String path, int productId, int status) throws Exception {
        boolean check = false;
        try {
            String query = "Insert into tbl_Image(id, path, product_Id, status) values (?,?,?,?)";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            pStm.setString(2, path);
            pStm.setInt(3, productId);
            pStm.setInt(4, status);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> getManageProduct() throws Exception {
        List<ProductDTO> result = null;
        try {
            String query = "select p.name, d.productId, d.chassis, d.tire, d.color, d.fork, p.description, d.release_Date, i.path "
                    + "from tbl_ProductDetail d, tbl_Product p, tbl_Image i "
                    + "where d.productId = p.productId and p.productId = i.product_Id and d.status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setProductId(rs.getString("productId"));
                dto.setName(rs.getString("name"));
                dto.setChassis(rs.getString("chassis"));
                dto.setTire(rs.getString("tire"));
                dto.setColor(rs.getString("color"));
                dto.setFork(rs.getString("fork"));
                dto.setDescription(rs.getString("description"));
                dto.setReleaseDate(rs.getString("release_Date"));
                dto.setImgPath(rs.getString("path"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean deleteProduct(int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_ProductDetail set status = 0 where productId = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateProductDetail(String chassic, String tire, String color, String fork, String date, int id) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_ProductDetail set chassis = ?, tire = ?, "
                    + "color = ?, fork = ?, release_Date = ? where productId = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, chassic);
            pStm.setString(2, tire);
            pStm.setString(3, color);
            pStm.setString(4, fork);
            pStm.setTimestamp(5, new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime()));
            pStm.setInt(6, id);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public ProductDTO getEditProduct(int id) throws Exception {
        ProductDTO product = null;
        try {
            String query = "select p.productId, p.name, d.chassis, d.tire, d.fork, d.color, d.release_Date "
                    + "from tbl_Product p , tbl_ProductDetail d where d.productId = p.productId and d.productId = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                product = new ProductDTO();
                product.setProductId("productId");
                product.setName(rs.getString("name"));
                product.setChassis(rs.getString("chassis"));
                product.setTire(rs.getString("tire"));
                product.setFork(rs.getString("fork"));
                product.setColor(rs.getString("color"));
                product.setReleaseDate(FormatDate.formatDate(rs.getTimestamp("release_Date")));
            }
        } finally {
            closeConnection();
        }
        return product;
    }

    public String getEditImgPath(int id) throws Exception {
        String path = null;
        try {
            String query = "select path from tbl_Image where product_Id = ? and status = 1";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setInt(1, id);
            rs = pStm.executeQuery();
            if (rs.next()) {
                path = rs.getString("path");
            }
        } finally {
            closeConnection();
        }
        return path;
    }

    public boolean updateImgPath(String path, int productId) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_Image set path = ? where product_Id = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, path);
            pStm.setInt(2, productId);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateProductName(String name, int productId) throws Exception {
        boolean check = false;
        try {
            String query = "update tbl_Product set name = ? where productId = ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, name);
            pStm.setInt(2, productId);
            check = pStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> searchManageProduct(String searchValue) throws Exception {
        List<ProductDTO> result = null;
        try {
            String query = "select p.name, d.productId, d.chassis, d.tire, d.color, d.fork, "
                    + "p.description, d.release_Date, i.path from tbl_ProductDetail d, "
                    + "tbl_Product p, tbl_Image i where d.productId = p.productId and "
                    + "p.productId = i.product_Id and d.status = 1 and p.name like ?";
            conn = DBUtils.getConnection();
            pStm = conn.prepareStatement(query);
            pStm.setString(1, "%" + searchValue + "%");
            rs = pStm.executeQuery();
            if (result == null) {
                result = new ArrayList<>();
            }
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setProductId(rs.getString("productId"));
                dto.setName(rs.getString("name"));
                dto.setChassis(rs.getString("chassis"));
                dto.setTire(rs.getString("tire"));
                dto.setColor(rs.getString("color"));
                dto.setFork(rs.getString("fork"));
                dto.setDescription(rs.getString("description"));
                dto.setReleaseDate(rs.getString("release_Date"));
                dto.setImgPath(rs.getString("path"));
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    

}
