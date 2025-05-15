(define-module (cards card))
(export <card>
        card-satisfies?
        card-color
        card-value)
(import (oop goops)
        (ice-9 format)
        (ice-9 optargs))

;; Basic card
;;
;; Color is a list of colors. Typical colors:
;; * red/heart: heal/empathy
;; * blue/club: (blunt) offense
;; * black/spade: (pierce) offense
;; * yellow/diamond: defense
;;
;; A card might have more than one color
(define-class <card> ()
  (color #:init-value '()
         #:init-keyword #:color
         #:getter card-color)
  (value #:init-value 0
         #:init-keyword #:value
         #:getter card-value)
  (name #:init-value #f
        #:getter card-name
        #:init-keywod #:name))


;; Method used wher (make <card>) is called
(define-method (initialize (c <card>) initargs)
  (next-method)

  ;; Set default name if name is not set
  (unless (slot-ref c 'name)
    (slot-set! c 'name
               (format #f "~a of ~a"
                       (slot-ref c 'value)
                       (slot-ref c 'color)))))


(define (card-satisfies? card color value)
  "Returns #t if a card satifies both color and value conditions, #f else

* color must be a (possibly empty) list of colors
* value must be a number. All cards satisfy a value of 0

"
  (unless (list? color)
    (error "Color must be a list" color))
  (unless (number? value)
    (error "Value must be a number" value))
  (and
   (card-satisfies-color? card color)
   (>= (card-value card) value)))
  
(define (card-satisfies-color? card color)
  (if (null? color)
      #t
      (and (memq (car color)
                 (card-color card))
           (card-satisfies-color? card (cdr color)))))


(define c (make <card> #:color '(heart) #:value 2))
