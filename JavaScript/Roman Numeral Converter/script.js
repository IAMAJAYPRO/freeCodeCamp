const numberInput = document.getElementById('number');
const convertButton = document.querySelector('#convert-btn');
const output = document.querySelector('#output');

function clearOutput() {
    output.innerText = '';
    output.classList.remove('alert');
};

function isvalid(str, int) {
    let outtext;
    console.log(str,":",int,":",/[e.]/i.test(str))
    switch (true) {
        case (/[e.]/i.test(str)||!str):
            outtext = "Please enter a valid number"
            break
        case (int > 3999):
            outtext = "Please enter a number less than or equal to 3999";
            break;
        case (int < 1):
            outtext = "Please enter a number greater than or equal to 1";
            break;
        default:
            // no errors
            return true
    }
    output.innerText = outtext
    output.classList.add("alert");
    return false
}

function convertOut() {
    let str = numberInput.value
    // Flag variable to track if any case passes
    let int = parseInt(str)
    

    if (!isvalid(str,int)){
        return
    }
    clearOutput()
    let roman = convertToRoman(int)
    output.innerText = roman
}


convertButton.onclick = convertOut
function convertToRoman(num) {
    const val = [
        1000, 900, 500, 400,
        100, 90, 50, 40,
        10, 9, 5, 4,
        1
    ]
    const syb = [
        "M", "CM", "D", "CD",
        "C", "XC", "L", "XL",
        "X", "IX", "V", "IV",
        "I"
    ]
    let cur = 0
    let roman = ""
    for (let i = 0; i < val.length; i++) {
        while (cur < num & (num - cur) >= val[i]) {
            // =val[i] because least value will be 1
            cur += val[i]
            roman += syb[i]
        }
    }
    //console.log(roman,num)
    return roman;
}



