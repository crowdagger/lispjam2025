(define-module (ui ui)
  #:use-module (web dom)
  #:export (message))

(define (message msg)
  "Display a text message"
  (append-child! (document-body) (make-text-node msg)))


