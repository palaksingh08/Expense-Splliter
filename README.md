# Expense Splitter Application

A web-based expense splitting application built with JSP, Servlets, and MySQL that runs on Apache Tomcat server.

## Features

- User Registration and Login
- Add Expenses with participant splitting
- View Expense Summary
- Modern Bootstrap UI
- Session Management

## Prerequisites

1. **Apache Tomcat 9.0** - Installed and running
2. **MySQL Database** - Installed and running
3. **MySQL JDBC Driver** - mysql-connector-java-8.0.33.jar (or compatible version)

## Setup Instructions

### 1. Database Setup

1. Open MySQL command line or MySQL Workbench
2. Run the `database_setup.sql` script:
   ```sql
   source database_setup.sql
   ```
   Or copy and paste the contents of `database_setup.sql` into MySQL

### 2. Configure Database Connection

Edit the following files to match your MySQL configuration:
- `WEB-INF/src/dao/UserDao.java` - Update `jdbcURL`, `jdbcUsername`, `jdbcPassword`
- `WEB-INF/src/dao/ExpenseDAO.java` - Update `jdbcURL`, `jdbcUsername`, `jdbcPassword`

Default configuration:
- URL: `jdbc:mysql://localhost:3306/expense_splitter`
- Username: `root`
- Password: `root`

### 3. Add MySQL JDBC Driver

1. Download MySQL JDBC Driver (mysql-connector-java-8.0.33.jar or later)
2. Place it in: `WEB-INF/lib/mysql-connector-java-8.0.33.jar`

### 4. Compile Java Files

Compile all Java source files from `WEB-INF/src` to `WEB-INF/classes`:

```bash
# Navigate to WEB-INF/src directory
cd WEB-INF/src

# Compile all Java files (adjust classpath as needed)
javac -cp ".;../lib/servlet-api.jar;../lib/mysql-connector-java-8.0.33.jar" -d ../classes controller/*.java dao/*.java model/*.java util/*.java
```

Or use your IDE (Eclipse, IntelliJ) to compile the project.

### 5. Deploy to Tomcat

1. Ensure the project is in: `C:\Tomcat 9.0\webapps\Expense_Splitter`
2. Start Tomcat server
3. Access the application at: `http://localhost:8080/Expense_Splitter/`

## Project Structure

```
Expense_Splitter/
├── WEB-INF/
│   ├── classes/          # Compiled Java classes
│   ├── lib/              # JAR dependencies
│   ├── src/              # Java source files
│   │   ├── controller/   # Servlets
│   │   ├── dao/          # Data Access Objects
│   │   ├── model/        # Model classes
│   │   └── util/         # Utility classes
│   └── web.xml           # Deployment descriptor
├── assets/
│   ├── css/              # Stylesheets
│   ├── js/               # JavaScript files
│   └── images/           # Images
├── *.jsp                 # JSP pages
├── database_setup.sql    # Database setup script
└── README.md             # This file
```

## Usage

1. **Register**: Create a new account at `/signup.jsp`
2. **Login**: Login with your credentials at `/login.jsp`
3. **Add Expense**: Add expenses and split among participants
4. **View Summary**: See all expenses and calculations

## Troubleshooting

### Database Connection Error
- Verify MySQL is running
- Check database credentials in DAO classes
- Ensure database `expense_splitter` exists

### ClassNotFoundException
- Ensure MySQL JDBC driver is in `WEB-INF/lib/`
- Recompile Java files after adding dependencies

### 404 Error
- Check if Tomcat is running
- Verify project is in `webapps` folder
- Check `web.xml` for correct servlet mappings

## Technologies Used

- **Frontend**: JSP, HTML, CSS, Bootstrap 5, Font Awesome
- **Backend**: Java Servlets
- **Database**: MySQL
- **Server**: Apache Tomcat 9.0

## License

This project is open source and available for educational purposes.


