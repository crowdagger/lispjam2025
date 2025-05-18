(define-module (sif ui)
  #:use-module (sif character-data)
  #:use-module (ice-9 readline)
  #:export (message
            raw-message))

(define (raw-message msg)
  "Display a text message"
  (display msg)
  (newline))

(define* (message msg #:optional (who #f))
  "Wrapper around raw-message"
  ;; TODO: wrap lines, ANSI color, stuff
  (raw-message (format #f "~a~a"
                       (if who
                           (format #f "~a: "
                                   (character-name who))
                           "")
                       msg))
  (post-message)
  'continue)

;; Wait for user input
(define (post-message)
  (display "...")
  (newline)
  (readline))
