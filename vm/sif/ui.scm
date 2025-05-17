(define-module (sif ui)
  #:export (message))

(define (message msg)
  "Display a text message"
  (display msg)
  (newline))
