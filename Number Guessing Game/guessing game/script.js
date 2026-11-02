var target = Math.floor(Math.random()*100)+1;
var guessCount = 0;


function checkGuess()
{
    var g = Number(document.getElementById("guessInput").value)

    guessCount++;
    document.getElementById("count").innerHTML= guessCount;

    var differ = target - g;
    var absDiffer = Math.abs(differ)

    var brightness = 255 - (absDiffer*5)

    if (brightness<0){
        brightness = 0;
    }
    if(differ>0){
        document.getElementById("light").style.backgroundColor = "rgb(0, "+brightness+",0)"

    }
    else if(differ<0){
        document.getElementById("light").style.backgroundColor = "rgb("+brightness+",0,0)";


    }

    else {
        document.getElementById("light").style.backgroundColor = "gold"


        document.getElementById("message").innerHTML = "Correct Guess!"
        
    

    }
}