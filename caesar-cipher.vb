Imports System

Module Program

  ' helper function to cipher one char of a string array in a (forEach / Map)
  Private Function ShiftChar(charIn As Char, nShifts As Integer) As Char

    ' handle upper or lower case
    Dim lCase = If(Asc(charIn) <= 90, 65, 97)

    Return Chr(lCase + (((Asc(charIn) + nShifts - lCase) Mod 26)))
  End Function

  ' encrypt a string with a caesar cipher
  Private Function Encrypt(strIn As String, nShifts As Integer) As String

    ' handle a large shift amount 
    Dim k As Integer = If(nShifts >= 26, nShifts Mod 26, nShifts)

    ' apply shiftChar to all members of strIn char array.
    Return New String(strIn.Select(Function(el) ShiftChar(el, k)).ToArray())

  End Function

  ' decrypt a string with a caesar cipher
  Private Function Decrypt(strIn As String, nShifts As Integer) As String

    Dim k As Integer = If(nShifts >= 26, nShifts Mod 26, nShifts)

    Return Encrypt(strIn, 26 - k)

  End Function

  Sub Main(args As String())

    Const inputString As String = "alwaysLookOnTheBrightSideOfLife"
    Const shifts As Integer = 5

    Dim ciphered As String = Encrypt(InputString, shifts)
    Dim deciphered As String = Decrypt(ciphered, shifts)

    Console.WriteLine(inputString + ", " + Str(shifts))
    Console.WriteLine(ciphered)
    Console.WriteLine(deciphered)

  End Sub

End Module