<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String type = request.getParameter("type");
    String message = "";
    boolean success = false;

    if ("library".equals(type)) {
        String studentId = request.getParameter("studentId");
        String bookName = request.getParameter("bookName");
        String issueDate = request.getParameter("issueDate");

        if (studentId != null && !studentId.trim().isEmpty()
                && bookName != null && !bookName.trim().isEmpty()
                && issueDate != null && !issueDate.isEmpty()) {

            List<String> records = (List<String>) session.getAttribute("libraryRecords");
            if (records == null) {
                records = new ArrayList<String>();
            }

            records.add(studentId + " | " + bookName + " | " + issueDate);
            session.setAttribute("libraryRecords", records);

            message = "Book issue record added successfully.";
            success = true;
        } else {
            message = "All library fields are required.";
        }

    } else if ("event".equals(type)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String eventType = request.getParameter("eventType");

        if (name != null && !name.trim().isEmpty()
                && email != null && email.contains("@")
                && eventType != null && !eventType.isEmpty()) {
            message = "Event registration successful for " + name + ".";
            success = true;
        } else {
            message = "Please provide valid event information.";
        }

    } else if ("clinic".equals(type)) {
        String patient = request.getParameter("patientName");
        String doctor = request.getParameter("doctor");
        String date = request.getParameter("date");

        if (patient != null && !patient.trim().isEmpty()
                && doctor != null && !doctor.trim().isEmpty()
                && date != null && !date.isEmpty()) {
            message = "Appointment booked successfully.";
            success = true;
        } else {
            message = "All appointment fields are required.";
        }

    } else if ("order".equals(type)) {
        String product = request.getParameter("productName");
        String quantityText = request.getParameter("quantity");
        String priceText = request.getParameter("price");

        try {
            int quantity = Integer.parseInt(quantityText);
            double price = Double.parseDouble(priceText);

            if (product != null && !product.trim().isEmpty()
                    && quantity > 0 && price >= 0) {
                double total = quantity * price;
                message = "Order added successfully. Total price: " + total;
                success = true;
            } else {
                message = "Enter valid order information.";
            }
        } catch (Exception e) {
            message = "Quantity and price must be numeric.";
        }

    } else if ("hostel".equals(type)) {
        String studentId = request.getParameter("studentId");
        String roomType = request.getParameter("roomType");

        List<String> applications = (List<String>) session.getAttribute("hostelApplications");
        if (applications == null) {
            applications = new ArrayList<String>();
        }

        String newApplication = studentId + " | " + roomType;

        if (studentId != null && !studentId.trim().isEmpty()
                && roomType != null && !roomType.isEmpty()) {

            if (applications.contains(newApplication)) {
                message = "Duplicate hostel application is not allowed.";
            } else {
                applications.add(newApplication);
                session.setAttribute("hostelApplications", applications);
                message = "Hostel application submitted successfully.";
                success = true;
            }
        } else {
            message = "Student ID and room type are required.";
        }
    } else {
        message = "Invalid request.";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Result</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <section class="card">
        <h2><%= success ? "Success" : "Error" %></h2>
        <p><%= message %></p>
        <a href="index.jsp">Return to forms</a>
    </section>
</div>
</body>
</html>
