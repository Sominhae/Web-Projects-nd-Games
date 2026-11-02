<!DOCTYPE html>
<html>
<head>
    <title>Doctor Appointment</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h1>Doctor Appointment System</h1>
    <h2>Book an Appointment</h2>
    <form action="processAppointment.jsp" method="post">
        <label>Patient ID</label>
        <input type="number" name="patient_id" required>

        <label>Doctor ID</label>
        <input type="number" name="doctor_id" required>

        <label>Appointment Date and Time</label>
        <input type="datetime-local" name="appointment_date" required>

        <label>Reason</label>
        <textarea name="reason"></textarea>

        <button type="submit">Book Appointment</button>
    </form>
</div>
</body>
</html>
