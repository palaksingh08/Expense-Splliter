// Expense Splitter - Custom JavaScript

// Auto-dismiss alerts after 5 seconds
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            const bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        }, 5000);
    });
});

// Form Validation
function validateExpenseForm() {
    const amount = document.querySelector('input[name="amount"]');
    const paidBy = document.querySelector('input[name="paidBy"]');
    const participants = document.querySelector('input[name="participants"]');
    
    let isValid = true;
    
    // Validate amount
    if (amount && (amount.value <= 0 || amount.value === '')) {
        amount.classList.add('is-invalid');
        isValid = false;
    } else if (amount) {
        amount.classList.remove('is-invalid');
        amount.classList.add('is-valid');
    }
    
    // Validate paid by
    if (paidBy && paidBy.value.trim() === '') {
        paidBy.classList.add('is-invalid');
        isValid = false;
    } else if (paidBy) {
        paidBy.classList.remove('is-invalid');
        paidBy.classList.add('is-valid');
    }
    
    // Validate participants
    if (participants && (participants.value <= 0 || participants.value === '')) {
        participants.classList.add('is-invalid');
        isValid = false;
    } else if (participants) {
        participants.classList.remove('is-invalid');
        participants.classList.add('is-valid');
    }
    
    return isValid;
}

// Calculate share automatically
function calculateShare() {
    const amountInput = document.querySelector('input[name="amount"]');
    const participantsInput = document.querySelector('input[name="participants"]');
    const shareDisplay = document.getElementById('share-display');
    
    if (amountInput && participantsInput && shareDisplay) {
        amountInput.addEventListener('input', updateShare);
        participantsInput.addEventListener('input', updateShare);
        
        function updateShare() {
            const amount = parseFloat(amountInput.value) || 0;
            const participants = parseInt(participantsInput.value) || 0;
            
            if (amount > 0 && participants > 0) {
                const share = (amount / participants).toFixed(2);
                shareDisplay.textContent = `Per Person Share: ₹${share}`;
                shareDisplay.style.display = 'block';
            } else {
                shareDisplay.style.display = 'none';
            }
        }
    }
}

// Initialize share calculator on add expense page
if (window.location.pathname.includes('addExpense')) {
    // Add share display element if it doesn't exist
    const form = document.querySelector('form[action="addExpense"]');
    if (form && !document.getElementById('share-display')) {
        const shareDiv = document.createElement('div');
        shareDiv.id = 'share-display';
        shareDiv.className = 'alert alert-info mt-3';
        shareDiv.style.display = 'none';
        form.appendChild(shareDiv);
    }
    calculateShare();
}

// Add form validation on submit
const expenseForm = document.querySelector('form[action="addExpense"]');
if (expenseForm) {
    expenseForm.addEventListener('submit', function(e) {
        if (!validateExpenseForm()) {
            e.preventDefault();
            alert('Please fill all fields correctly!');
        }
    });
}

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Format currency on input
function formatCurrency(input) {
    input.addEventListener('input', function(e) {
        let value = e.target.value.replace(/[^\d.]/g, '');
        if (value && !isNaN(value)) {
            // Keep only 2 decimal places
            const parts = value.split('.');
            if (parts.length > 1) {
                parts[1] = parts[1].slice(0, 2);
                value = parts.join('.');
            }
            e.target.value = value;
        }
    });
}

// Apply currency formatting to amount inputs
document.querySelectorAll('input[name="amount"]').forEach(formatCurrency);

// Add loading state to buttons on form submit
document.querySelectorAll('form').forEach(form => {
    form.addEventListener('submit', function() {
        const submitBtn = form.querySelector('button[type="submit"]');
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Processing...';
        }
    });
});

// Confirmation before logout
const logoutLinks = document.querySelectorAll('a[href*="LogoutServlet"]');
logoutLinks.forEach(link => {
    link.addEventListener('click', function(e) {
        if (!confirm('Are you sure you want to logout?')) {
            e.preventDefault();
        }
    });
});

// Auto-focus first input in forms
document.querySelectorAll('form input[type="text"], form input[type="email"], form input[type="number"]').forEach((input, index) => {
    if (index === 0 && !input.value) {
        input.focus();
    }
});

// Table row highlight on hover
document.querySelectorAll('.table tbody tr').forEach(row => {
    row.addEventListener('mouseenter', function() {
        this.style.backgroundColor = '#f8f9fa';
    });
    row.addEventListener('mouseleave', function() {
        this.style.backgroundColor = '';
    });
});

// Print functionality for expense summary
function printExpenseSummary() {
    window.print();
}

// Add print button if on summary page
if (window.location.pathname.includes('viewSummary') || window.location.pathname.includes('addExpense')) {
    const printBtn = document.createElement('button');
    printBtn.className = 'btn btn-outline-primary btn-sm';
    printBtn.innerHTML = '<i class="fas fa-print"></i> Print';
    printBtn.onclick = printExpenseSummary;
    
    const container = document.querySelector('.container.mt-5');
    if (container) {
        const header = container.querySelector('h2');
        if (header) {
            header.style.display = 'flex';
            header.style.justifyContent = 'space-between';
            header.style.alignItems = 'center';
            printBtn.style.marginLeft = 'auto';
            header.appendChild(printBtn);
        }
    }
}

console.log('Expense Splitter - JavaScript loaded successfully!');

