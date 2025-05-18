(import (cards card)
        (sif ui)
        (sif main)
        (sif scene)
        (sif state)
        (sif character)
        (ice-9 format))

(define toto (make-character "Toto"))

(define-scene scene-0
  (message "Test")
  (toto "Plop")
  (toto "Foo?"))

(display scene-0)
(newline)

(display *state*)
(newline)
(sif-init scene-0)
(display *state*)
(newline)

(while (sif-main)
  (display *state*)
  (newline))

(display "End!")
(newline)
