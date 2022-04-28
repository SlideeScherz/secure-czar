object Main extends App {
 
  var inputString: String = "bigShift";
  var shifts: Int = 10000;
  
  var ciphered: String = encrypt(inputString, shifts);
  var deciphered: String = decrypt(ciphered, shifts);
  
  println("Encrypt: " + inputString + " => " + ciphered);
  println("Decrypt: " + ciphered + " => " + deciphered);

  solve(ciphered, 0);

  // encrypt a string 
  def encrypt(strIn: String, shiftAmt: Int) : String = {

    var asciiHead: Int = 0;      
    var k: Int = shiftAmt % 26; // handle overflow
    
    // handle negative shift amount
    if (k < 0) k = 26 - (k * -1);

    return strIn.map(c => {

      // correct for capitalization
      asciiHead = if (c.toInt > 90) 97 else 65;

      // algo and convert to char
      (asciiHead + ((c.toInt + k - asciiHead) % 26)).toChar;
    })
  }

  // decrypt a string 
  def decrypt(strIn: String, shiftAmt: Int) : String = encrypt(strIn, 26 - shiftAmt);

  // solve all shift combinations to find readable english
  def solve(strIn: String, shiftAmt: Int) : Boolean = {

    var itr: Int = shiftAmt + 1;

    if(itr == 26){
      return true;
    }

    println("Solve: " + itr + " => " + strIn);
    solve(decrypt(strIn, 1), itr);
    return false;
  }
}
