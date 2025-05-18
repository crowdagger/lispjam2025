(define-module (sif ui)
  #:use-module (sif character-data)
  #:use-module (sif scene)
  #:use-module (web dom)
  #:use-module (scheme write)
  #:use-module (hoot ffi)
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
  (post-message)
  'continue)


;; Adds a link to display next message
(define (post-message)
  (set-html! (get-element-by-id "user-input")
             "<p><a href = '#' id = 'next-link'>Next</a></p>")
  (add-event-listener! (get-element-by-id "next-link")
                       "click"
                       (procedure->external
                        (lambda (event)
                          (display "???")
                          (set-html! (get-element-by-id "next-link")
                                     ""))))
  )
