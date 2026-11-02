let p1choice = ""
let p2choice = ""

let p1score = 0
let p2score = 0

const p1cb = document.getElementById("player1choice")
const p2cb = document.getElementById("player2choice")

const p1scpre = document.getElementById("p1score")
const p2scpre = document.getElementById("p2score")

const p1card = document.getElementById("player1choice")
const p2card = document.getElementById("player2choice")

const choices = {
    rock : "Rock",
    paper: "Paper",
    scissors: "Scissors"
}

document.addEventListener("keydown", function(event){
    const key = event.key.toLowerCase()
    if(key === "a"){
        setp1choice("rock")
    }else if(key == "s"){
        setp1choice("paper")
    }else if(key == "d"){
        setp1choice("scissors")
    }
    if(key === "j"){
        setp2choice("rock")
    }else if(key == "k"){
        setp2choice("paper")
    }else if(key == "l"){
        setp2choice("scissors")
    }

    if(p1choice !== "" && p2choice !== ""){
        
    }
})
