(define-module (sif ui)
  #:use-module (web dom)
  #:export (message
            raw-message))


(define (raw-message msg)
  "Display a HTML message to div 'story'"
  (append-html! (get-element-by-id "story") msg))


(define* (message msg #:optional (who #f))
  "Adds HTML formatting and call raw-message"
  ;; TODO: escape HTML
  (raw-message (format #f "<p>~a~a</p>"
                       (if who
                           "TODO: "
                           "")
                       msg)))
  
