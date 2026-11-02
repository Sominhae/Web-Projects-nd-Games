<!DOCTYPE html>
<html>
<head>
    <title>Cafeteria Order</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="card">
    <h1>Cafeteria Order System</h1>
    <h2>Add an Item to an Order</h2>
    <form action="processOrder.jsp" method="post">
        <label>Customer Name</label>
        <input type="text" name="customer_name" required>

        <label>Item ID</label>
        <input type="number" name="item_id" required>

        <label>Quantity</label>
        <input type="number" name="quantity" min="1" required>

        <button type="submit">Add Item</button>
    </form>
</div>
</body>
</html>
