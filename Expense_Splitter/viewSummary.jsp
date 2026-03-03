git push -u origin main<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.Expense" %>

<%
    // Check if user is logged in
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Summary</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="assets/css/style.css">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

<style>
    body {
        background: linear-gradient(135deg, #f5f7fb 0%, #c3cfe2 100%);
        font-family: 'Poppins', sans-serif;
    }
    .navbar {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .stats-card {
        background: white;
        border-radius: 15px;
        padding: 1.5rem;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s;
        margin-bottom: 1.5rem;
    }
    .stats-card:hover {
        transform: translateY(-5px);
    }
    .stats-icon {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }
    .chart-container {
        background: white;
        border-radius: 15px;
        padding: 2rem;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        margin-bottom: 2rem;
    }
    .table-container {
        background: white;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        padding: 2rem;
        overflow-x: auto;
    }
    .badge-category {
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 500;
    }
    .category-food { background: #ff6b6b; color: white; }
    .category-travel { background: #4ecdc4; color: white; }
    .category-hotel { background: #45b7d1; color: white; }
    .category-shopping { background: #f9ca24; color: #333; }
    .category-entertainment { background: #6c5ce7; color: white; }
    .category-transport { background: #a29bfe; color: white; }
    .category-general { background: #95a5a6; color: white; }
</style>
</head>

<body>

<nav class="navbar navbar-dark">
    <div class="container-fluid">
        <span class="navbar-brand mb-0 h1">
            <i class="fas fa-wallet"></i> Expense Splitter
        </span>
        <a href="index.jsp" class="btn btn-outline-light btn-sm">
            <i class="fas fa-home"></i> Home
        </a>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="text-center mb-4">
        <i class="fas fa-chart-bar text-primary"></i> Expense Summary & Analytics
    </h2>

    <div class="table-container">
        <%
            // Show success/error messages from session
            String success = (String) session.getAttribute("success");
            String error = (String) session.getAttribute("error");
            if (success != null) {
                session.removeAttribute("success");
        %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle"></i> <%= success %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
            }
            if (error != null) {
                session.removeAttribute("error");
        %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
            }
            
            List<Expense> expenses = (List<Expense>) request.getAttribute("expenseList");
            double totalAmount = 0;
            int totalExpenses = 0;
            Map<String, Double> categoryTotals = new HashMap<>();
            Map<String, Double> tripTotals = new HashMap<>();
            Map<String, Double> paidByTotals = new HashMap<>();
            
            if (expenses != null && !expenses.isEmpty()) {
                totalExpenses = expenses.size();
                
                for (Expense e : expenses) {
                    totalAmount += e.getAmount();
                    
                    // Category totals
                    String cat = (e.getCategory() != null && !e.getCategory().isEmpty()) ? e.getCategory() : "General";
                    categoryTotals.put(cat, categoryTotals.getOrDefault(cat, 0.0) + e.getAmount());
                    
                    // Trip totals
                    String trip = (e.getTripName() != null && !e.getTripName().isEmpty()) ? e.getTripName() : "General Expenses";
                    tripTotals.put(trip, tripTotals.getOrDefault(trip, 0.0) + e.getAmount());
                    
                    // Paid by totals
                    paidByTotals.put(e.getPaidBy(), paidByTotals.getOrDefault(e.getPaidBy(), 0.0) + e.getAmount());
                }
        %>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-rupee-sign stats-icon text-primary"></i>
                    <h3 class="mb-0">₹<%= String.format("%.2f", totalAmount) %></h3>
                    <p class="text-muted mb-0">Total Expenses</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-list stats-icon text-success"></i>
                    <h3 class="mb-0"><%= totalExpenses %></h3>
                    <p class="text-muted mb-0">Total Records</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-tags stats-icon text-info"></i>
                    <h3 class="mb-0"><%= categoryTotals.size() %></h3>
                    <p class="text-muted mb-0">Categories</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <i class="fas fa-plane stats-icon text-warning"></i>
                    <h3 class="mb-0"><%= tripTotals.size() %></h3>
                    <p class="text-muted mb-0">Trips/Events</p>
                </div>
            </div>
        </div>

        <!-- Charts -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="chart-container">
                    <h5 class="mb-3"><i class="fas fa-chart-pie me-2"></i>Expenses by Category</h5>
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="chart-container">
                    <h5 class="mb-3"><i class="fas fa-chart-bar me-2"></i>Expenses by Trip</h5>
                    <canvas id="tripChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Expenses Table -->
        <div class="table-responsive">
            <h5 class="mb-3"><i class="fas fa-table me-2"></i>All Expenses</h5>
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Trip/Event</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Amount (₹)</th>
                        <th>Paid By</th>
                        <th>Participants</th>
                        <th>Per Person (₹)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Expense e : expenses) {
                            String category = (e.getCategory() != null && !e.getCategory().isEmpty()) ? e.getCategory() : "General";
                            String tripName = (e.getTripName() != null && !e.getTripName().isEmpty()) ? e.getTripName() : "General Expenses";
                            String description = (e.getDescription() != null && !e.getDescription().isEmpty()) ? e.getDescription() : "-";
                    %>
                    <tr>
                        <td><%= e.getId() %></td>
                        <td><strong><%= tripName %></strong></td>
                        <td>
                            <span class="badge badge-category category-<%= category.toLowerCase() %>">
                                <%= category %>
                            </span>
                        </td>
                        <td><%= description %></td>
                        <td><strong>₹<%= String.format("%.2f", e.getAmount()) %></strong></td>
                        <td><strong><%= e.getPaidBy() %></strong></td>
                        <td><%= e.getParticipants() %></td>
                        <td>₹<%= String.format("%.2f", e.getShare()) %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot class="table-info">
                    <tr>
                        <th colspan="4">Total</th>
                        <th>₹<%= String.format("%.2f", totalAmount) %></th>
                        <th colspan="3"></th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <%
            } else {
        %>
        <div class="alert alert-info text-center" role="alert">
            <i class="fas fa-info-circle"></i> No expenses found. Add your first expense!
        </div>
        <%
            }
        %>

        <div class="text-center mt-4">
            <a href="addExpense.jsp" class="btn btn-primary btn-lg">
                <i class="fas fa-plus"></i> Add New Expense
            </a>
            <a href="index.jsp" class="btn btn-outline-secondary btn-lg">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>

<script>
    // Chart.js Configuration
    <%
        if (expenses != null && !expenses.isEmpty()) {
    %>
    
    // Category Chart
    const categoryCtx = document.getElementById('categoryChart');
    if (categoryCtx) {
        new Chart(categoryCtx, {
            type: 'doughnut',
            data: {
                labels: [<%
                    for (String cat : categoryTotals.keySet()) {
                        out.print("'" + cat + "',");
                    }
                %>],
                datasets: [{
                    data: [<%
                        for (String cat : categoryTotals.keySet()) {
                            out.print(categoryTotals.get(cat) + ",");
                        }
                    %>],
                    backgroundColor: [
                        '#ff6b6b', '#4ecdc4', '#45b7d1', '#f9ca24', 
                        '#6c5ce7', '#a29bfe', '#95a5a6', '#fd79a8'
                    ]
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    }

    // Trip Chart
    const tripCtx = document.getElementById('tripChart');
    if (tripCtx) {
        new Chart(tripCtx, {
            type: 'bar',
            data: {
                labels: [<%
                    for (String trip : tripTotals.keySet()) {
                        out.print("'" + trip + "',");
                    }
                %>],
                datasets: [{
                    label: 'Amount (₹)',
                    data: [<%
                        for (String trip : tripTotals.keySet()) {
                            out.print(tripTotals.get(trip) + ",");
                        }
                    %>],
                    backgroundColor: 'rgba(102, 126, 234, 0.8)',
                    borderColor: 'rgba(102, 126, 234, 1)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    }
    
    <%
        }
    %>
</script>

</body>
</html>
