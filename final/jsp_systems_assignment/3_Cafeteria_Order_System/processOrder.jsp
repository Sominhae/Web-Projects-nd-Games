<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String message;
    Connection con = null;

    try {
        String customerName = request.getParameter("customer_name");
        int itemId = Integer.parseInt(request.getParameter("item_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (customerName == null || customerName.trim().isEmpty() || quantity <= 0) {
            throw new Exception("Enter valid customer name and quantity.");
        }

        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521/FREE",
            "system",
            "your_password"
        );
        con.setAutoCommit(false);

        PreparedStatement itemPS = con.prepareStatement(
            "SELECT price, available FROM Menu_Items WHERE item_id = ?");
        itemPS.setInt(1, itemId);
        ResultSet itemRS = itemPS.executeQuery();

        if (!itemRS.next()) {
            throw new Exception("Menu item does not exist.");
        }

        double price = itemRS.getDouble("price");
        String available = itemRS.getString("available");
        itemRS.close();
        itemPS.close();

        if (!"Y".equals(available)) {
            throw new Exception("This item is not available.");
        }

        PreparedStatement orderPS = con.prepareStatement(
            "INSERT INTO Orders(order_id, customer_name, total_amount) " +
            "VALUES(order_seq.NEXTVAL, ?, ?) RETURNING order_id INTO ?");
        orderPS = con.prepareStatement(
            "INSERT INTO Orders(order_id, customer_name, total_amount) " +
            "VALUES(order_seq.NEXTVAL, ?, 0)");
        orderPS.setString(1, customerName);
        orderPS.executeUpdate();
        orderPS.close();

        PreparedStatement idPS = con.prepareStatement(
            "SELECT order_seq.CURRVAL AS order_id FROM dual");
        ResultSet idRS = idPS.executeQuery();
        idRS.next();
        int orderId = idRS.getInt("order_id");
        idRS.close();
        idPS.close();

        PreparedStatement detailPS = con.prepareStatement(
            "INSERT INTO Order_Items " +
            "(order_item_id, order_id, item_id, quantity, unit_price) " +
            "VALUES(order_item_seq.NEXTVAL, ?, ?, ?, ?)");
        detailPS.setInt(1, orderId);
        detailPS.setInt(2, itemId);
        detailPS.setInt(3, quantity);
        detailPS.setDouble(4, price);
        detailPS.executeUpdate();
        detailPS.close();

        double total = price * quantity;

        PreparedStatement updatePS = con.prepareStatement(
            "UPDATE Orders SET total_amount = ? WHERE order_id = ?");
        updatePS.setDouble(1, total);
        updatePS.setInt(2, orderId);
        updatePS.executeUpdate();
        updatePS.close();

        con.commit();
        message = "Item added successfully. Order ID: " + orderId +
                  ", Total: " + String.format("%.2f", total);
    } catch (Exception e) {
        if (con != null) {
            try { con.rollback(); } catch (SQLException ignored) {}
        }
        message = "Order failed: " + e.getMessage();
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h2><%= message %></h2>
    <a href="order.jsp">Back to Order Form</a>
</div>
</body>
</html>
