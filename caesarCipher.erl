-module(prog).
-export([main/2]).
 
%% shift one char
cipherChar(Char,Key) when (Char >= $A) and (Char =< $Z) or
                   (Char >= $a) and (Char =< $z) ->
  Offset = $A + Char band 32,
  N = Char - Offset,
  Offset + (N + Key) rem 26;
 
%% handle large shift and negative.
key(Key) when Key < 0 ->
  26 + Key rem 26;
key(Key) when Key > 25 ->
  Key rem 26;
key(Key) ->
  Key.
 
main(inputString, Key) ->
  Encode = key(Key),
  Decode = key(-Key),
 
  io:format("inputString ----> ~s~n", [inputString]),
 
  ciphered = lists:map(fun(Char) -> cipherChar(Char, Encode) end, inputString),
  io:format("ciphered ---> ~s~n", [ciphered]),
 
  inputString = lists:map(fun(Char) -> cipherChar(Char, Decode) end, ciphered).

%% prog:main("helloWorld", 4).