with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure decrypt is

  inputString : String := "lippsAsvph";
  i : Integer := 1;
  i2 : Integer := 1;   
  key, asciiHead, n, k : Integer;

--main
begin

  Put("solve: "); 
  Put(inputString); New_Line;

  n := inputString'length;

  for i2 in 1..27 loop

    
    
    for i in 1..n loop 

      key := Character'POS(inputString(i));

      --evaluate case
      if key > 90 then                            
        asciiHead := 97;
      else             
        asciiHead := 65;                               
      end if;                                         

      --cipher algo
      key := ((key - 1 - asciiHead) mod 26) + asciiHead;
      
      inputString(i) := Character'VAL(key);
    end loop;
 
    Put(i2); Put(": "); 
    Put(inputString); New_Line;
  
  end loop;

end decrypt;