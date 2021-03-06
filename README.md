# secure-czar

_To enjoy simple programming done in a variety of early procedural programming languages._

Functional and procedural implementations of a caesar cipher

## Caesar Cipher encryption

Encode a String messge by offsetting each charactar by an amount specified by `k`

![img](https://media.geeksforgeeks.org/wp-content/uploads/ceaserCipher.png)

### Cipher

1. Get the ASCII value of each Character `key`

```js
const asciiCodes = [...strIn].map((char) => char.charCodeAt(0));
```

2. Determine the case of the character

```js
const caseOf = (key) => (key <= 90 ? 65 : 97);
```

3. then perform the following algorithm on char which

- shifts the character by `k`
- handles overflow of alphabet

```js
const shift = (key, num) =>
  caseOf(key) + ((key + shiftN(num) - caseOf(key)) % 26);
```

#### Decipher

Decode an encrypted string
Use the same algorithm as Cipherm but change parameter `k` to
`26 - k`

```js
const deciphered = cipher(cipherOutput, 26 - shifts);
```

#### Solve

Test shifts 0-26 to identify legible English

```js
function solve(strIn) {
  for (let i = 1; i < 26; i++) {
    cipher(strIn, 26 - i);
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

MIT 2022

[ideone]: https://ideone.com/
[repo]: https://github.com/SlideeScherz/programming-in-the-past/pulls
