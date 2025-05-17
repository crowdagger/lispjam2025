(use-modules (hoot ffi)
             (web dom)
             (sif ui)
             (sif character-data)
             (sif scene))


(define story (get-element-by-id "story"))
(define toto (make-character-data "Toto" "#FF0000"))

(message "Foo!")
(message "Bar" toto)
(append-child! story (make-text-node "Hello, world!"))

(append-html! story (format #f "<b>POUET</b> ~a" f))
