package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExpenseDAO;
import model.Expense;

public class ExpenseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 👉 Page open / refresh / direct URL - Shows expense summary
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession();
        if (session.getAttribute("userName") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ExpenseDAO dao = new ExpenseDAO();
        List<Expense> expenseList = dao.getAllExpenses();

        request.setAttribute("expenseList", expenseList);
        request.getRequestDispatcher("viewSummary.jsp")
               .forward(request, response);
    }

    // 👉 Form submit - Add new expense
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession();
        if (session.getAttribute("userName") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            double amount = Double.parseDouble(request.getParameter("amount"));
            String paidBy = request.getParameter("paidBy");
            int participants = Integer.parseInt(request.getParameter("participants"));
            String tripName = request.getParameter("tripName");
            String description = request.getParameter("description");
            String participantsList = request.getParameter("participantsList");
            String category = request.getParameter("category");

            if (participants <= 0) {
                session.setAttribute("error", "Number of participants must be greater than 0");
                response.sendRedirect("addExpense.jsp");
                return;
            }

            double share = amount / participants;

            Expense expense = new Expense();
            expense.setAmount(amount);
            expense.setPaidBy(paidBy);
            expense.setParticipants(participants);
            expense.setShare(share);
            expense.setTripName(tripName != null && !tripName.trim().isEmpty() ? tripName.trim() : "General Expenses");
            expense.setDescription(description != null ? description.trim() : "");
            expense.setParticipantsList(participantsList != null ? participantsList.trim() : "");
            expense.setCategory(category != null && !category.trim().isEmpty() ? category.trim() : "General");

            ExpenseDAO dao = new ExpenseDAO();
            boolean success = dao.addExpense(expense);

            if (success) {
                session.setAttribute("success", "Expense added successfully!");
                // Redirect to view summary after adding
                response.sendRedirect("addExpense");
            } else {
                session.setAttribute("error", "Failed to add expense. Please try again.");
                response.sendRedirect("addExpense.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Error: " + e.getMessage());
            response.sendRedirect("addExpense.jsp");
        }
    }
}
