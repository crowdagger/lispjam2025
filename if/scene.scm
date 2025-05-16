(define-module (if scene))

(export define-scene)


(define-syntax helper
  (syntax-rules ()
    ((_ exp) (lambda* (#:optional (input #f)) exp))))

(define-syntax %outer
  (syntax-rules ()
    ((_ name (done ...) ())
     (define name
       (list done ...)))
    ((_ name (done ...) (todo todo* ...))
     (%outer name (done ... (helper todo)) (todo* ...)))
    ))

(define-syntax define-scene
  (syntax-rules ()
    ((_ name exp ...)
     (%outer name () (exp ...)))))
