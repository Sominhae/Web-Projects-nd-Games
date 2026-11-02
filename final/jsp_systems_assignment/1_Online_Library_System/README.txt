ONLINE LIBRARY SYSTEM
=====================

Features:
1. Book management and availability checking.
2. Borrowing books with a 14-day due date.

Files:
- schema.sql: Oracle database tables and sequence
- borrow.jsp: Borrow form
- processBorrow.jsp: JDBC borrowing implementation
- style.css: Basic styling

Before running:
1. Create the database tables using schema.sql.
2. Add the Oracle JDBC driver to Tomcat.
3. Change database username/password in processBorrow.jsp.
4. Deploy the folder in Apache Tomcat.
