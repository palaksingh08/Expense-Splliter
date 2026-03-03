package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/expense_splitter";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_USER_SQL = 
        "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
    
    private static final String SELECT_USER_BY_EMAIL = 
        "SELECT * FROM users WHERE email = ? AND password = ?";
    
    private static final String CHECK_EMAIL_EXISTS = 
        "SELECT id FROM users WHERE email = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean registerUser(User user) {
        Connection connection = null;
        try {
            connection = getConnection();
            if (connection == null) {
                System.err.println("Database connection failed!");
                return false;
            }
            
            // First check if email already exists
            if (emailExists(user.getEmail())) {
                return false; // Email already exists
            }
            
            try (PreparedStatement ps = connection.prepareStatement(INSERT_USER_SQL)) {
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (Exception e) {
            System.err.println("Error registering user: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    // Check if email already exists
    public boolean emailExists(String email) {
        Connection connection = null;
        try {
            connection = getConnection();
            if (connection == null) {
                System.err.println("Database connection is null!");
                return false; // If connection fails, allow registration attempt
            }
            
            try (PreparedStatement ps = connection.prepareStatement(CHECK_EMAIL_EXISTS)) {
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                return rs.next(); // Returns true if email exists
            }
        } catch (Exception e) {
            System.err.println("Error checking email: " + e.getMessage());
            e.printStackTrace();
            return false; // Return false on error to allow registration attempt
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public User loginUser(String email, String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
