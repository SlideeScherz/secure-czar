function caesarCipher(s, k) {
  //create output string
  let res = "";
  let asciiHead = 0;
  let key = 0;

  const sArr = [...s];

  //get ASCII + K and add to string that we will return
  for (let i = 0; i < sArr.length; i++) {
    const char = sArr[i];

    //convert to ASCII integer (base 10)
    key = char.charCodeAt(0);

    //ignore special characters
    if ((key >= 65 && key <= 90) || (key >= 97 && key <= 122)) {
      //case
      asciiHead = key >= 65 && key <= 90 ? 65 : 97;

      //algo
      key = ((key + k - asciiHead) % 26) + asciiHead;
    }

    //convert back to char and concat
    res += String.fromCharCode(key);
  }

  return res;
}

const s =
  "https://github.com/SlideeScherz/functionalc/blob/main/language-project-scherzer.pdf";
const k = 5;
const result = caesarCipher(s, k);

const decrypted = caesarCipher(result, 26- k);

console.log(result);
console.log(decrypted);
