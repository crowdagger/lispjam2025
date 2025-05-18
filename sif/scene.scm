(define-module (sif scene)
  #:use-module (ice-9 match)
  #:use-module (sif ui)
  #:use-module (sif state)
  #:export (menu
            define-scene
            call-scene
            scene-handler!))

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

(define-syntax menu (syntax-rules ()))

(define-syntax helper
  (syntax-rules ()
    ((_ (menu msg opt)) (lambda* (#:optional (input #f))
                          (raw-menu msg opt input)))
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
     (%outer name () (exp ... 'end)))))


(define* (call-scene scene state #:optional (input #f))
  "Call the appropriate passage of a scene according to the current state

Returns either a new state, or #f is story has ended."
  (let ([ret ((vector-ref scene state) input)])
    (if ret
        (+ 1 state)
        (begin
          ;(display "Story ended\n")
          #f))))

  
(define* (scene-handler! state #:optional (input #f))
  "Call the appropriate passage of a scene according to the current state

This function modifies the state"
  (let* ([scene (state-scene state)]
         [index (state-index state)]
         [ret ((vector-ref scene index) input)])
    (match ret
      ['continue
       (state-set-index! state (+ 1 index))
       ret]
      ['repeat
       ret]
      ['end
       ;; Todo
       #f])))
