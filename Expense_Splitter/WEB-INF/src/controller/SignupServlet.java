package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (name == null || name.trim().isEmpty() || 
            email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        UserDao userDao = new UserDao();
        
        // Check if email already exists
        if (userDao.emailExists(email)) {
            request.setAttribute("error", "Email already exists! Please use a different email or login.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        User user = new User(name.trim(), email.trim(), password);
        boolean result = userDao.registerUser(user);

        if (result) {
            request.setAttribute("success", "Registration successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed! Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}

