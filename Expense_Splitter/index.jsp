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
<title>Expense Splitter - Dashboard</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="assets/css/style.css">

<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        position: relative;
        overflow-x: hidden;
    }
    body::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.05" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,112C672,96,768,96,864,112C960,128,1056,160,1152,160C1248,160,1344,128,1392,112L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
        background-size: cover;
        pointer-events: none;
    }
    .navbar {
        background: rgba(255,255,255,0.15) !important;
        backdrop-filter: blur(10px);
        box-shadow: 0 4px 30px rgba(0,0,0,0.1);
        border-bottom: 1px solid rgba(255,255,255,0.2);
    }
    .navbar-brand { font-weight: 700; font-size: 1.4rem; }
    .welcome-badge {
        background: rgba(255,255,255,0.2);
        padding: 0.4rem 1rem;
        border-radius: 50px;
        font-weight: 500;
    }
    .btn-outline-light:hover {
        background: rgba(255,255,255,0.25);
        color: white;
    }
    .page-title {
        text-align: center;
        color: white;
        font-weight: 700;
        font-size: 2rem;
        margin-bottom: 2rem;
        text-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }
    .dashboard-card {
        background: rgba(255,255,255,0.95);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2.5rem;
        box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.3);
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        height: 100%;
        position: relative;
        overflow: hidden;
    }
    .dashboard-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 4px;
        background: linear-gradient(90deg, #667eea, #764ba2);
        transform: scaleX(0);
        transition: transform 0.4s ease;
    }
    .dashboard-card:hover {
        transform: translateY(-12px) scale(1.02);
        box-shadow: 0 25px 50px rgba(0,0,0,0.25);
    }
    .dashboard-card:hover::before {
        transform: scaleX(1);
    }
    .card-icon-wrap {
        width: 80px;
        height: 80px;
        margin: 0 auto 1.5rem;
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2.5rem;
        color: white;
        transition: transform 0.3s ease;
    }
    .dashboard-card:hover .card-icon-wrap {
        transform: rotate(5deg) scale(1.1);
    }
    .card-icon-add { background: linear-gradient(135deg, #667eea, #764ba2); }
    .card-icon-summary { background: linear-gradient(135deg, #11998e, #38ef7d); }
    .dashboard-card h4 {
        font-weight: 600;
        color: #333;
        margin-bottom: 0.5rem;
    }
    .dashboard-card .card-desc {
        color: #666;
        font-size: 0.95rem;
        margin-bottom: 1.5rem;
        line-height: 1.5;
    }
    .btn-dashboard {
        border: none;
        border-radius: 12px;
        padding: 0.85rem 1.5rem;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        width: 100%;
    }
    .btn-dashboard-add {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    }
    .btn-dashboard-add:hover {
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.5);
    }
    .btn-dashboard-summary {
        background: linear-gradient(135deg, #11998e, #38ef7d);
        color: white;
        box-shadow: 0 4px 15px rgba(17, 153, 142, 0.4);
    }
    .btn-dashboard-summary:hover {
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(17, 153, 142, 0.5);
    }
    .container.main-content { position: relative; z-index: 1; padding-bottom: 3rem; }
</style>
</head>

<body>

<nav class="navbar navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1">
            <i class="fas fa-wallet me-2"></i> Expense Splitter
        </span>
        <div class="d-flex align-items-center gap-3">
            <span class="welcome-badge text-white">
                <i class="fas fa-user-circle me-2"></i> <%= userName %>
            </span>
            <a href="LogoutServlet" class="btn btn-outline-light btn-sm">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container main-content mt-4">
    <h1 class="page-title">
        <i class="fas fa-th-large me-2"></i> Dashboard
    </h1>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="dashboard-card">
                <div class="card-icon-wrap card-icon-add">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h4>Add New Expense</h4>
                <p class="card-desc">Record trips, food, travel & split among participants</p>
                <a href="addExpense.jsp" class="btn btn-dashboard btn-dashboard-add">
                    <i class="fas fa-plus me-2"></i> Add Expense
                </a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="dashboard-card">
                <div class="card-icon-wrap card-icon-summary">
                    <i class="fas fa-chart-pie"></i>
                </div>
                <h4>View Summary</h4>
                <p class="card-desc">See all expenses, graphs & who paid / who owes</p>
                <a href="addExpense" class="btn btn-dashboard btn-dashboard-summary">
                    <i class="fas fa-list me-2"></i> View Summary
                </a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
