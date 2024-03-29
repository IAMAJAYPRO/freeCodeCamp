function palindrome(str) {
  str=str.toLowerCase()
  let normal=str.replace(/[^a-zA-Z0-9]/g,"") // remove non alphanumeric
  let reversed=normal.split("").reverse().join("")
  // console.log (normal,reversed)
  
  return normal===reversed;
}

palindrome("eye");