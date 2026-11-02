<!DOCTYPE html>
<html>
<head>
    <title>Borrow a Book</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h1>Online Library System</h1>
    <h2>Borrow a Book</h2>
    <form action="processBorrow.jsp" method="post">
        <label>Member ID</label>
        <input type="number" name="member_id" required>

        <label>Book ID</label>
        <input type="number" name="book_id" required>

        <button type="submit">Borrow Book</button>
    </form>
</div>
</body>
</html>
