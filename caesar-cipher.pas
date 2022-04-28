program caesarCipher;
var
shifts: integer;
ciphered, deciphered, inputstring: string;

(*Perform a Caesar Cipher to a string*)
function encrypt(s: string; k: integer): string;
var
i, key, asciiHead: integer; (*Local Method vars*)

begin  

  (*Handle large cases of shift*)
  if k < 26 then k := 26 - (-1 * (k mod 26));

  (*Parse input string and ciph each. Char indexing begins at 1*)
  for i := 1 to length(s) do
  begin

    (*Extract one char and convert to ASCII*)
    key :=  ord(s[i]); 

    (*Assign asciiHead for uppercase or lowercase*)
    if key > 90 then asciiHead := 97 else asciiHead := 65; (*No semi colon if else is next!*)

    (*Algo*)
    key :=  ((key + k - asciiHead) mod 26) + asciiHead;
    
    (*ASCII Back to Char and write over input string*)
    s[i] := char(key);

  end;  

  encrypt := s;

end;

(*Output all 26 combinations of the shift to recognize a message*)  
procedure solve(s: string); 
var
i: integer;

begin

  writeln('Solve: ');

  for i := 1 to 26 do
  begin
    writeln(i, ': ', encrypt(s, 26 - i));
  end;

end;  

(*Main*)
begin

  inputstring := 'theQuickBrownFoxJumpedOverTheLazyDog';
  shifts := 10000;

  (*encrypt a string using a caesar cipher*)
  ciphered := encrypt(inputstring, shifts); 
  writeln('Encrypt: ', inputstring, ' => ' , ciphered);

  (*Decrypt what we just ciphered*)
  deciphered := encrypt(ciphered, 26 - shifts); 
  writeln('Decrypt: ', ciphered, ' => ', deciphered);

  solve(ciphered);

end.