/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Dell
 */
public class DBUtils implements Serializable {
    public static Connection getConnection() throws Exception {
        Connection connection = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=StoreDB", "sa", "123456");
        return connection;
    }
    
}
