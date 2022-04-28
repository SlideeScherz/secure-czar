program caesarcipher
  implicit none
  integer :: shifts
  character(len = 50) :: inputstring, encrypt, decrypt, ciphered, deciphered
  
  inputstring = 'theQuickBrownFoxJumpedOverTheLazyDog'
  shifts = 4
 
  ciphered = encrypt(inputstring, shifts)
  print *, 'Encrypt ', trim(inputstring), ' => ', trim(ciphered)

  deciphered = encrypt(ciphered, 26 - shifts)
  print *, 'Decrypt ', trim(ciphered), ' => ', trim(deciphered)

  call solve(ciphered)

end program caesarcipher

function encrypt(s, k)
  implicit none

  character(len = 50) :: encrypt, result ! function return type and return object          
  character(len = 50), intent( in ) :: s ! Input String
  integer, intent( in ) :: k ! shifts 
  integer :: key, i, asciihead ! non-input vars
  
  result = s ! convert immutable parameter to writeable obj

  ! Loop through each character and cipher
  do i = 1, len(trim(result)) 

    ! extract 1 character and convert to ascii
    key = iachar(s(i:i)) 

    ! TERNARY in fortran. determine if capital or lowercase. 
    asciihead = merge(97, 65, key > 90)
    
    ! cipher algo
    key = MODULO(key + k - asciihead, 26) + asciihead 

    ! convert back to char and concat result
    result = result(:i-1) // achar(key)  

  end do

  encrypt = result 
  
end function encrypt

subroutine solve(s) 
implicit none

  character(len = 50), intent (in) :: s     

  ! non input vars
  integer :: i 
  character(len = 50) :: encrypt ! must declare method outside scope
 
  print *, 'Solve: '

  ! guess all 26 combinations of the cipher to break the code
  do i = 1, 26
    print *, i, trim(encrypt(s, 26 - i))
  end do 
   
end subroutine solve