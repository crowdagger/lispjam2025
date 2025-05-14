(define-module (cards card))
(export <card>)
(import (oop goops)
        (ice-9 optargs))

;; Basic card
(define-class <card> ()
  (color #:init-value #f
         #:init-keyword #:color
         #:getter card-color)
  (value #:init-value 0
         #:init-keyword #:value
         #:getter card-value)
  (name #:init-value #f
        #:init-keywod #:name))
  
