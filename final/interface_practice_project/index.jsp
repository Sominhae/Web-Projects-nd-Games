<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Interface Practice</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h1>Interface Practice</h1>
    <p class="intro">HTML + CSS + JavaScript + JSP practice interfaces</p>

    <section class="card">
        <h2>1. Library Book Issue</h2>
        <form action="process.jsp" method="post" onsubmit="return validateLibrary()">
            <input type="hidden" name="type" value="library">
            <input id="studentId" name="studentId" placeholder="Student ID" required>
            <input id="bookName" name="bookName" placeholder="Book Name" required>
            <input id="issueDate" name="issueDate" type="date" required>
            <button type="submit">Issue Book</button>
        </form>
        <p id="libraryMsg" class="message"></p>
    </section>

    <section class="card">
        <h2>2. Event Registration</h2>
        <form action="process.jsp" method="post" onsubmit="return validateEvent()">
            <input type="hidden" name="type" value="event">
            <input id="participantName" name="name" placeholder="Name" required>
            <input id="email" name="email" type="email" placeholder="Email" required>
            <select id="eventType" name="eventType" required>
                <option value="">Choose Event</option>
                <option>Workshop</option>
                <option>Seminar</option>
                <option>Competition</option>
            </select>
            <button type="submit">Register</button>
        </form>
        <p id="eventMsg" class="message"></p>
    </section>

    <section class="card">
        <h2>3. Clinic Appointment</h2>
        <form action="process.jsp" method="post" onsubmit="return validateClinic()">
            <input type="hidden" name="type" value="clinic">
            <input id="patientName" name="patientName" placeholder="Patient Name" required>
            <input id="doctor" name="doctor" placeholder="Doctor Name" required>
            <input id="appointmentDate" name="date" type="date" required>
            <button type="submit">Book Appointment</button>
        </form>
        <p id="clinicMsg" class="message"></p>
    </section>

    <section class="card">
        <h2>4. Product Order</h2>
        <form action="process.jsp" method="post" onsubmit="return validateOrder()">
            <input type="hidden" name="type" value="order">
            <input id="productName" name="productName" placeholder="Product Name" required>
            <input id="quantity" name="quantity" type="number" min="1" placeholder="Quantity" required>
            <input id="price" name="price" type="number" min="0" step="0.01" placeholder="Price" required>
            <button type="submit">Place Order</button>
        </form>
        <p id="orderMsg" class="message"></p>
    </section>

    <section class="card">
        <h2>5. Hostel Seat Application</h2>
        <form action="process.jsp" method="post" onsubmit="return validateHostel()">
            <input type="hidden" name="type" value="hostel">
            <input id="hostelStudentId" name="studentId" placeholder="Student ID" required>
            <select id="roomType" name="roomType" required>
                <option value="">Choose Room Type</option>
                <option>Single</option>
                <option>Double</option>
                <option>Shared</option>
            </select>
            <button type="submit">Apply</button>
        </form>
        <p id="hostelMsg" class="message"></p>
    </section>
</div>
<script src="script.js"></script>
</body>
</html>
