<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String message;
    Connection con = null;

    try {
        int patientId = Integer.parseInt(request.getParameter("patient_id"));
        int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
        String dateText = request.getParameter("appointment_date").replace("T", " ");
        String reason = request.getParameter("reason");

        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521/FREE",
            "system",
            "your_password"
        );

        PreparedStatement patientPS = con.prepareStatement(
            "SELECT patient_id FROM Patients WHERE patient_id = ?");
        patientPS.setInt(1, patientId);
        ResultSet patientRS = patientPS.executeQuery();

        if (!patientRS.next()) {
            throw new Exception("Patient does not exist.");
        }
        patientRS.close();
        patientPS.close();

        PreparedStatement doctorPS = con.prepareStatement(
            "SELECT doctor_id FROM Doctors WHERE doctor_id = ?");
        doctorPS.setInt(1, doctorId);
        ResultSet doctorRS = doctorPS.executeQuery();

        if (!doctorRS.next()) {
            throw new Exception("Doctor does not exist.");
        }
        doctorRS.close();
        doctorPS.close();

        PreparedStatement insertPS = con.prepareStatement(
            "INSERT INTO Appointments " +
            "(appointment_id, doctor_id, patient_id, appointment_date, reason) " +
            "VALUES (appointment_seq.NEXTVAL, ?, ?, TO_DATE(?, 'YYYY-MM-DD HH24:MI'), ?)");
        insertPS.setInt(1, doctorId);
        insertPS.setInt(2, patientId);
        insertPS.setString(3, dateText);
        insertPS.setString(4, reason);
        insertPS.executeUpdate();
        insertPS.close();

        message = "Appointment booked successfully.";
    } catch (SQLIntegrityConstraintViolationException e) {
        message = "This doctor already has an appointment at that time.";
    } catch (Exception e) {
        message = "Booking failed: " + e.getMessage();
    } finally {
        if (con != null) {
            try { con.close(); } catch (SQLException ignored) {}
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h2><%= message %></h2>
    <a href="appointment.jsp">Back to Appointment Form</a>
</div>
</body>
</html>
