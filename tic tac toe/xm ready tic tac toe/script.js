function checkWinner() {
    let c = document.querySelectorAll(".cell");

    let values = [];
    c.forEach(cell => {
        values.push(cell.value.toUpperCase());
    });

    let win =
        (values[0] && values[0] === values[1] && values[1] === values[2]) ||
        (values[3] && values[3] === values[4] && values[4] === values[5]) ||
        (values[6] && values[6] === values[7] && values[7] === values[8]) ||
        (values[0] && values[0] === values[3] && values[3] === values[6]) ||
        (values[1] && values[1] === values[4] && values[4] === values[7]) ||
        (values[2] && values[2] === values[5] && values[5] === values[8]) ||
        (values[2] && values[2] === values[4] && values[4] === values[6]) ||
        (values[0] && values[0] === values[4] && values[4] === values[8]); 



    if (win)
        document.getElementById("result").innerHTML = "Winner Found!";
    else
        document.getElementById("result").innerHTML = "No Winner";
}