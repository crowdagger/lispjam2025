(use-modules (hoot ffi)
             (web dom)
             (sif ui)
             (sif character)
             (sif scene))


(define story (get-element-by-id "story"))
(define toto (make-character "Toto" "#FF0000"))

(message "Foo!")
(toto "Bar!")
(message "Plop")
(toto "Coin")
;(append-child! story (make-text-node "Hello, world!"))

;(append-html! story (format #f "<b>POUET</b> ~a" f))
