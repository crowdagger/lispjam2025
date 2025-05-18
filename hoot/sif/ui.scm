(define-module (sif ui)
  #:use-module (sif character-data)
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
                           (format #f "<span class = 'character-name' ~a>
~a
</span>: "
                                   (if (character-color who)
                                       (format #f "style = \"color: ~a;\" "
                                               (character-color who))
                                       "")
                                   (character-name who))
                           "")
                       msg))
  (post-message))


;; Adds a link to display next message
(define (post-message)
  (set-html! (get-element-by-id "user-input")
             "<p><a>Next</a></p>"))
