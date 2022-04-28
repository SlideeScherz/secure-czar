object Main extends App {
 
  var inputString: String = "HelloWorld";
  var shifts: Int = 4;
  
  var ciphered: String = encrypt(inputString, shifts);
  var deciphered: String = encrypt(ciphered, 26 - shifts);

  println("Encrypt: " + inputString + " => " + ciphered);
  println("Decrypt: " + ciphered + " => " + deciphered);
  solve(deciphered);

  //encrypt a string 
  def encrypt(s: String, shiftAmt: Int) : String = {

    var result: String = "";
    var asciiHead: Int = 0;      
    var key: Int = 0;
    var k: Int = shiftAmt % 26; //Read Parameter since theyre immuteable, handle overflow
    var i: Int = 0; //Iterators must be initialized
    
    //handle negative modulus result
    if (k < 0) k = 26 - (k * -1);

    // Zero Indexing is back 
    for(i <- 0 to s.length() -1){

      //Extract 1 Char and convert to ASCII Code
      key = s.charAt(i).toInt;

      //Correct for capitalization
      asciiHead = if (key > 90) 97 else 65;

      //Algo
      key = ((key + k - asciiHead) % 26) + asciiHead;

      //convert back Char and Concat to result String
      result = result + key.toChar;
    }
    
    return result;
  }

  def solve(s: String) : Unit = {

    var i: Int = 0; //Iterators must be initialized

    println("Solve: ");

    for(i <- 1 to 26){
      println(i + ": " + encrypt(s, 26 - i));
    }
  }
}