(defun cipherChar (ch key)
    (let* ((c  (char-code  ch)) (lower (char-code #\a)) (upper (char-code #\A)) 
        (asciiHead (cond ((<= lower c (char-code #\z)) lower) 
                    ((<= upper c (char-code #\Z)) upper) 
                    )))
    (if asciiHead (code-char (+ (mod (+ (- c asciiHead) key) 26) asciiHead)) ch)))
 
(defun encrypt (str key)
    (map 'string #'(lambda (c) (cipherChar c key)) str))
 
(defun decrypt (str key) (encrypt str (- key)))
 
(let* ((inputString "bigShift")
        (shifts 10000)
        (ciphered (encrypt inputString shifts))
        (deciphered (decrypt ciphered shifts)))
    (format t "Input String => ~a ~%" inputString)
    (format t "Encrypt => ~a ~%" ciphered)
    (format t "Decrypt => ~a ~%" deciphered))