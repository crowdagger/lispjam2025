(define-module (sif ui)
  #:export (message
            raw-message))

(define (raw-message msg)
  "Display a text message"
  (display msg)
  (newline))

(define* (message msg #:optional (who #f))
  "Adds HTML formatting and call raw-message"
  ;; TODO: wrap lines, ANSI color, stuff
  (raw-message (format #f "~a~a"
                       (if who
                           "TODO: "
                           "")
                       msg)))
