(import (cards card)
        (sif ui)
        (sif character-data)
        (ice-9 format))

(define c (make-card '(heart) 2))

(display c)
(newline)

(define toto (make-character-data "Toto"))

(message "Plop" toto)
