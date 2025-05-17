(import (cards card)
        (sif ui)
        (sif character)
        (ice-9 format))

(define c (make-card '(heart) 2))

(display c)
(newline)

(define toto (make-character "Toto"))

(toto "Plop")
