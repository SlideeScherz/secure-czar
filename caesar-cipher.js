// handle large shift
const shiftN = (nShift) => (nShift > 26 ? nShift % 26 : nShift);

// determine case
const caseOf = (key) => (key <= 90 ? 65 : 97);

// perform shift on an ascii value
const shift = (key, num) => caseOf(key) + ((key + shiftN(num) - caseOf(key)) % 26);

// input a string to be encrypted with a caesar cipher
const encrypt = (strIn, nShift) => {
  // convert str to array and return its char code
  const codes = [...strIn].map((el) => el.charCodeAt(0));

  // cipher each char code
  const ciphed = codes.map((el) => shift(el, shiftN(nShift)));

  // convert back to char array
  const chars = ciphed.map((el) => String.fromCharCode(el));

  // array to string
  return chars.join("");
};

// input a string to be decrypted with a caesar cipher
const decrypt = (strIn, nShift) => encrypt(strIn, 26 - shiftN(nShift));

// call encrypt untill readable english is recognized
const solve = (strIn, itr) => {
  if (itr === 26) return;
  console.log(`Solve: ${itr}: ${strIn}`);
  solve(decrypt(strIn, 1), itr + 1);
};

const inputString = "helloWorld";
const shifts = 7;
const ciphered = encrypt(inputString, shifts);
const deciphered = decrypt(ciphered, shifts);

console.log(`Encrypted: ${inputString} => ${ciphered}`);
console.log(`Decrypted: ${ciphered} => ${deciphered}`);
solve(ciphered, 0);
