(define-module (sif scene)
  #:export (f            
            define-scene
            call-scene))

;; define-scene macro
;;
;;
;; ;; What we want
;; (define-scene some-scene
;;   (display "Hello!")
;;   (display "How are you?")
;;   (choice
;;    ("Well" (display "Great"))
;;    ("Not so well" (display "Oh :(")))
;;   (display "I must go..."))
;;
;; ;; transformed to
;; (define some-scene
;;   (vector
;;    (lambda () (display "Hello!"))
;;    (lambda () (display "How are you?"))
;;    (lambda () (user-choice '("Well" "Not so well")))
;;    (lambda (input)   (cond
;;                       ((equal input 0) (display "Great"))
;;                       ((equal input 1) (display "Oh :("))
;;    (else (invalid-input))))))

(define-syntax helper
  (syntax-rules ()
    ((_ exp) (lambda* (#:optional (input #f)) exp))))

(define-syntax %outer
  (syntax-rules ()
    ((_ name (done ...) ())
     (define name
       (vector done ...)))
    ((_ name (done ...) (todo todo* ...))
     (%outer name (done ... (helper todo)) (todo* ...)))
    ))

(define-syntax define-scene
  (syntax-rules ()
    ((_ name exp ...)
     (%outer name () (exp ... #f)))))


(define* (call-scene scene state #:optional (input #f))
  "Call the appropriate passage of a scene according to the current state

Returns either a new state, or #f is story has ended."
  (let ([ret ((vector-ref scene state) input)])
    (if ret
        (+ 1 state)
        (begin
          ;(display "Story ended\n")
          #f))))

(cond-expand
 (hoot
  (define f 42))
 (else
  (define f 0)))



