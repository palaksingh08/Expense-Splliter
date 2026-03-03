package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import model.Expense;

public class ExpenseDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/expense_splitter";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1234";

    private static final String INSERT_EXPENSE_SQL =
        "INSERT INTO expenses (amount, paid_by, participants, share, trip_name, description, participants_list, category, expense_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_ALL_EXPENSES =
        "SELECT * FROM expenses ORDER BY expense_date DESC, created_at DESC";

    // DB connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // INSERT expense
    public boolean addExpense(Expense expense) {
        boolean result = false;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_EXPENSE_SQL)) {

            ps.setDouble(1, expense.getAmount());
            ps.setString(2, expense.getPaidBy());
            ps.setInt(3, expense.getParticipants());
            ps.setDouble(4, expense.getShare());
            ps.setString(5, expense.getTripName() != null ? expense.getTripName() : "General Expenses");
            ps.setString(6, expense.getDescription() != null ? expense.getDescription() : "");
            ps.setString(7, expense.getParticipantsList() != null ? expense.getParticipantsList() : "");
            ps.setString(8, expense.getCategory() != null ? expense.getCategory() : "General");
            
            if (expense.getExpenseDate() != null) {
                ps.setDate(9, new Date(expense.getExpenseDate().getTime()));
            } else {
                ps.setDate(9, new Date(System.currentTimeMillis()));
            }

            result = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // FETCH all expenses
    public List<Expense> getAllExpenses() {

        List<Expense> expenses = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EXPENSES);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Expense e = new Expense();
                e.setId(rs.getInt("id"));
                e.setAmount(rs.getDouble("amount"));
                e.setPaidBy(rs.getString("paid_by"));
                e.setParticipants(rs.getInt("participants"));
                e.setShare(rs.getDouble("share"));
                
                // New fields
                if (rs.getString("trip_name") != null) {
                    e.setTripName(rs.getString("trip_name"));
                }
                if (rs.getString("description") != null) {
                    e.setDescription(rs.getString("description"));
                }
                if (rs.getString("participants_list") != null) {
                    e.setParticipantsList(rs.getString("participants_list"));
                }
                if (rs.getString("category") != null) {
                    e.setCategory(rs.getString("category"));
                }
                if (rs.getDate("expense_date") != null) {
                    e.setExpenseDate(new java.util.Date(rs.getDate("expense_date").getTime()));
                }

                expenses.add(e);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return expenses;
    }
}
