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
  (newline))

(define* (raw-menu msg options #:optional (input #f))
  "Display a prompt for options if no input is given, else choose according to input"
;  (format #t "raw-menu called with input ~s\n" input)

  (if input
      (let ([input (string->number input)])
        (if (and input
                 (>= input 0)
                 (< input (length options)))
            (let ([choice (list-ref options input)])
              ((cadr choice)))
            (raw-menu msg options)))
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


;; (define test-opt (list (list "Go left" (lambda () (display "Going left")))
;;                        (list "Go right" (lambda () (display "Going right")))))

;; (raw-menu "Choice" test-opt)


;; (raw-menu "Choice" test-opt "0")
;; (raw-menu "Choice" test-opt "1")
;; (raw-menu "Choice" test-opt "foo")

