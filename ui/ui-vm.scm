(define-module (ui ui)
  #:export (message))

(define (message msg)
  "Display a text message"
  (display msg)
  (newline))
