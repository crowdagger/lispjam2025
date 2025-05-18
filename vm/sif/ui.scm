(define-module (sif ui)
  #:use-module (sif character-data)
  #:use-module (ice-9 readline)
  #:export (message
            raw-message
            raw-menu))

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

(define* (raw-menu msg options #:optional (input #f))
  "Display a prompt for options if no input is given, else choose according to input"
  (if input
      (display "TODO")
      (begin
        (display msg)
        (newline)
        (let lp ([index 0]
               [options options])
        (if (null? options)
            ; we're done
            'repeat
            (begin
              (format #t "~a: ~a\n"
                      index
                      (car (car options)))
              (lp (+ 1 index)
                  (cdr options))))))))


(define test-opt '(("Go left" (lambda () (display "Going left")))
                   ("Go right" (lambda () (display "Going right")))))

(raw-menu "Choice" test-opt)
