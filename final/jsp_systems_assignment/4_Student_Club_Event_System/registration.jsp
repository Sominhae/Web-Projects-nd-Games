<!DOCTYPE html>
<html>
<head>
    <title>Club Event Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h1>Student Club Event System</h1>
    <h2>Register for an Event</h2>
    <form action="processRegistration.jsp" method="post">
        <label>Member ID</label>
        <input type="number" name="member_id" required>

        <label>Event ID</label>
        <input type="number" name="event_id" required>

        <button type="submit">Register</button>
    </form>
</div>
</body>
</html>
