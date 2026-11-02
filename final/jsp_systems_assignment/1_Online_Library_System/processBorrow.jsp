<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String message;
    Connection con = null;

    try {
        int memberId = Integer.parseInt(request.getParameter("member_id"));
        int bookId = Integer.parseInt(request.getParameter("book_id"));

        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521/FREE",
            "system",
            "your_password"
        );

        con.setAutoCommit(false);

        PreparedStatement memberPS = con.prepareStatement(
            "SELECT member_id FROM Members WHERE member_id = ?");
        memberPS.setInt(1, memberId);
        ResultSet memberRS = memberPS.executeQuery();

        if (!memberRS.next()) {
            throw new Exception("Member does not exist.");
        }
        memberRS.close();
        memberPS.close();

        PreparedStatement bookPS = con.prepareStatement(
            "SELECT available_copies FROM Books WHERE book_id = ? FOR UPDATE");
        bookPS.setInt(1, bookId);
        ResultSet bookRS = bookPS.executeQuery();

        if (!bookRS.next()) {
            throw new Exception("Book does not exist.");
        }

        int available = bookRS.getInt("available_copies");
        bookRS.close();
        bookPS.close();

        if (available <= 0) {
            throw new Exception("This book is currently unavailable.");
        }

        PreparedStatement borrowPS = con.prepareStatement(
            "INSERT INTO Borrowings " +
            "(borrow_id, book_id, member_id, borrow_date, due_date) " +
            "VALUES (borrow_seq.NEXTVAL, ?, ?, SYSDATE, SYSDATE + 14)");
        borrowPS.setInt(1, bookId);
        borrowPS.setInt(2, memberId);
        borrowPS.executeUpdate();
        borrowPS.close();

        PreparedStatement updatePS = con.prepareStatement(
            "UPDATE Books SET available_copies = available_copies - 1 " +
            "WHERE book_id = ?");
        updatePS.setInt(1, bookId);
        updatePS.executeUpdate();
        updatePS.close();

        con.commit();
        message = "Book borrowed successfully. Due date is 14 days from today.";
    } catch (Exception e) {
        if (con != null) {
            try { con.rollback(); } catch (SQLException ignored) {}
        }
        message = "Borrowing failed: " + e.getMessage();
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Borrow Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h2><%= message %></h2>
    <a href="borrow.jsp">Back to Borrow Form</a>
</div>
</body>
</html>
