(import (cards card)
        (sif ui)
        (sif scene)
        (sif state)
        (sif character)
        (ice-9 format))

(define c (make-card '(heart) 2))

(display c)
(newline)

(define toto (make-character "Toto"))

(define-scene scene-0
  (message "Test")
  (toto "Plop")
  (toto "Foo?"))

(display scene-0)
(newline)

(define *state* (init-state scene-0))

(while (scene-handler! *state*)
  (display *state*)
  (newline))

(display "End!")
(newline)
