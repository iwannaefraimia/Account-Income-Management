# Web Application for Account and Income Management

## Description
Developed a fully functional web-based application for managing user accounts and income types. The application includes dynamic user interfaces and backend logic, enabling CRUD (Create, Read, Update, Delete) operations on accounts and income types. The project was implemented using Java Server Pages (JSP) and follows a Model-View-Controller (MVC) design pattern.

---

## Features
- **User Account Management**: Create, view, update, and delete user accounts.
- **Income Type Management**: Manage different types of income through CRUD operations.
- **Dynamic User Interfaces**: Interactive JSP-based front-end for user interaction.
- **MVC Design Pattern**: Clear separation of concerns between the Model, View, and Controller layers.

---

## Project Structure
### Key Components:

- **Frontend**:
  - `deleteAccount.jsp`
  - `deleteIncomeType.jsp`
  - `editAccount.jsp`
  - `editIncomeType.jsp`
  - `listAccounts.jsp`
  - `listIncomeType.jsp`
  - `newAccount.jsp`
  - `newAccountController.jsp`
  - `newIncomeType.jsp`
  - `newIncomeTypeController.jsp`
  - `updateAccount.jsp`
  - `updateIncomeType.jsp`

- **Backend**:
  - `DB.java`: Handles database connectivity and operations.
  - `IncomeService.java`: Service layer logic for managing incomes.
  - `IncomeType.java`: Entity representing income types.
  - `IncomeTypeService.java`: Service layer logic for income type operations.
  - `Incomes.java`: Entity representing income details.
  - `User.java`: Entity representing user accounts.
  - `UserDAO.java`: Data Access Object for user operations.

- **Database**:
  - `Progr2 (database).db`: SQLite database containing the application data.

---

## Tools and Technologies
- **Languages**: Java, SQL
- **Frameworks**: Java Server Pages (JSP)
- **Design Pattern**: MVC (Model-View-Controller)
- **Database**: SQLite

---

## Installation and Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Account-Income-Management
   ```
2. Import the project into your IDE (e.g., Eclipse, IntelliJ IDEA).
3. Set up a local web server (e.g., Apache Tomcat).
4. Configure the database:
   - Ensure the `Progr2 (database).db` file is placed in the correct directory.
   - Update database connection details in `DB.java`.
5. Deploy the project to the server and access the application via the browser.

---

## Team Members
This project was developed as part of a group effort for the Information Systems Development & Architectures course at AUEB.

---
