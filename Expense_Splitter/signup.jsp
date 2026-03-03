<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Splitter | Sign Up</title>

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
            overflow-x: hidden;
            position: relative;
        }
        .animated-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }
        .floating-icon {
            position: absolute;
            font-size: 2.5rem;
            color: rgba(255, 255, 255, 0.12);
            animation: floatIcon 18s infinite ease-in-out;
        }
        .floating-icon:nth-child(1) { left: 8%; animation-delay: 0s; }
        .floating-icon:nth-child(2) { left: 25%; animation-delay: 3s; }
        .floating-icon:nth-child(3) { left: 45%; animation-delay: 6s; }
        .floating-icon:nth-child(4) { left: 65%; animation-delay: 9s; }
        .floating-icon:nth-child(5) { left: 85%; animation-delay: 12s; }
        @keyframes floatIcon {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            15% { opacity: 0.4; }
            85% { opacity: 0.4; }
            50% { transform: translateY(-80px) rotate(180deg); opacity: 0.6; }
        }
        .signup-container {
            position: relative;
            z-index: 10;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
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
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 0 2px 15px rgba(0,0,0,0.2);
        }
        .left-section p {
            font-size: 1.15rem;
            opacity: 0.95;
        }
        .left-section .features {
            margin-top: 2.5rem;
        }
        .feature-item {
            display: flex;
            align-items: center;
            margin: 0.8rem 0;
            font-size: 1.05rem;
        }
        .feature-item i {
            margin-right: 1rem;
            font-size: 1.3rem;
        }
        .signup-card {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(12px);
            border-radius: 24px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.25);
            padding: 2.5rem;
            width: 100%;
            max-width: 440px;
            border: 1px solid rgba(255,255,255,0.3);
            animation: slideUp 0.6s ease;
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .signup-card .logo-wrap {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .signup-card .logo-wrap .icon {
            font-size: 3.5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .signup-card h2 {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
            text-align: center;
            margin-bottom: 0.3rem;
        }
        .signup-card .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 1.8rem;
            font-size: 0.9rem;
        }
        .form-label {
            font-weight: 500;
            color: #444;
        }
        .form-control {
            border: 2px solid #e8e8e8;
            border-radius: 12px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.2);
        }
        .btn-signup {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 12px;
            padding: 0.85rem;
            font-size: 1.05rem;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .btn-signup:hover {
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
        }
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }
        .login-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }
        .login-link a:hover { color: #764ba2; text-decoration: underline; }
        .alert { border-radius: 12px; border: none; }
    </style>
</head>

<body>
    <div class="animated-bg">
        <i class="fas fa-wallet floating-icon"></i>
        <i class="fas fa-users floating-icon"></i>
        <i class="fas fa-receipt floating-icon"></i>
        <i class="fas fa-chart-pie floating-icon"></i>
        <i class="fas fa-piggy-bank floating-icon"></i>
    </div>

    <div class="signup-container">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-md-6 left-section">
                    <h1><i class="fas fa-wallet me-3"></i>Expense Splitter</h1>
                    <p>Join to track trips, split bills & see who paid what</p>
                    <div class="features">
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Track trips & events</span>
                        </div>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>Split expenses fairly</span>
                        </div>
                        <div class="feature-item">
                            <i class="fas fa-check-circle"></i>
                            <span>See who owes whom</span>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 d-flex justify-content-center">
                    <div class="signup-card">
                        <div class="logo-wrap">
                            <i class="fas fa-user-plus icon"></i>
                        </div>
                        <h2>Create Account</h2>
                        <p class="subtitle">Sign up to get started</p>

                        <form action="SignupServlet" method="post">
                            <% if (request.getAttribute("error") != null) { %>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>
                                    <%= request.getAttribute("error") %>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            <% } %>

                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-user me-2"></i>Full Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-envelope me-2"></i>Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"><i class="fas fa-lock me-2"></i>Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Create a password" required>
                            </div>
                            <button type="submit" class="btn btn-signup">
                                <i class="fas fa-user-plus me-2"></i> Sign Up
                            </button>
                            <div class="login-link">
                                Already have an account? <a href="login.jsp">Login</a>
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
