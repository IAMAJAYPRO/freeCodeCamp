function telephoneCheck(str) {
  let pattern=/^1?[ -]?(\d{3}|\(\d{3}\))[ -]?\d{3}[ -]?\d{4}$/ 
  //xd was missing +1

  return pattern.test(str);
}

telephoneCheck("555-555-5555");