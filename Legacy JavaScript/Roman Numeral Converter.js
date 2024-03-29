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

convertToRoman(5555);