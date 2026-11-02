<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String message;
    Connection con = null;

    try {
        int memberId = Integer.parseInt(request.getParameter("member_id"));
        int eventId = Integer.parseInt(request.getParameter("event_id"));

        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521/FREE",
            "system",
            "your_password"
        );

        PreparedStatement memberPS = con.prepareStatement(
            "SELECT member_id FROM Club_Members WHERE member_id = ?");
        memberPS.setInt(1, memberId);
        ResultSet memberRS = memberPS.executeQuery();

        if (!memberRS.next()) {
            throw new Exception("Member does not exist.");
        }
        memberRS.close();
        memberPS.close();

        PreparedStatement eventPS = con.prepareStatement(
            "SELECT event_id FROM Club_Events WHERE event_id = ?");
        eventPS.setInt(1, eventId);
        ResultSet eventRS = eventPS.executeQuery();

        if (!eventRS.next()) {
            throw new Exception("Event does not exist.");
        }
        eventRS.close();
        eventPS.close();

        PreparedStatement insertPS = con.prepareStatement(
            "INSERT INTO Event_Registrations " +
            "(registration_id, member_id, event_id) " +
            "VALUES(registration_seq.NEXTVAL, ?, ?)");
        insertPS.setInt(1, memberId);
        insertPS.setInt(2, eventId);
        insertPS.executeUpdate();
        insertPS.close();

        message = "Member registered successfully.";
    } catch (SQLIntegrityConstraintViolationException e) {
        message = "This member is already registered for the selected event.";
    } catch (Exception e) {
        message = "Registration failed: " + e.getMessage();
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h2><%= message %></h2>
    <a href="registration.jsp">Back to Registration Form</a>
</div>
</body>
</html>
