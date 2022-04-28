open System

let shiftNum = 4
let inputString = "HelloWorld"

// perform cipher on one char, convert back to char
let ciph key num head =
  (((key + num - head) % 26) + head) |> char 

// read case and return 65 or 97
let case char = 
  if Char.IsLower char then 97 else 65
  
let cipher strIn numShift =
  let shift c =
    let asciiHead = case c
    ciph (int c) numShift asciiHead
  String.map shift strIn
 
// combine the cipher and encrypt methods
// remeber when you call cipher you must also provide a string!
let encrypt s k = cipher s k
let decrypt s k = cipher s (26 - k) 

let rec solve s acc =
    if acc = 26 then ""
    else 
      printfn "%s " s
      solve (encrypt s 1) (acc + 1)

let ciphered = encrypt inputString shiftNum 
let deciphered = decrypt ciphered shiftNum 

Console.WriteLine(inputString)
Console.WriteLine(ciphered)
Console.WriteLine(deciphered)

Console.WriteLine()

let solveObj = solve ciphered 0