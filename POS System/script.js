  let totalCost = 0;

        function addPrice(price) {
            totalCost += price;
            document.getElementById("total").innerText = totalCost;
        }

        function confirmOrder() {
            document.getElementById("message").innerHTML =
                "Thank you for visiting us<br>" +
                "Your total cost is: " + totalCost + " taka";
        }