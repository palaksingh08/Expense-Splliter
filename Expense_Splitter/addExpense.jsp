<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Expense | Expense Splitter</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        padding-bottom: 3rem;
    }
    .navbar {
        background: rgba(255,255,255,0.15) !important;
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 30px rgba(0,0,0,0.1);
        border-bottom: 1px solid rgba(255,255,255,0.2);
    }
    .navbar-brand { font-weight: 700; }
    .btn-outline-light:hover { background: rgba(255,255,255,0.25); color: white; }
    .form-card {
        background: rgba(255,255,255,0.98);
        backdrop-filter: blur(10px);
        border-radius: 24px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.3);
        padding: 2.5rem;
        max-width: 560px;
        margin: 0 auto;
    }
    .form-card .card-header-custom {
        text-align: center;
        margin-bottom: 2rem;
        padding-bottom: 1.5rem;
        border-bottom: 2px solid #f0f0f0;
    }
    .form-card .card-header-custom .icon-wrap {
        width: 70px;
        height: 70px;
        margin: 0 auto 1rem;
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-radius: 18px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        color: white;
    }
    .form-card .card-header-custom h2 {
        font-weight: 700;
        color: #333;
        font-size: 1.6rem;
    }
    .form-label {
        font-weight: 500;
        color: #444;
        margin-bottom: 0.4rem;
    }
    .form-control, .form-select {
        border: 2px solid #e8e8e8;
        border-radius: 12px;
        padding: 0.7rem 1rem;
        transition: all 0.3s ease;
    }
    .form-control:focus, .form-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15);
    }
    textarea.form-control { min-height: 80px; resize: vertical; }
    .btn-submit {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border: none;
        border-radius: 12px;
        padding: 0.9rem;
        font-weight: 600;
        font-size: 1.05rem;
        color: white;
        width: 100%;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    }
    .btn-submit:hover {
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.5);
    }
    .btn-back {
        border: 2px solid #ddd;
        border-radius: 12px;
        padding: 0.7rem;
        font-weight: 500;
        width: 100%;
        margin-top: 1rem;
        transition: all 0.3s ease;
        color: #555;
    }
    .btn-back:hover {
        border-color: #667eea;
        color: #667eea;
        background: rgba(102, 126, 234, 0.08);
    }
    .alert { border-radius: 12px; border: none; }
</style>
</head>

<body>

<nav class="navbar navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1">
            <i class="fas fa-wallet me-2"></i> Expense Splitter
        </span>
        <a href="index.jsp" class="btn btn-outline-light btn-sm">
            <i class="fas fa-home me-1"></i> Home
        </a>
    </div>
</nav>

<div class="container mt-4">
    <div class="form-card">
        <div class="card-header-custom">
            <div class="icon-wrap">
                <i class="fas fa-plus-circle"></i>
            </div>
            <h2>Add Expense</h2>
            <p class="text-muted mb-0 small">Trip, food, travel — split easily</p>
        </div>

        <%
            String success = (String) session.getAttribute("success");
            String error = (String) session.getAttribute("error");
            if (success != null) {
                session.removeAttribute("success");
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i><%= success %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
            }
            if (error != null) {
                session.removeAttribute("error");
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i><%= error %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
            }
        %>

        <form action="addExpense" method="post">
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-plane me-2 text-primary"></i>Trip / Event Name</label>
                <input type="text" name="tripName" class="form-control"
                       placeholder="e.g., Goa Trip, Birthday Party, Office Lunch"
                       value="General Expenses">
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-tag me-2 text-primary"></i>Category</label>
                <select name="category" class="form-select" required>
                    <option value="Food">🍕 Food</option>
                    <option value="Travel">✈️ Travel</option>
                    <option value="Hotel">🏨 Hotel</option>
                    <option value="Shopping">🛍️ Shopping</option>
                    <option value="Entertainment">🎬 Entertainment</option>
                    <option value="Transport">🚗 Transport</option>
                    <option value="General">📋 General</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-file-alt me-2 text-primary"></i>Description</label>
                <textarea name="description" class="form-control" rows="2"
                          placeholder="e.g., Dinner at restaurant, Taxi fare..."></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-rupee-sign me-2 text-primary"></i>Amount (₹)</label>
                <input type="number" name="amount" class="form-control"
                       placeholder="Enter amount" step="0.01" min="0.01" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-user me-2 text-primary"></i>Paid By</label>
                <input type="text" name="paidBy" class="form-control"
                       placeholder="Name of person who paid" required>
            </div>
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-users me-2 text-primary"></i>Participants (comma-separated)</label>
                <input type="text" name="participantsList" class="form-control"
                       placeholder="John, Jane, Bob">
                <small class="form-text text-muted">Optional</small>
            </div>
            <div class="mb-4">
                <label class="form-label"><i class="fas fa-user-friends me-2 text-primary"></i>Number of Participants</label>
                <input type="number" name="participants" class="form-control"
                       placeholder="How many to split?" min="1" required>
            </div>
            <button type="submit" class="btn btn-submit">
                <i class="fas fa-save me-2"></i> Add Expense
            </button>
            <a href="index.jsp" class="btn btn-back">
                <i class="fas fa-arrow-left me-2"></i> Back to Home
            </a>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
