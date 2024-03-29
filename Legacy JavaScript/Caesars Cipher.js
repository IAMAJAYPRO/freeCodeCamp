const alphabets="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
function rot13(str) {
  let decrypted_string=""
  for (let chr of str){
    
    if (/[A-Z]/i.test(chr)){
      const new_index=(alphabets.indexOf(chr)+13)%26 // new index shifted value
      decrypted_string+=alphabets[new_index] //decrypted character
      // console.log(new_index)
    } else {
      decrypted_string+=chr
    }
  }
  console.log(decrypted_string , str )
  return decrypted_string;

}

rot13("SERR PBQR PNZC");