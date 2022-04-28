with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure decrypt is

  inputString : String := "rywIxyvj";
  i : Integer := 1; 
  k : Integer := 26 - 10000;  
  key, asciiHead, n : Integer;

--main
begin

n := inputString'length;

  for i in 1..n loop 
    
    key := Character'POS(inputString(i));

    --evaluate case
    if key > 90 then                            
      asciiHead := 97;
    else             
      asciiHead := 65;                               
    end if;                                         

    --cipher algo
    key := ((key + k - asciiHead) mod 26) + asciiHead;
    
    inputString(i) := Character'VAL(key);
  end loop;

  Put("decrypt: "); 
  Put(inputString); New_Line;

end decrypt;