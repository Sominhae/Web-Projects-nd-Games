//alert("Hello World")
//confirm("tum kon")
//console.log("tumi ekta gucupucu")

let a = 10
var b = 5
const c = 9.2
let sum = a+b
console.log("sum is:"+sum)


//let name = prompt("enter your name:")
//alert("Welcome " +name)

function showMessage()
{
    alert("Button Clicked")
}
let count = 0 
function changeText()
{
    document.getElementById("text").innerHTML = "I'm dead"
    if(count %2 == 0){
      document.getElementById("text").innerHTML = "I'm alive"  
    } 
    else{
        document.getElementById("text").innerHTML = "I'm dead"
    }
     count++ 
}


let isDead = true
function toggleText()
{
    if(isDead){
      document.getElementById("text").innerHTML = "I'm Dead"
      isDead = false;
    } 
    else{
        document.getElementById("text").innerHTML = "I'm Alive"
        isDead = true;
    }
}
 

function add()
{
    const a = Number(document.getElementById("num1").value);
    const b = Number(document.getElementById("num2").value);
    document.getElementById("result").innerHTML =a+b
    
}
//function counter()
//{
    //count++ 
    //document.getElementById("clicker").innerHTML = count

//}

