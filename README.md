# Programming In the past

_To enjoy simple programming done in a variety of early procedural programming languages._

## Caesar Cipher encryption

![alt text](https://media.geeksforgeeks.org/wp-content/uploads/ceaserCipher.png)

### Cipher

Encode a String messge by offsetting each charactar by an amount specified by ```k```
Get the ASCII value of each Character ```(key)``` , then perform the following algorithm on each which handles overflow of alphabet

```c
//uppercase or lowercase logic
int asciiHead = (key >= 65 && key <= 90) ? 65 : 97;
//algo to cipher
int key = ((key + k - asciiHead) % 26) + asciiHead;
```

#### Decipher

Decode an encrypted string
Use the same algorithm as Cipherm but change parameter ```k``` to
```26 - k```
```c
string ciphered = caesarCipher(inputString, shifts);
string deciphered = caesarCipher(ciphered, 26 - shifts);
```

#### Solve

Test shifts 0-26 to identify legible English

```c
function solve(s){
  for (let i = 1; i < 26; i++) {
    console.log(`Shift ${i}: ${caesarCipher(s, 26 - i)}`); 
  }
}
```

## Example usage

```sh
Encrypt: theQuickBrownFoxJumpedOverTheLazyDog = pdaMqeygXnksjBktFqilazKranPdaHwvuZkc
Dencrypt: pdaMqeygXnksjBktFqilazKranPdaHwvuZkc = theQuickBrownFoxJumpedOverTheLazyDog
Solve:
Shift 1: qebNrfzhYoltkCluGrjmbaLsboQebIxwvAld
Shift 2: rfcOsgaiZpmulDmvHskncbMtcpRfcJyxwBme
Shift 3: sgdPthbjAqnvmEnwItlodcNudqSgdKzyxCnf
Shift 4: theQuickBrownFoxJumpedOverTheLazyDog
Shift 5: uifRvjdlCspxoGpyKvnqfePwfsUifMbazEph
Shift 6: vjgSwkemDtqypHqzLworgfQxgtVjgNcbaFqi
Shift 7: wkhTxlfnEurzqIraMxpshgRyhuWkhOdcbGrj
Shift 8: xliUymgoFvsarJsbNyqtihSzivXliPedcHsk
Shift 9: ymjVznhpGwtbsKtcOzrujiTajwYmjQfedItl
Shift 10: znkWaoiqHxuctLudPasvkjUbkxZnkRgfeJum
Shift 11: aolXbpjrIyvduMveQbtwlkVclyAolShgfKvn
Shift 12: bpmYcqksJzwevNwfRcuxmlWdmzBpmTihgLwo
Shift 13: cqnZdrltKaxfwOxgSdvynmXenaCqnUjihMxp
Shift 14: droAesmuLbygxPyhTewzonYfobDroVkjiNyq
Shift 15: espBftnvMczhyQziUfxapoZgpcEspWlkjOzr
Shift 16: ftqCguowNdaizRajVgybqpAhqdFtqXmlkPas
Shift 17: gurDhvpxOebjaSbkWhzcrqBireGurYnmlQbt
Shift 18: hvsEiwqyPfckbTclXiadsrCjsfHvsZonmRcu
Shift 19: iwtFjxrzQgdlcUdmYjbetsDktgIwtAponSdv
Shift 20: jxuGkysaRhemdVenZkcfutEluhJxuBqpoTew
Shift 21: kyvHlztbSifneWfoAldgvuFmviKyvCrqpUfx
Shift 22: lzwImaucTjgofXgpBmehwvGnwjLzwDsrqVgy
Shift 23: maxJnbvdUkhpgYhqCnfixwHoxkMaxEtsrWhz
Shift 24: nbyKocweVliqhZirDogjyxIpylNbyFutsXia
Shift 25: oczLpdxfWmjriAjsEphkzyJqzmOczGvutYjb
```

## Comparison

- Some languages were better suited for this specific application than others.
- Too do a fair comparison for read / writeabiliy, a similar convention was taken for coding each.
- Comments on top of operations, each operation spaced out for its own line

## Contributions

- [IDEone] - Free online code editor and compiler

## License

### MIT

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

[IDEone]: <https://ideone.com/>
[Repo]: <https://github.com/SlideeScherz/programming-in-the-past/pulls>  
