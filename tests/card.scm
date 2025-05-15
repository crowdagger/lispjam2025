(import (srfi srfi-64)
        (oop goops)
        (cards card))

(test-begin "card")
(test-group "basis"
  (define c (make <card> #:color '(heart) #:value 2))
  (test-eq #t (card-satisfies? c '() 0))
  (test-eq #t (card-satisfies? c '() 2))
  (test-eq #f (card-satisfies? c '() 3))
  (test-eq #t (card-satisfies? c '(heart) 0))
  (test-eq #f (card-satisfies? c '(spade) 0)))
(test-end "card")
