(define-module (sif ui)
  #:use-module (sif character-data)
  #:use-module (ice-9 readline)
  #:export (message
            clear-screen
            raw-message
            user-choices))

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
;  (display "...")
  (newline))

(define (clear-screen)
  (display "TODO"))


(define (user-choices choices)
  (let lp ([counter 0]
           [lst choices])
    (unless (null? lst)
      (let ([msg (car (car lst))])
        (format #t "~a: ~a\n"
                counter
                msg)
        (lp (+ 1 counter)
            (cdr lst))))))
