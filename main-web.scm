(use-modules (hoot ffi)
             (web dom)
             (ui ui)
             (sif scene))


(define story (get-element-by-id "story"))

;(message "Foo!")
;(message "Bar")
(append-child! story (make-text-node "Hello, world!"))

(append-html! story (format #f "<b>POUET</b> ~a" f))
