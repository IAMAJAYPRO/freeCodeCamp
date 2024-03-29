const userInput = document.getElementById('user-input');
const checkBtn = document.querySelector('#check-btn');
const clearBtn = document.querySelector('#clear-btn');
const output = document.querySelector('#results-div');

let clearScreen=()=>{
    userInput.value=""
    output.textContent=""
}

clearBtn.onclick=clearScreen

let checkInput=()=>{
    const input = userInput.value
    if (input.length==0){
        alert("Please provide a phone number");
        output.textContent="Please provide a phone number"
    }else if(telephoneCheck(input)){
        output.textContent="Valid US number: "+input
    }else{
        output.textContent="Invalid US number: "+input
    }

}
checkBtn.onclick=checkInput

function telephoneCheck(str) {
    let pattern=/^1?[ -]?(\d{3}|\(\d{3}\))[ -]?\d{3}[ -]?\d{4}$/ 
    //xd was missing +1
  
    return pattern.test(str);
  }
  
