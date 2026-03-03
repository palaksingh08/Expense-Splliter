<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Splitter | Login</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated Background */
        .animated-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .animated-bg::before,
        .animated-bg::after {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,112C672,96,768,96,864,112C960,128,1056,160,1152,160C1248,160,1344,128,1392,112L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat;
            background-size: cover;
            animation: float 20s infinite linear;
        }

        .animated-bg::after {
            animation: float 25s infinite linear reverse;
            opacity: 0.5;
        }

        @keyframes float {
            0% { transform: translateX(-50%) translateY(-50%) rotate(0deg); }
            100% { transform: translateX(-50%) translateY(-50%) rotate(360deg); }
        }

        /* Floating Icons */
        .floating-icons {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .floating-icon {
            position: absolute;
            font-size: 3rem;
            color: rgba(255, 255, 255, 0.1);
            animation: floatIcon 15s infinite ease-in-out;
        }

        .floating-icon:nth-child(1) { left: 10%; animation-delay: 0s; }
        .floating-icon:nth-child(2) { left: 20%; animation-delay: 2s; }
        .floating-icon:nth-child(3) { left: 30%; animation-delay: 4s; }
        .floating-icon:nth-child(4) { left: 40%; animation-delay: 6s; }
        .floating-icon:nth-child(5) { left: 50%; animation-delay: 8s; }
        .floating-icon:nth-child(6) { left: 60%; animation-delay: 10s; }
        .floating-icon:nth-child(7) { left: 70%; animation-delay: 12s; }
        .floating-icon:nth-child(8) { left: 80%; animation-delay: 14s; }

        @keyframes floatIcon {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 0.3; }
            90% { opacity: 0.3; }
            50% { transform: translateY(-100px) rotate(180deg); opacity: 0.5; }
        }

        /* Login Container */
        .login-container {
            position: relative;
            z-index: 10;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        /* Left Section */
        .left-section {
            display: none;
        }

        @media (min-width: 768px) {
            .left-section {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: white;
                padding: 3rem;
            }
        }

        .left-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
            animation: fadeInUp 1s ease;
        }

        .left-section p {
            font-size: 1.2rem;
            opacity: 0.9;
            animation: fadeInUp 1s ease 0.2s both;
        }

        .left-section .features {
            margin-top: 3rem;
            animation: fadeInUp 1s ease 0.4s both;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin: 1rem 0;
            font-size: 1.1rem;
        }

        .feature-item i {
            margin-right: 1rem;
            font-size: 1.5rem;
        }

        /* Login Card */
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 3rem;
            width: 100%;
            max-width: 450px;
            animation: slideInRight 0.8s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-card h2 {
            font-size: 2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
            text-align: center;
        }

        .login-card .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 2rem;
            font-size: 0.9rem;
        }

        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 0.5rem;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            transform: translateY(-2px);
        }

        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        .btn-login:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .signup-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }

        .signup-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .signup-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .alert {
            border-radius: 10px;
            border: none;
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        /* Logo Animation */
        .logo-container {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo-icon {
            font-size: 4rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
    </style>
</head>

<body>
    <!-- Animated Background -->
    <div class="animated-bg"></div>
    
    <!-- Floating Icons -->
    <div class="floating-icons">
        <i class="fas fa-wallet floating-icon"></i>
        <i class="fas fa-money-bill-wave floating-icon"></i>
        <i class="fas fa-chart-pie floating-icon"></i>
        <i class="fas fa-users floating-icon"></i>
        <i class="fas fa-receipt floating-icon"></i>
        <i class="fas fa-calculator floating-icon"></i>
        <i class="fas fa-credit-card floating-icon"></i>
        <i class="fas fa-piggy-bank floating-icon"></i>
    </div>

    <div class="login-container">
        <div class="container-fluid">
            <div class="row align-items-center">
                <!-- Left Section -->
                <div class="col-md-6 left-section">
                    <h1><i class="fas fa-wallet"></i> Expense Splitter</h1>
                    <p>Smart way to manage group expenses, trips, and shared costs</p>
                    
                    <div class="features">
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Track who paid and who owes</span>
                        </div>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Manage trip expenses easily</span>
                        </div>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Split bills automatically</span>
                        </div>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Visual graphs and reports</span>
                        </div>
                    </div>
                </div>

                <!-- Right Section - Login Form -->
                <div class="col-md-6">
                    <div class="login-card">
                        <div class="logo-container">
                            <i class="fas fa-wallet logo-icon"></i>
                        </div>
                        <h2>Welcome Back!</h2>
                        <p class="subtitle">Login to manage your expenses</p>

                        <form action="LoginServlet" method="post">
                            <% if (request.getAttribute("error") != null) { %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>
                                    <%= request.getAttribute("error") %>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            <% } %>

                            <% if (request.getAttribute("success") != null) { %>
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="fas fa-check-circle me-2"></i>
                                    <%= request.getAttribute("success") %>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            <% } %>

                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-envelope me-2"></i>Email Address
                                </label>
                                <input type="email" name="email" class="form-control" 
                                       placeholder="Enter your email" required autofocus>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-lock me-2"></i>Password
                                </label>
                                <input type="password" name="password" class="form-control" 
                                       placeholder="Enter your password" required>
                            </div>

                            <button type="submit" class="btn btn-login">
                                <i class="fas fa-sign-in-alt me-2"></i>Login
                            </button>

                            <div class="signup-link">
                                Don't have an account?
                                <a href="signup.jsp">Sign up now</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>
</body>
</html>
