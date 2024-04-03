const textInput = document.querySelector("#text-input")
const resultText = document.querySelector("#check-val")
const checkButton = document.querySelector("#check-btn")

console.log()


//initialize


function checkPal() {
  let str = textInput.value
  console.log(str)
  if (str.length == 0) {
    alert("Please input a value")
    return
  }
  let result = palindrome(str)
  if (result) {
    resultText.innerText = str + " is a palindrome"
  }
  else { resultText.innerText = str + " is not a palindrome" }
}

checkButton.onclick = checkPal


function palindrome(str) {
  str = str.toLowerCase()
  let normal = str.replace(/[^a-zA-Z0-9]/g, "") // remove non alphanumeric
  let reversed = normal.split("").reverse().join("")
  // console.log (normal,reversed)

  return normal === reversed;
}

