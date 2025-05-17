(define-module (sif ui)
  #:use-module (web dom)
  #:export (message))


(define (message msg)
  "Display a HTML message to div 'story'"
  (append-html! (get-element-by-id "story") msg))


