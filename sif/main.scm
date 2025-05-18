(define-module (sif main)
  #:use-module (sif scene)
  #:use-module (sif state)
  #:export (sif-init
            sif-main
            *state*))

(define *state* #f)

(define (sif-init scene)
  (set! *state* (init-state scene)))

(define* (sif-main #:optional (input #f))
  (display *state*)
  (newline)
  (scene-handler! *state* input))
