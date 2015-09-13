/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package m.dekmak;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import static java.time.Instant.now;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.json.JSONArray;
import org.json.JSONObject;
import static org.json.JSONObject.NULL;

/**
 *
 * @author mdekmak
 */
public class Database {

    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
    public static final String MYSQL_URL = "jdbc:mysql://localhost/licenseGenerator?user=licenseGenerator&password=4FSVhrLzR5KrvKH9";

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;

    public Database() throws ClassNotFoundException, SQLException {
        Class.forName(MYSQL_DRIVER);
        connection = DriverManager.getConnection(MYSQL_URL);
    }

    public List<String> getProductsList() {
        List<String> products = new ArrayList<String>();
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("select id, name, \"*action*\" AS action from products");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                List<String> row = new ArrayList<String>();
                row.add(rs.getString("id"));
                row.add(rs.getString("name"));
                row.add(rs.getString("action"));
                products.add(row.toString());
            }
        } catch (Exception e) {
            products.add("Exception message" + e.getMessage());
        }
        return products;
    }

    public String addProduct(String name) {
        String msg = "";
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("INSERT INTO products"
                    + "(name) VALUES"
                    + "(?)");
            preparedStatement.setString(1, name);
            if (preparedStatement.executeUpdate() == 0) {
                msg = "Failed to add product (db problem)";
            } else {
                msg = "success";
            }

        } catch (Exception e) {
            msg = "Exception message: " + e.getMessage();
        }
        return msg;
    }

    public String editProduct(String oldName, String newName) {
        String msg = "";
        try {
            int completeScript = 1;
            statement = connection.createStatement();
            if (!oldName.equals(newName)) {
                preparedStatement = connection.prepareStatement("select name from products where name = ?");
                preparedStatement.setString(1, newName);
                ResultSet rs = preparedStatement.executeQuery();
                String dbName = "";
                while (rs.next()) {
                    dbName = rs.getString("name");
                }
                if (dbName != "") { // new name already exists in DB
                    completeScript = 0;
                }
            }
            if (completeScript == 1) {
                // update new name in table
                statement = connection.createStatement();
                preparedStatement = connection.prepareStatement("update products set name = ? where name = ?");
                preparedStatement.setString(1, newName);
                preparedStatement.setString(2, oldName);
                if (preparedStatement.executeUpdate() == 0) {
                    msg = "Failed to change name (db problem)";
                } else {
                    msg = "success";
                }
            } else {
                msg = "The new name already taken. Please choose another";
            }
        } catch (Exception e) {
            msg = "Exception message: " + e.getMessage();
        }
        return msg;
    }
    
    public List<String> getClientsList() {
        List<String> clients = new ArrayList<String>();
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("select id, name, phone, address, country, \"*action*\" AS action from clients");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                List<String> row = new ArrayList<String>();
                row.add(rs.getString("id"));
                row.add(rs.getString("name"));
                row.add(rs.getString("phone"));
                row.add(rs.getString("address"));
                row.add(rs.getString("country"));
                row.add(rs.getString("action"));
                clients.add(row.toString());
            }
        } catch (Exception e) {
            clients.add("Exception message" + e.getMessage());
        }
        return clients;
    }
    
    public String addClient(JSONObject postData) {
        String msg = "";
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("INSERT INTO clients"
                    + "(name,phone, address, country) VALUES"
                    + "(?,?,?,?)");
            preparedStatement.setString(1, postData.getString("name").replaceAll(",", "&comma&"));
            preparedStatement.setString(2, postData.getString("phone").replaceAll(",", "&comma&"));
            preparedStatement.setString(3, postData.getString("address").replaceAll(",", "&comma&"));
            preparedStatement.setString(4, postData.getString("country").replaceAll(",", "&comma&"));
            if (preparedStatement.executeUpdate() == 0) {
                msg = "Failed to add client (db problem)";
            } else {
                msg = "success";
            }

        } catch (Exception e) {
            msg = "Exception message: " + e.getMessage();
        }
        return msg;
    }
    
    public String editClient(String id, JSONObject postData) {
        String msg = "";
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("update clients set "
                    + "name = ?, phone = ?, address = ?, country = ? Where id = ?");
            preparedStatement.setString(1, postData.getString("name").replaceAll(",", "&comma&"));
            preparedStatement.setString(2, postData.getString("phone").replaceAll(",", "&comma&"));
            preparedStatement.setString(3, postData.getString("address").replaceAll(",", "&comma&"));
            preparedStatement.setString(4, postData.getString("country").replaceAll(",", "&comma&"));
            preparedStatement.setString(5, id);
            if (preparedStatement.executeUpdate() == 0) {
                msg = "Failed to edit client (db problem)";
            } else {
                msg = "success";
            }

        } catch (Exception e) {
            msg = "Exception message: " + e.getMessage();
        }
        return msg;
    }
    
    public List<String> loadClient(String id) {
        List<String> data = new ArrayList<String>();
        try {
            statement = connection.createStatement();
            preparedStatement = connection.prepareStatement("select clients.* from clients where id = ?");
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                List<String> row = new ArrayList<String>();
                row.add(rs.getString("name"));
                row.add(rs.getString("phone"));
                row.add(rs.getString("address"));
                row.add(rs.getString("country"));
                data.add(row.toString());
            }
        } catch (Exception e) {
            data.add("Exception message" + e.getMessage());
        }
        return data;
    }

}
