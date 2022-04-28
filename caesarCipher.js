// handle large shift
const shiftNum = (nShift) => (nShift > 26 ? nShift % 26 : nShift);

// determine case
const getCase = (key) => (key.charCodeAt(0) <= 90 ? 65 : 97);

// input a string to be encrypted with a caesar cipher
const encrypt = (strIn, nShift) => {
  return [...strIn]
    .map((el) => {
      // cipher and convert to string
      return String.fromCharCode(
        getCase(el) + ((el.charCodeAt(0) + shiftNum(nShift) - getCase(el)) % 26)
      );
    })
    .join(""); // convert back to string
};

// input a string to be decrypted with a caesar cipher
const decrypt = (strIn, nShift) => {
  return encrypt(strIn, 26 - shiftNum(nShift));
};

// call encrypt untill readable english is recognized
const solve = (strIn, itr) => {
  if (itr === 26) return;

  itr++;

  console.log(`${itr}: ${strIn}`);
  solve(decrypt(strIn, 1), itr);
};

const inputString = "helloWorld";
const shifts = 4;

const ciphered = encrypt(inputString, shifts);
const deciphered = decrypt(ciphered, shifts);

console.log(`Encrypt: ${inputString} => ${ciphered}`);
console.log(`Dencrypt: ${ciphered} => ${deciphered}`);
solve(ciphered, 0);
